#!/usr/bin/env bash
# =============================================================================
# traffic-test.sh — Envía múltiples requests para observar el balanceo
# Uso: ./scripts/traffic-test.sh [numero-de-requests]
# =============================================================================

REQUESTS="${1:-20}"
NGINX_URL="http://localhost:8085/api/instance"  # ← Nginx corre en 8085, no en 80

echo "=============================================="
echo "🔄 Traffic Test — $REQUESTS requests a Nginx"
echo "   URL: $NGINX_URL (Nginx en puerto 8085)"
echo "=============================================="
echo ""

BLUE_COUNT=0
GREEN_COUNT=0

for i in $(seq 1 "$REQUESTS"); do
    RESPONSE=$(curl -s "$NGINX_URL" 2>/dev/null || echo '{"instance":"ERROR","port":"?"}')
    INSTANCE=$(echo "$RESPONSE" | grep -o '"instance":"[^"]*"' | cut -d'"' -f4)
    PORT=$(echo "$RESPONSE" | grep -o '"port":"[^"]*"' | cut -d'"' -f4)

    printf "  Request #%02d → %-6s (puerto %s)\n" "$i" "$INSTANCE" "$PORT"

    if [[ "$INSTANCE" == "BLUE" ]]; then
        BLUE_COUNT=$((BLUE_COUNT + 1))
    elif [[ "$INSTANCE" == "GREEN" ]]; then
        GREEN_COUNT=$((GREEN_COUNT + 1))
    fi

    sleep 0.2
done

echo ""
echo "══════════════════════════════════════════════"
echo "📊 Resultados:"
echo "   BLUE  recibió: $BLUE_COUNT requests  ($(( BLUE_COUNT * 100 / REQUESTS ))%)"
echo "   GREEN recibió: $GREEN_COUNT requests ($(( GREEN_COUNT * 100 / REQUESTS ))%)"
echo "══════════════════════════════════════════════"
