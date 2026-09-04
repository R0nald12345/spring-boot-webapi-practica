#!/usr/bin/env bash
# =============================================================================
# e2e-test.sh — Pruebas End-to-End básicas
# Uso: ./scripts/e2e-test.sh <blue|green|nginx>
# =============================================================================
set -euo pipefail

TARGET="${1:-nginx}"

# Determinar URL base
case "$TARGET" in
    blue)  BASE_URL="http://localhost:8081" ;;  # BLUE en tu entorno
    green) BASE_URL="http://localhost:8082" ;;  # GREEN en tu entorno
    nginx) BASE_URL="http://localhost:8085" ;;  # Nginx en tu entorno (no usa el 80)
    *)
        echo "❌ Uso: $0 <blue|green|nginx>"
        exit 1
        ;;
esac

PASS=0
FAIL=0

assert_equals() {
    local test_name="$1"
    local expected="$2"
    local actual="$3"

    if [[ "$actual" == "$expected" ]]; then
        echo "   ✅ PASS: $test_name"
        PASS=$((PASS + 1))
    else
        echo "   ❌ FAIL: $test_name"
        echo "      Esperado: '$expected'"
        echo "      Obtenido: '$actual'"
        FAIL=$((FAIL + 1))
    fi
}

assert_contains() {
    local test_name="$1"
    local expected="$2"
    local actual="$3"

    if echo "$actual" | grep -q "$expected"; then
        echo "   ✅ PASS: $test_name"
        PASS=$((PASS + 1))
    else
        echo "   ❌ FAIL: $test_name"
        echo "      Se esperaba que contenga: '$expected'"
        echo "      Obtenido: '$actual'"
        FAIL=$((FAIL + 1))
    fi
}

echo "=============================================="
echo "🧪 E2E Tests — Objetivo: $TARGET"
echo "   URL Base: $BASE_URL"
echo "=============================================="
echo ""

# Test 1: Root endpoint
echo "Test 1: Root endpoint"
RESPONSE=$(curl -s "$BASE_URL/" 2>/dev/null || echo "FAILED")
assert_equals "GET / devuelve 'Hello CI/CD World!'" "Hello CI/CD World!" "$RESPONSE"

# Test 2: Health endpoint
echo ""
echo "Test 2: Health endpoint"
RESPONSE=$(curl -s "$BASE_URL/health" 2>/dev/null || echo "FAILED")
assert_equals "GET /health devuelve 'Server Healthy!'" "Server Healthy!" "$RESPONSE"

# Test 3: Instance endpoint exists
echo ""
echo "Test 3: Instance endpoint"
RESPONSE=$(curl -s "$BASE_URL/api/instance" 2>/dev/null || echo "FAILED")
assert_contains "GET /api/instance contiene 'instance'" "instance" "$RESPONSE"
assert_contains "GET /api/instance contiene 'port'" "port" "$RESPONSE"

# Test 4: HTTP status codes
echo ""
echo "Test 4: HTTP Status Codes"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/health")
assert_equals "GET /health retorna HTTP 200" "200" "$STATUS"

STATUS_404=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/ruta-inexistente")
assert_equals "GET /ruta-inexistente retorna HTTP 404" "404" "$STATUS_404"

# Resumen
echo ""
echo "══════════════════════════════════════════════"
echo "📊 Resultados E2E:"
echo "   ✅ Pasaron: $PASS"
echo "   ❌ Fallaron: $FAIL"
echo "══════════════════════════════════════════════"

if [[ $FAIL -gt 0 ]]; then
    echo ""
    echo "❌ E2E Tests FALLARON — No proceder con el switch de tráfico"
    exit 1
else
    echo ""
    echo "✅ Todos los E2E Tests pasaron — Instancia apta para recibir tráfico"
    exit 0
fi
