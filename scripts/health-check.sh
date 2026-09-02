#!/usr/bin/env bash
# =============================================================================
# health-check.sh — Verifica el estado de las instancias BLUE y GREEN
# Uso: ./scripts/health-check.sh
# =============================================================================
set -euo pipefail

BLUE_PORT=8080
GREEN_PORT=8081

check_instance() {
    local name="$1"
    local port="$2"

    echo "──────────────────────────────────"
    echo "🔍 Verificando instancia $name (puerto $port)..."

    # Health check
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
        "http://localhost:$port/health" 2>/dev/null || echo "000")

    if [[ "$HTTP_STATUS" == "200" ]]; then
        echo "   ✅ Estado: HEALTHY (HTTP $HTTP_STATUS)"

        # Obtener info de la instancia
        INSTANCE_INFO=$(curl -s "http://localhost:$port/api/instance" 2>/dev/null || echo '{}')
        echo "   📋 Info: $INSTANCE_INFO"
    else
        echo "   ❌ Estado: DOWN (HTTP $HTTP_STATUS)"
    fi
}

echo "=============================================="
echo "🏥 Health Check — Blue-Green Instances"
echo "=============================================="

check_instance "BLUE" "$BLUE_PORT"
check_instance "GREEN" "$GREEN_PORT"

echo "──────────────────────────────────"
echo ""
echo "💡 Para ver el tráfico actual de Nginx:"
echo "   curl http://localhost/api/instance"
