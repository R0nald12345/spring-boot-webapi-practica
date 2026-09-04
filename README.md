# Spring Boot WebAPI — CI/CD con Blue-Green Deployment

## Descripción
...

## Arquitectura
...

## Tecnologías
- Java 21, Spring Boot 3.2.5, Maven
- JUnit 5, JaCoCo
- GitHub Actions (CI/CD)
- Nginx (balanceador de carga)
- Bash scripts
- WSL Ubuntu (infraestructura local)

## Estrategia de Branching
- `main` → rama estable
- `feature/*` → desarrollo de funcionalidades

## Estrategia de Tagging (Semantic Versioning)
- `MAJOR.MINOR.PATCH`
- Tags se crean desde main después de merge

## Pipeline CI/CD
...

## Deployment — Blue-Green
...

## Scripts
| Script | Descripción |
|--------|-------------|
| `scripts/deploy-blue-green.sh <jar> <blue\|green>` | Deploya en la instancia indicada |
| `scripts/health-check.sh` | Verifica el estado de ambas instancias |
| `scripts/traffic-test.sh [N]` | Envía N requests y muestra distribución |
| `scripts/switch-traffic.sh <blue\|green>` | Cambia tráfico en Nginx |
| `scripts/rollback.sh <blue\|green>` | Rollback a la instancia estable |
| `scripts/e2e-test.sh <blue\|green\|nginx>` | Pruebas E2E |

## Rollback
...
