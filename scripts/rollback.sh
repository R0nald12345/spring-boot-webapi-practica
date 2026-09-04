#!/usr/bin/env bash
# =============================================================================
# rollback.sh — Rollback hacia la instancia estable anterior
# Uso: ./scripts/rollback.sh <blue|green>
#      (especificás la instancia ESTABLE, no la que falló)
# =============================================================================
set -euo pipefail

STABLE_ENV="${1:-blue}"

echo "=============================================="
echo "⏪ ROLLBACK — Revertiendo a instancia ${STABLE_ENV^^}"
echo "=============================================="
echo ""

# Cambiar el tráfico hacia la instancia estable
bash "$(dirname "$0")/switch-traffic.sh" "$STABLE_ENV"

echo ""
echo "🔍 Verificando que la instancia estable responde..."
# ⚠️ Puertos ajustados a tu entorno
if [[ "$STABLE_ENV" == "blue" ]]; then
    STABLE_PORT=8081
else
    STABLE_PORT=8082
fi

for i in {1..5}; do
    RESPONSE=$(curl -s "http://localhost:8085/api/instance" 2>/dev/null || echo '{}')
    echo "   Request $i → $RESPONSE"
    sleep 1
done

echo ""
echo "✅ Rollback completado. Tráfico apuntando a ${STABLE_ENV^^}"
echo ""
echo "⚠️  ACCIÓN REQUERIDA: Investigar y corregir la instancia que falló antes del próximo deploy."
