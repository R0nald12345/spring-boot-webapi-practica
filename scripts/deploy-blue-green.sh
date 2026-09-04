#!/usr/bin/env bash
# =============================================================================
# deploy-blue-green.sh — Blue-Green Deployment Script
# Uso: ./scripts/deploy-blue-green.sh <path-al-jar> <blue|green>
# =============================================================================
set -euo pipefail

# ── Argumentos ───────────────────────────────────────────────────────────────
JAR_PATH="${1:-}"
TARGET_ENV="${2:-green}"  # La instancia que vamos a actualizar

if [[ -z "$JAR_PATH" ]]; then
    echo "❌ Error: Debes especificar el path al JAR"
    echo "   Uso: $0 <path-al-jar> <blue|green>"
    exit 1
fi

# ── Configuración ─────────────────────────────────────────────────────────────
BASE_DIR="$HOME/blue-green"
BLUE_DIR="$BASE_DIR/blue"
GREEN_DIR="$BASE_DIR/green"
JAR_NAME="app.jar"

# Puerto según la instancia
# ⚠️ Puertos ajustados a tu entorno (Traefik ocupa el 80, Odoo ocupa 8068-8070)
if [[ "$TARGET_ENV" == "blue" ]]; then
    DEPLOY_DIR="$BLUE_DIR"
    PORT=8081
else
    DEPLOY_DIR="$GREEN_DIR"
    PORT=8082
fi

echo "=============================================="
echo "🚀 Blue-Green Deployment"
echo "   Instancia destino: ${TARGET_ENV^^}"
echo "   Puerto: $PORT"
echo "   JAR: $JAR_PATH"
echo "=============================================="

# ── Detener instancia anterior ─────────────────────────────────────────────
echo ""
echo "⏹️  Verificando si hay una instancia corriendo en puerto $PORT..."
PID=$(lsof -ti tcp:$PORT 2>/dev/null || true)

if [[ -n "$PID" ]]; then
    echo "   PID encontrado: $PID — deteniendo..."
    kill "$PID"
    sleep 3
    echo "   ✅ Instancia detenida"
else
    echo "   ℹ️  No hay ninguna instancia corriendo en el puerto $PORT"
fi

# ── Copiar el nuevo JAR ────────────────────────────────────────────────────
echo ""
echo "📦 Copiando nuevo JAR..."
cp "$JAR_PATH" "$DEPLOY_DIR/$JAR_NAME"
chmod 755 "$DEPLOY_DIR/$JAR_NAME"
echo "   ✅ JAR copiado en $DEPLOY_DIR/$JAR_NAME"

# ── Arrancar la nueva instancia ────────────────────────────────────────────
echo ""
echo "▶️  Arrancando instancia ${TARGET_ENV^^} en puerto $PORT..."
nohup java -jar "$DEPLOY_DIR/$JAR_NAME" \
    --server.port="$PORT" \
    --app.instance.name="${TARGET_ENV^^}" \
    > "$DEPLOY_DIR/logs/app.log" 2>&1 &

JAVA_PID=$!
echo "   PID del proceso Java: $JAVA_PID"

# ── Health Check ──────────────────────────────────────────────────────────
echo ""
echo "🔍 Esperando que la instancia esté lista..."
MAX_RETRIES=20
for i in $(seq 1 $MAX_RETRIES); do
    if curl -sf "http://localhost:$PORT/health" > /dev/null 2>&1; then
        echo "   ✅ Instancia ${TARGET_ENV^^} lista (intento $i/$MAX_RETRIES)"
        break
    fi
    echo "   ⏳ Intento $i/$MAX_RETRIES — esperando 3 segundos..."
    sleep 3

    if [[ $i -eq $MAX_RETRIES ]]; then
        echo "   ❌ La instancia no respondió después de $MAX_RETRIES intentos"
        echo "   📋 Últimas líneas del log:"
        tail -20 "$DEPLOY_DIR/logs/app.log"
        exit 1
    fi
done

echo ""
echo "🎉 Deployment de instancia ${TARGET_ENV^^} completado exitosamente"
echo "   Verificá con: curl http://localhost:$PORT/api/instance"
