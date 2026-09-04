#!/usr/bin/env bash
# =============================================================================
# switch-traffic.sh — Cambia el tráfico de Nginx hacia una instancia
# Uso: ./scripts/switch-traffic.sh <blue|green>
# =============================================================================
set -euo pipefail

TARGET="${1:-}"

if [[ -z "$TARGET" || ( "$TARGET" != "blue" && "$TARGET" != "green" ) ]]; then
    echo "❌ Error: Debés especificar 'blue' o 'green'"
    echo "   Uso: $0 <blue|green>"
    exit 1
fi

# ⚠️ Puertos ajustados a tu entorno
if [[ "$TARGET" == "blue" ]]; then
    PORT=8081
else
    PORT=8082
fi

NGINX_CONF="/etc/nginx/sites-available/spring-boot-webapi"

echo "=============================================="
echo "🔀 Cambiando tráfico hacia: ${TARGET^^} (puerto $PORT)"
echo "=============================================="

# Reemplazar el upstream en la configuración de Nginx
sudo sed -i "s|server 127.0.0.1:[0-9]*;|server 127.0.0.1:$PORT;|g" "$NGINX_CONF"

# Verificar que la configuración es válida
sudo nginx -t

# Recargar Nginx (sin downtime)
sudo nginx -s reload

echo ""
echo "✅ Tráfico redirigido hacia ${TARGET^^}"
echo "   Verificá con: curl http://localhost:8085/api/instance"
