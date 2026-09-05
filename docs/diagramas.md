# 📊 Diagramas del Proyecto Final CI/CD — draw.io

> **Diplomado DevOps · UAGRM**  
> Proyecto: `spring-boot-webapi` — Blue-Green Deployment con GitHub Actions

Cada sección contiene el código XML para importar directamente en [draw.io](https://app.diagrams.net/).  
**Cómo usar:** Copiá el bloque XML → en draw.io: `Extras > Edit Diagram` → pegá → `OK`.

---

## Índice de Diagramas

| # | Diagrama | Descripción |
|---|----------|-------------|
| [1](#diagrama-1) | Arquitectura General del Sistema | Vista completa de todos los componentes |
| [2](#diagrama-2) | Estrategia de Branching (Git Flow) | Flujo de ramas feature → main |
| [3](#diagrama-3) | Pipeline CI — GitHub Actions | Pasos del workflow `maven.yml` |
| [4](#diagrama-4) | Flujo CI/CD Completo | Desde commit hasta producción |
| [5](#diagrama-5) | Blue-Green Deployment | Arquitectura de instancias con Nginx |
| [6](#diagrama-6) | Flujo de Deployment Blue-Green | Secuencia deploy → switch → verify |
| [7](#diagrama-7) | Flujo de Rollback | Secuencia de recuperación ante fallo |
| [8](#diagrama-8) | Estrategia de Tagging y Versionamiento | Semver y su relación con Releases |

---

## Diagrama 1 — Arquitectura General del Sistema

Vista completa de todos los componentes: GitHub, Actions, Nginx y las instancias Blue/Green.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1654" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Arquitectura General — CI/CD Spring Boot Web API" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=20;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="300" y="20" width="900" height="40" as="geometry" />
    </mxCell>
    <mxCell id="zone-dev" value="DESARROLLADOR" style="swimlane;startSize=30;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=13;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="40" y="80" width="200" height="120" as="geometry" />
    </mxCell>
    <mxCell id="dev-box" value="Ronald&#xa;Windows 11 + WSL" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontSize=11;" vertex="1" parent="zone-dev">
      <mxGeometry x="20" y="50" width="160" height="50" as="geometry" />
    </mxCell>
    <mxCell id="zone-github" value="GITHUB" style="swimlane;startSize=30;fillColor=#e3f2fd;strokeColor=#1565c0;fontColor=#0d47a1;fontSize=13;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="300" y="80" width="560" height="300" as="geometry" />
    </mxCell>
    <mxCell id="branch-main" value="main" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=12;fontStyle=1;" vertex="1" parent="zone-github">
      <mxGeometry x="20" y="50" width="120" height="45" as="geometry" />
    </mxCell>
    <mxCell id="branch-feature" value="feature/*" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#42a5f5;fontColor=#ffffff;strokeColor=#1565c0;fontSize=12;" vertex="1" parent="zone-github">
      <mxGeometry x="160" y="50" width="120" height="45" as="geometry" />
    </mxCell>
    <mxCell id="pr-box" value="Pull Request" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e1f5fe;strokeColor=#0277bd;fontSize=11;" vertex="1" parent="zone-github">
      <mxGeometry x="300" y="50" width="120" height="45" as="geometry" />
    </mxCell>
    <mxCell id="tag-box" value="Tag v1.0.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;fontStyle=1;" vertex="1" parent="zone-github">
      <mxGeometry x="430" y="50" width="110" height="45" as="geometry" />
    </mxCell>
    <mxCell id="ga-box" value="GitHub Actions" style="swimlane;startSize=25;fillColor=#fce4ec;strokeColor=#c62828;fontColor=#b71c1c;fontSize=12;fontStyle=1;" vertex="1" parent="zone-github">
      <mxGeometry x="20" y="130" width="520" height="150" as="geometry" />
    </mxCell>
    <mxCell id="step-checkout" value="Checkout" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=10;" vertex="1" parent="ga-box">
      <mxGeometry x="10" y="40" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="step-jdk" value="Setup JDK 21" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=10;" vertex="1" parent="ga-box">
      <mxGeometry x="100" y="40" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="step-build" value="Build Maven" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=10;" vertex="1" parent="ga-box">
      <mxGeometry x="190" y="40" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="step-test" value="Unit Tests JUnit" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=10;" vertex="1" parent="ga-box">
      <mxGeometry x="280" y="40" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="step-coverage" value="Code Coverage JaCoCo" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=10;" vertex="1" parent="ga-box">
      <mxGeometry x="370" y="40" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="artifact-jar" value=".jar Artifact" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;fontStyle=1;" vertex="1" parent="ga-box">
      <mxGeometry x="180" y="100" width="130" height="35" as="geometry" />
    </mxCell>
    <mxCell id="release-box" value="GitHub Release&#xa;v1.0.0 + .jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=11;fontStyle=1;" vertex="1" parent="zone-github">
      <mxGeometry x="190" y="255" width="160" height="35" as="geometry" />
    </mxCell>
    <mxCell id="zone-local" value="INFRAESTRUCTURA LOCAL (WSL Ubuntu)" style="swimlane;startSize=30;fillColor=#fbe9e7;strokeColor=#bf360c;fontColor=#bf360c;fontSize=13;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="300" y="440" width="560" height="280" as="geometry" />
    </mxCell>
    <mxCell id="deploy-script" value="deploy-blue-green.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffccbc;strokeColor=#bf360c;fontSize=11;" vertex="1" parent="zone-local">
      <mxGeometry x="190" y="40" width="180" height="40" as="geometry" />
    </mxCell>
    <mxCell id="nginx-box" value="NGINX :80" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ff8a65;strokeColor=#bf360c;fontColor=#ffffff;fontSize=13;fontStyle=1;" vertex="1" parent="zone-local">
      <mxGeometry x="190" y="110" width="180" height="55" as="geometry" />
    </mxCell>
    <mxCell id="blue-box" value="BLUE :8080" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=11;fontStyle=1;" vertex="1" parent="zone-local">
      <mxGeometry x="40" y="200" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="green-box" value="GREEN :8081" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#2e7d32;fontColor=#ffffff;strokeColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="zone-local">
      <mxGeometry x="360" y="200" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="hc-box" value="Health Check / E2E Tests" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f3e5f5;strokeColor=#6a1b9a;fontSize=10;" vertex="1" parent="zone-local">
      <mxGeometry x="170" y="200" width="210" height="60" as="geometry" />
    </mxCell>
    <mxCell id="arr2" value="PR" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;" edge="1" source="branch-feature" target="pr-box" parent="zone-github">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr3" value="merge" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;" edge="1" source="pr-box" target="branch-main" parent="zone-github">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr5" value="dispara CI" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="pr-box" target="ga-box" parent="zone-github">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr7" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#f57f17;strokeWidth=2;" edge="1" source="artifact-jar" target="release-box" parent="zone-github">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr9" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#bf360c;strokeWidth=2;" edge="1" source="deploy-script" target="nginx-box" parent="zone-local">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr10" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=3;" edge="1" source="nginx-box" target="blue-box" parent="zone-local">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr11" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#2e7d32;strokeWidth=3;" edge="1" source="nginx-box" target="green-box" parent="zone-local">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 2 — Estrategia de Branching (Git Flow)

Flujo de ramas feature → PR → merge → tag.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Estrategia de Branching — Feature Branch Flow" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="150" y="20" width="870" height="35" as="geometry" />
    </mxCell>
    <mxCell id="main-label" value="main" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=14;fontStyle=1;fontColor=#1565c0;" vertex="1" parent="1">
      <mxGeometry x="20" y="167" width="60" height="25" as="geometry" />
    </mxCell>
    <mxCell id="c0" value="c0 initial" style="ellipse;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="80" y="160" width="70" height="40" as="geometry" />
    </mxCell>
    <mxCell id="feat1-label" value="feature/add-instance-endpoint" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=11;fontStyle=1;fontColor=#2e7d32;" vertex="1" parent="1">
      <mxGeometry x="200" y="255" width="260" height="20" as="geometry" />
    </mxCell>
    <mxCell id="cf1" value="f1 add controller" style="ellipse;whiteSpace=wrap;html=1;fillColor=#43a047;fontColor=#ffffff;strokeColor=#2e7d32;fontSize=9;" vertex="1" parent="1">
      <mxGeometry x="250" y="285" width="90" height="40" as="geometry" />
    </mxCell>
    <mxCell id="cf2" value="f2 add tests" style="ellipse;whiteSpace=wrap;html=1;fillColor=#43a047;fontColor=#ffffff;strokeColor=#2e7d32;fontSize=9;" vertex="1" parent="1">
      <mxGeometry x="370" y="285" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="pr1-box" value="Pull Request #1" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="480" y="215" width="110" height="35" as="geometry" />
    </mxCell>
    <mxCell id="cm1" value="M1 merge instance" style="ellipse;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=9;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="530" y="160" width="90" height="40" as="geometry" />
    </mxCell>
    <mxCell id="feat2-label" value="feature/blue-green-scripts" style="text;html=1;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=11;fontStyle=1;fontColor=#2e7d32;" vertex="1" parent="1">
      <mxGeometry x="570" y="375" width="220" height="20" as="geometry" />
    </mxCell>
    <mxCell id="cg1" value="g1 deploy.sh" style="ellipse;whiteSpace=wrap;html=1;fillColor=#43a047;fontColor=#ffffff;strokeColor=#2e7d32;fontSize=9;" vertex="1" parent="1">
      <mxGeometry x="600" y="395" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="cg2" value="g2 scripts" style="ellipse;whiteSpace=wrap;html=1;fillColor=#43a047;fontColor=#ffffff;strokeColor=#2e7d32;fontSize=9;" vertex="1" parent="1">
      <mxGeometry x="710" y="395" width="80" height="40" as="geometry" />
    </mxCell>
    <mxCell id="pr2-box" value="Pull Request #2" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="760" y="215" width="110" height="35" as="geometry" />
    </mxCell>
    <mxCell id="cm2" value="M2 merge scripts" style="ellipse;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=9;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="830" y="160" width="90" height="40" as="geometry" />
    </mxCell>
    <mxCell id="tag-v100" value="Tag v1.0.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="950" y="160" width="100" height="40" as="geometry" />
    </mxCell>
    <mxCell id="release-box2" value="GitHub Release v1.0.0 + .jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="920" y="260" width="180" height="50" as="geometry" />
    </mxCell>
    <mxCell id="rules-box" value="Reglas de Branching&#xa;━━━━━━━━━━━━━━━━━━━━&#xa;1. Nunca trabajar en main directamente&#xa;2. feature/nombre-descriptivo&#xa;3. Integrar solo via Pull Request&#xa;4. CI corre en cada PR&#xa;5. Tags solo desde main" style="text;html=1;strokeColor=#37474f;fillColor=#eceff1;align=left;verticalAlign=top;whiteSpace=wrap;rounded=1;fontSize=11;fontColor=#263238;" vertex="1" parent="1">
      <mxGeometry x="30" y="400" width="280" height="115" as="geometry" />
    </mxCell>
    <mxCell id="merge1-arrow" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;dashed=1;" edge="1" source="cf2" target="pr1-box" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="merge1-to-main" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;" edge="1" source="pr1-box" target="cm1" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="merge2-arrow" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;dashed=1;" edge="1" source="cg2" target="pr2-box" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="merge2-to-main" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;" edge="1" source="pr2-box" target="cm2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="tag-arrow" value="git tag" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#f57f17;strokeWidth=2;" edge="1" source="cm2" target="tag-v100" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="release-arrow" value="release.yml" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#3949ab;strokeWidth=2;" edge="1" source="tag-v100" target="release-box2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 3 — Pipeline CI — GitHub Actions (maven.yml)

Detalle paso a paso del workflow de Integración Continua.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Pipeline CI — GitHub Actions (maven.yml)" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#b71c1c;" vertex="1" parent="1">
      <mxGeometry x="100" y="20" width="620" height="35" as="geometry" />
    </mxCell>
    <mxCell id="trigger" value="TRIGGER&#xa;push: main, feature/**&#xa;pull_request: main" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="70" width="250" height="60" as="geometry" />
    </mxCell>
    <mxCell id="job-build" value="JOB: build   runs-on: ubuntu-latest" style="swimlane;startSize=35;fillColor=#fce4ec;strokeColor=#c62828;fontColor=#b71c1c;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="180" y="165" width="440" height="600" as="geometry" />
    </mxCell>
    <mxCell id="s1" value="1 — Checkout&#xa;actions/checkout@v4" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=11;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="50" width="340" height="50" as="geometry" />
    </mxCell>
    <mxCell id="s2" value="2 — Setup JDK 21&#xa;actions/setup-java@v4  distribution: temurin" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=11;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="115" width="340" height="50" as="geometry" />
    </mxCell>
    <mxCell id="s3" value="3 — Build with Maven&#xa;mvn -B package -DskipTests --file pom.xml" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e57373;strokeColor=#c62828;fontColor=#ffffff;fontSize=11;fontStyle=1;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="180" width="340" height="55" as="geometry" />
    </mxCell>
    <mxCell id="s4" value="4 — Run Unit Tests&#xa;mvn -B test --file pom.xml&#xa;JUnit · surefire-reports/" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e57373;strokeColor=#c62828;fontColor=#ffffff;fontSize=11;fontStyle=1;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="250" width="340" height="60" as="geometry" />
    </mxCell>
    <mxCell id="s5" value="5 — Code Coverage JaCoCo&#xa;mvn -B verify --file pom.xml&#xa;Classes · Methods · Lines · Branches" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e57373;strokeColor=#c62828;fontColor=#ffffff;fontSize=11;fontStyle=1;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="325" width="340" height="65" as="geometry" />
    </mxCell>
    <mxCell id="s6" value="6 — Upload Test Reports&#xa;actions/upload-artifact@v4&#xa;surefire-reports/  jacoco-report/" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=11;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="405" width="340" height="60" as="geometry" />
    </mxCell>
    <mxCell id="s7" value="7 — Upload JAR Artifact&#xa;actions/upload-artifact@v4&#xa;target/webapi-*.jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontSize=11;" vertex="1" parent="job-build">
      <mxGeometry x="50" y="480" width="340" height="60" as="geometry" />
    </mxCell>
    <mxCell id="a1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s1" target="s2" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="a2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s2" target="s3" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="a3" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s3" target="s4" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="a4" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s4" target="s5" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="a5" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s5" target="s6" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="a6" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="s6" target="s7" parent="job-build">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="trig-arrow" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#f57f17;strokeWidth=3;" edge="1" source="trigger" target="job-build" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="success" value="BUILD SUCCESS" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontColor=#1b5e20;fontSize=14;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="190" y="790" width="200" height="50" as="geometry" />
    </mxCell>
    <mxCell id="failure" value="BUILD FAILED&#xa;Pipeline se detiene" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontColor=#b71c1c;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="420" y="790" width="200" height="50" as="geometry" />
    </mxCell>
    <mxCell id="result-arr1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=2;" edge="1" source="job-build" target="success" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="result-arr2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;dashed=1;" edge="1" source="job-build" target="failure" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 4 — Flujo CI/CD Completo (End-to-End)

Ciclo completo desde el commit hasta la app corriendo en producción local.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Flujo CI/CD Completo — Commit to Production" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="100" y="20" width="620" height="35" as="geometry" />
    </mxCell>
    <mxCell id="step1" value="Desarrollador&#xa;Escribe código en feature/*" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="270" y="70" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step2" value="git push&#xa;feature/add-instance-endpoint" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="270" y="155" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step3" value="GitHub Actions CI&#xa;maven.yml se dispara automático" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fce4ec;strokeColor=#c62828;fontColor=#b71c1c;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="240" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="ci-parallel" value="CI Pipeline" style="swimlane;startSize=25;fillColor=#fff3e0;strokeColor=#e65100;fontColor=#bf360c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="100" y="325" width="600" height="90" as="geometry" />
    </mxCell>
    <mxCell id="p-build" value="Build mvn package" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffcc80;strokeColor=#e65100;fontSize=10;" vertex="1" parent="ci-parallel">
      <mxGeometry x="20" y="35" width="120" height="40" as="geometry" />
    </mxCell>
    <mxCell id="p-test" value="Unit Tests JUnit" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffcc80;strokeColor=#e65100;fontSize=10;" vertex="1" parent="ci-parallel">
      <mxGeometry x="155" y="35" width="120" height="40" as="geometry" />
    </mxCell>
    <mxCell id="p-coverage" value="Coverage JaCoCo" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffcc80;strokeColor=#e65100;fontSize=10;" vertex="1" parent="ci-parallel">
      <mxGeometry x="290" y="35" width="120" height="40" as="geometry" />
    </mxCell>
    <mxCell id="p-package" value="Package .jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffcc80;strokeColor=#e65100;fontSize=10;" vertex="1" parent="ci-parallel">
      <mxGeometry x="425" y="35" width="120" height="40" as="geometry" />
    </mxCell>
    <mxCell id="step5" value="Pull Request a main&#xa;CI pasa · Code Review · Merge" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontColor=#0d47a1;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="445" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step6" value="git tag v1.0.0&#xa;git push origin v1.0.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="530" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step7" value="GitHub Release workflow&#xa;release.yml · Publica .jar en Release" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="615" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step8" value="Descarga .jar desde Release&#xa;scripts/deploy-blue-green.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fbe9e7;strokeColor=#bf360c;fontColor=#bf360c;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="270" y="700" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step9" value="Blue-Green Deployment&#xa;Deploy · Health Check · Switch Traffic" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="270" y="785" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="step10" value="Verificacion E2E&#xa;traffic-test.sh · /api/instance" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="270" y="870" width="260" height="55" as="geometry" />
    </mxCell>
    <mxCell id="pass-box" value="PASS&#xa;Nueva version en produccion" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="100" y="975" width="200" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fail-box" value="FAIL&#xa;Rollback automatico&#xa;rollback.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontColor=#b71c1c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="500" y="975" width="200" height="60" as="geometry" />
    </mxCell>
    <mxCell id="f1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step1" target="step2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step2" target="step3" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f3" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step3" target="ci-parallel" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f4" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="ci-parallel" target="step5" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f5" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step5" target="step6" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f6" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step6" target="step7" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f7" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step7" target="step8" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f8" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step8" target="step9" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f9" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="step9" target="step10" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f10" value="PASS" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=2;" edge="1" source="step10" target="pass-box" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="f11" value="FAIL" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;dashed=1;" edge="1" source="step10" target="fail-box" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 5 — Arquitectura Blue-Green Deployment

Infraestructura local con Nginx como balanceador y las dos instancias BLUE y GREEN.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Arquitectura Blue-Green Deployment — WSL Ubuntu" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="80" y="20" width="1000" height="35" as="geometry" />
    </mxCell>
    <mxCell id="client" value="Cliente&#xa;Browser / curl" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=13;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="470" y="80" width="180" height="65" as="geometry" />
    </mxCell>
    <mxCell id="nginx" value="NGINX&#xa;Load Balancer&#xa;localhost:80" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ff8a65;strokeColor=#bf360c;fontColor=#ffffff;fontSize=14;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="450" y="210" width="220" height="80" as="geometry" />
    </mxCell>
    <mxCell id="nginx-config" value="/etc/nginx/sites-available/spring-boot-webapi&#xa;upstream blue_green { server 127.0.0.1:PORT; }" style="text;html=1;strokeColor=#bdbdbd;fillColor=#fff9c4;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=1;fontSize=10;" vertex="1" parent="1">
      <mxGeometry x="310" y="225" width="130" height="50" as="geometry" />
    </mxCell>
    <mxCell id="blue-zone" value="INSTANCIA BLUE" style="swimlane;startSize=35;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=14;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="100" y="360" width="340" height="300" as="geometry" />
    </mxCell>
    <mxCell id="blue-app" value="Spring Boot App&#xa;webapi-1.0.0.jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#42a5f5;fontColor=#ffffff;strokeColor=#1565c0;fontSize=12;" vertex="1" parent="blue-zone">
      <mxGeometry x="40" y="50" width="260" height="50" as="geometry" />
    </mxCell>
    <mxCell id="blue-port" value="Puerto: 8080" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontColor=#0d47a1;fontSize=13;fontStyle=1;" vertex="1" parent="blue-zone">
      <mxGeometry x="80" y="120" width="180" height="40" as="geometry" />
    </mxCell>
    <mxCell id="blue-instance" value="-Dapp.instance.name=BLUE" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#bbdefb;strokeColor=#1565c0;fontSize=11;" vertex="1" parent="blue-zone">
      <mxGeometry x="30" y="175" width="280" height="35" as="geometry" />
    </mxCell>
    <mxCell id="blue-resp" value="GET /api/instance&#xa;{instance: BLUE, port: 8080}" style="text;html=1;strokeColor=#90caf9;fillColor=#e3f2fd;align=left;verticalAlign=top;whiteSpace=wrap;rounded=1;fontSize=10;" vertex="1" parent="blue-zone">
      <mxGeometry x="20" y="220" width="300" height="55" as="geometry" />
    </mxCell>
    <mxCell id="green-zone" value="INSTANCIA GREEN" style="swimlane;startSize=35;fillColor=#2e7d32;fontColor=#ffffff;strokeColor=#1b5e20;fontSize=14;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="680" y="360" width="340" height="300" as="geometry" />
    </mxCell>
    <mxCell id="green-app" value="Spring Boot App&#xa;webapi-1.1.0.jar (nueva version)" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#66bb6a;fontColor=#ffffff;strokeColor=#2e7d32;fontSize=12;" vertex="1" parent="green-zone">
      <mxGeometry x="40" y="50" width="260" height="50" as="geometry" />
    </mxCell>
    <mxCell id="green-port" value="Puerto: 8081" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=13;fontStyle=1;" vertex="1" parent="green-zone">
      <mxGeometry x="80" y="120" width="180" height="40" as="geometry" />
    </mxCell>
    <mxCell id="green-instance" value="-Dapp.instance.name=GREEN" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#c8e6c9;strokeColor=#2e7d32;fontSize=11;" vertex="1" parent="green-zone">
      <mxGeometry x="30" y="175" width="280" height="35" as="geometry" />
    </mxCell>
    <mxCell id="green-resp" value="GET /api/instance&#xa;{instance: GREEN, port: 8081}" style="text;html=1;strokeColor=#a5d6a7;fillColor=#e8f5e9;align=left;verticalAlign=top;whiteSpace=wrap;rounded=1;fontSize=10;" vertex="1" parent="green-zone">
      <mxGeometry x="20" y="220" width="300" height="55" as="geometry" />
    </mxCell>
    <mxCell id="scripts-box" value="Scripts de Automatizacion" style="swimlane;startSize=30;fillColor=#f3e5f5;strokeColor=#6a1b9a;fontColor=#4a148c;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="290" y="690" width="530" height="80" as="geometry" />
    </mxCell>
    <mxCell id="sc1" value="deploy-blue-green.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ce93d8;strokeColor=#6a1b9a;fontSize=9;" vertex="1" parent="scripts-box">
      <mxGeometry x="10" y="35" width="120" height="30" as="geometry" />
    </mxCell>
    <mxCell id="sc2" value="health-check.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ce93d8;strokeColor=#6a1b9a;fontSize=9;" vertex="1" parent="scripts-box">
      <mxGeometry x="140" y="35" width="100" height="30" as="geometry" />
    </mxCell>
    <mxCell id="sc3" value="switch-traffic.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ce93d8;strokeColor=#6a1b9a;fontSize=9;" vertex="1" parent="scripts-box">
      <mxGeometry x="250" y="35" width="100" height="30" as="geometry" />
    </mxCell>
    <mxCell id="sc4" value="rollback.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ce93d8;strokeColor=#6a1b9a;fontSize=9;" vertex="1" parent="scripts-box">
      <mxGeometry x="360" y="35" width="80" height="30" as="geometry" />
    </mxCell>
    <mxCell id="sc5" value="traffic-test.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ce93d8;strokeColor=#6a1b9a;fontSize=9;" vertex="1" parent="scripts-box">
      <mxGeometry x="450" y="35" width="70" height="30" as="geometry" />
    </mxCell>
    <mxCell id="arr-c-n" value="HTTP :80" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=3;" edge="1" source="client" target="nginx" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr-n-b" value="ACTIVO proxy_pass :8080" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=4;" edge="1" source="nginx" target="blue-zone" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="arr-n-g" value="EN ESPERA (nuevo deploy)" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#2e7d32;strokeWidth=2;dashed=1;" edge="1" source="nginx" target="green-zone" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 6 — Flujo de Deployment Blue-Green (Secuencia)

Secuencia de pasos para desplegar una nueva versión sin downtime.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Flujo de Deployment Blue-Green — Secuencia Paso a Paso" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="80" y="15" width="1000" height="35" as="geometry" />
    </mxCell>
    <mxCell id="p0" value="ESTADO INICIAL&#xa;BLUE ACTIVO :8080 v1.0.0&#xa;Nginx apunta a :8080" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="400" y="65" width="260" height="65" as="geometry" />
    </mxCell>
    <mxCell id="p0-green" value="GREEN INACTIVO :8081 vacio" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#c8e6c9;strokeColor=#2e7d32;fontColor=#37474f;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="700" y="65" width="220" height="65" as="geometry" />
    </mxCell>
    <mxCell id="p1" value="1 — Descargar nueva version JAR&#xa;desde GitHub Release v1.1.0&#xa;~/blue-green/releases/webapi-1.1.0.jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="100" y="170" width="340" height="65" as="geometry" />
    </mxCell>
    <mxCell id="p2" value="2 — Detener GREEN si corre&#xa;kill $(lsof -ti tcp:8081)&#xa;Puerto 8081 liberado" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="480" y="170" width="340" height="65" as="geometry" />
    </mxCell>
    <mxCell id="p3" value="3 — Copiar JAR al directorio GREEN&#xa;cp webapi-1.1.0.jar ~/blue-green/green/app.jar" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="100" y="265" width="340" height="60" as="geometry" />
    </mxCell>
    <mxCell id="p4" value="4 — Arrancar GREEN&#xa;nohup java -jar app.jar --server.port=8081&#xa;--app.instance.name=GREEN" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="480" y="265" width="340" height="60" as="geometry" />
    </mxCell>
    <mxCell id="p5" value="5 — Health Check sobre GREEN&#xa;curl http://localhost:8081/health&#xa;Hasta 20 reintentos cada 3 segundos" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f3e5f5;strokeColor=#6a1b9a;fontColor=#4a148c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="280" y="355" width="380" height="70" as="geometry" />
    </mxCell>
    <mxCell id="dec-hc" value="Health Check OK?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="415" y="455" width="140" height="85" as="geometry" />
    </mxCell>
    <mxCell id="p6a" value="6 — Switch de trafico&#xa;switch-traffic.sh green&#xa;Nginx upstream a :8081&#xa;nginx -s reload" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#2e7d32;fontColor=#ffffff;strokeColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="130" y="575" width="260" height="75" as="geometry" />
    </mxCell>
    <mxCell id="p6b" value="ROLLBACK&#xa;rollback.sh blue&#xa;Mantener trafico en BLUE&#xa;GREEN queda fuera" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#c62828;fontColor=#ffffff;strokeColor=#b71c1c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="550" y="575" width="260" height="75" as="geometry" />
    </mxCell>
    <mxCell id="p7" value="7 — Verificacion Post-Deploy&#xa;traffic-test.sh 20&#xa;Responde GREEN confirma switch" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="130" y="690" width="260" height="70" as="geometry" />
    </mxCell>
    <mxCell id="final" value="ESTADO FINAL&#xa;GREEN ACTIVO :8081 v1.1.0&#xa;BLUE en standby listo para rollback" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontColor=#1b5e20;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="100" y="795" width="340" height="65" as="geometry" />
    </mxCell>
    <mxCell id="blue-active-note" value="BLUE sigue activo&#xa;durante todo el deploy&#xa;Sin downtime para el usuario" style="text;html=1;strokeColor=#1565c0;fillColor=#e3f2fd;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=1;fontSize=11;fontColor=#0d47a1;" vertex="1" parent="1">
      <mxGeometry x="820" y="360" width="200" height="75" as="geometry" />
    </mxCell>
    <mxCell id="fa1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p0" target="p1" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p1" target="p2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa3" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p2" target="p3" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa4" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p3" target="p4" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa5" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p4" target="p5" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa6" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="p5" target="dec-hc" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa7" value="SI" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=3;" edge="1" source="dec-hc" target="p6a" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa8" value="NO" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=3;dashed=1;" edge="1" source="dec-hc" target="p6b" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa9" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=2;" edge="1" source="p6a" target="p7" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa10" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=2;" edge="1" source="p7" target="final" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 7 — Flujo de Rollback

Secuencia de recuperación cuando el nuevo deploy falla.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Flujo de Rollback — Recuperacion ante Fallo" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#b71c1c;" vertex="1" parent="1">
      <mxGeometry x="100" y="20" width="620" height="35" as="geometry" />
    </mxCell>
    <mxCell id="r0" value="DEPLOY INICIADO&#xa;Nueva version v1.1.0&#xa;Destino: instancia GREEN :8081" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="220" y="70" width="360" height="65" as="geometry" />
    </mxCell>
    <mxCell id="r1" value="GREEN arranco en :8081&#xa;Esperando que este lista..." style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=12;" vertex="1" parent="1">
      <mxGeometry x="220" y="165" width="360" height="55" as="geometry" />
    </mxCell>
    <mxCell id="r2" value="Health Check Loop&#xa;curl http://localhost:8081/health&#xa;Intentos: 1/20, 2/20 ... 20/20" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f3e5f5;strokeColor=#6a1b9a;fontColor=#4a148c;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="220" y="250" width="360" height="65" as="geometry" />
    </mxCell>
    <mxCell id="dec" value="Respondio HTTP 200?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=12;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="300" y="345" width="200" height="90" as="geometry" />
    </mxCell>
    <mxCell id="r3-fail" value="Health Check FALLIDO&#xa;Timeout: GREEN no responde&#xa;Log: ~/blue-green/green/logs/app.log" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ef9a9a;strokeColor=#c62828;fontColor=#b71c1c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="480" y="345" width="280" height="65" as="geometry" />
    </mxCell>
    <mxCell id="r4-fail" value="Aislar instancia GREEN&#xa;GREEN permanece detenida&#xa;No recibe trafico nuevo" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffcdd2;strokeColor=#c62828;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="480" y="440" width="280" height="60" as="geometry" />
    </mxCell>
    <mxCell id="r5-fail" value="EJECUTAR ROLLBACK&#xa;./scripts/rollback.sh blue&#xa;switch-traffic.sh blue&#xa;sed upstream a :8080&#xa;nginx -s reload" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#c62828;fontColor=#ffffff;strokeColor=#b71c1c;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="480" y="530" width="280" height="80" as="geometry" />
    </mxCell>
    <mxCell id="r6-fail" value="BLUE restaurado como ACTIVO&#xa;Trafico Nginx a :8080&#xa;Version 1.0.0 sirve peticiones" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="480" y="640" width="280" height="65" as="geometry" />
    </mxCell>
    <mxCell id="r7-fail" value="Verificar rollback&#xa;curl http://localhost/api/instance&#xa;Responde: {instance: BLUE, port: 8080}" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontColor=#0d47a1;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="480" y="735" width="280" height="60" as="geometry" />
    </mxCell>
    <mxCell id="r8-fail" value="ACCION REQUERIDA&#xa;Investigar causa del fallo en GREEN&#xa;Revisar logs · Corregir · Nuevo deploy" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="480" y="825" width="280" height="65" as="geometry" />
    </mxCell>
    <mxCell id="r3-ok" value="Health Check OK&#xa;GREEN lista en :8081" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="60" y="345" width="220" height="60" as="geometry" />
    </mxCell>
    <mxCell id="r4-ok" value="Continua flujo normal&#xa;Switch traffic a GREEN&#xa;(ver Diagrama 6)" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="60" y="435" width="220" height="55" as="geometry" />
    </mxCell>
    <mxCell id="fa1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="r0" target="r1" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="r1" target="r2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa3" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="r2" target="dec" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa4" value="NO" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=3;" edge="1" source="dec" target="r3-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa5" value="SI" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=3;" edge="1" source="dec" target="r3-ok" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa6" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="r3-fail" target="r4-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa7" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="r4-fail" target="r5-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa8" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#c62828;strokeWidth=2;" edge="1" source="r5-fail" target="r6-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa9" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#1565c0;strokeWidth=2;" edge="1" source="r6-fail" target="r7-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa10" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#f57f17;strokeWidth=2;" edge="1" source="r7-fail" target="r8-fail" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fa11" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#388e3c;strokeWidth=2;" edge="1" source="r3-ok" target="r4-ok" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Diagrama 8 — Estrategia de Tagging y Versionamiento (Semver)

Ciclo de vida de los tags, cuando se crean y su relación con las Releases y el artifact.

```xml
<mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
  <root>
    <mxCell id="0" />
    <mxCell id="1" parent="0" />
    <mxCell id="title" value="Estrategia de Tagging y Versionamiento — Semantic Versioning" style="text;html=1;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;fontSize=18;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="100" y="15" width="960" height="35" as="geometry" />
    </mxCell>
    <mxCell id="semver-box" value="MAJOR . MINOR . PATCH" style="text;html=1;strokeColor=#3949ab;fillColor=#e8eaf6;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=1;fontSize=22;fontStyle=1;fontColor=#1a237e;" vertex="1" parent="1">
      <mxGeometry x="330" y="65" width="500" height="50" as="geometry" />
    </mxCell>
    <mxCell id="major-box" value="MAJOR&#xa;━━━━━━━━&#xa;Cambios que rompen&#xa;compatibilidad" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#c62828;fontColor=#ffffff;strokeColor=#b71c1c;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="80" y="135" width="180" height="80" as="geometry" />
    </mxCell>
    <mxCell id="minor-box" value="MINOR&#xa;━━━━━━━━&#xa;Nueva funcionalidad&#xa;compatible hacia atras" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#1565c0;fontColor=#ffffff;strokeColor=#0d47a1;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="480" y="135" width="180" height="80" as="geometry" />
    </mxCell>
    <mxCell id="patch-box" value="PATCH&#xa;━━━━━━━━&#xa;Correccion de bugs&#xa;sin nueva funcionalidad" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#2e7d32;fontColor=#ffffff;strokeColor=#1b5e20;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="900" y="135" width="180" height="80" as="geometry" />
    </mxCell>
    <mxCell id="t100-tag" value="v1.0.0&#xa;Primera version estable&#xa;git tag v1.0.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="80" y="340" width="160" height="70" as="geometry" />
    </mxCell>
    <mxCell id="t110-tag" value="v1.1.0&#xa;Agrega /api/instance&#xa;git tag v1.1.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e3f2fd;strokeColor=#1565c0;fontColor=#0d47a1;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="330" y="340" width="160" height="70" as="geometry" />
    </mxCell>
    <mxCell id="t111-tag" value="v1.1.1&#xa;Fix: health-check timeout&#xa;git tag v1.1.1" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8f5e9;strokeColor=#2e7d32;fontColor=#1b5e20;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="580" y="340" width="160" height="70" as="geometry" />
    </mxCell>
    <mxCell id="t200-tag" value="v2.0.0&#xa;Breaking: nueva arquitectura&#xa;git tag v2.0.0" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fce4ec;strokeColor=#c62828;fontColor=#b71c1c;fontSize=10;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="840" y="340" width="160" height="70" as="geometry" />
    </mxCell>
    <mxCell id="flow-title" value="Ciclo: Tag a Release a Deploy" style="text;html=1;strokeColor=none;fillColor=none;align=center;fontStyle=1;fontSize=14;fontColor=#37474f;" vertex="1" parent="1">
      <mxGeometry x="300" y="450" width="570" height="25" as="geometry" />
    </mxCell>
    <mxCell id="fl1" value="1 — git tag v1.x.x&#xa;git push origin v1.x.x" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff9c4;strokeColor=#f57f17;fontColor=#e65100;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="60" y="490" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fl2" value="2 — release.yml&#xa;se dispara en&#xa;GitHub Actions" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fce4ec;strokeColor=#c62828;fontColor=#b71c1c;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="250" y="490" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fl3" value="3 — GitHub Release&#xa;webapi-1.x.x.jar&#xa;publicado" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e8eaf6;strokeColor=#3949ab;fontColor=#1a237e;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="440" y="490" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fl4" value="4 — Deploy script&#xa;descarga .jar&#xa;deploy-blue-green.sh" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fbe9e7;strokeColor=#bf360c;fontColor=#bf360c;fontSize=11;" vertex="1" parent="1">
      <mxGeometry x="630" y="490" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fl5" value="5 — Produccion&#xa;BLUE o GREEN activo&#xa;version identificable" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#a5d6a7;strokeColor=#388e3c;fontColor=#1b5e20;fontSize=11;fontStyle=1;" vertex="1" parent="1">
      <mxGeometry x="820" y="490" width="160" height="60" as="geometry" />
    </mxCell>
    <mxCell id="fla1" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="fl1" target="fl2" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fla2" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="fl2" target="fl3" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fla3" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="fl3" target="fl4" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="fla4" style="edgeStyle=orthogonalEdgeStyle;html=1;strokeColor=#37474f;strokeWidth=2;" edge="1" source="fl4" target="fl5" parent="1">
      <mxGeometry relative="1" as="geometry" />
    </mxCell>
    <mxCell id="rule-box" value="Reglas de Tagging&#xa;━━━━━━━━━━━━━━━━━━━━&#xa;- Tags solo se crean desde main&#xa;- Cada tag = version publicable&#xa;- El tag, .jar y Release son trazables&#xa;- Un tag no se modifica (inmutable)&#xa;- Version en pom.xml coincide con tag" style="text;html=1;strokeColor=#37474f;fillColor=#eceff1;align=left;verticalAlign=top;whiteSpace=wrap;rounded=1;fontSize=11;fontColor=#263238;" vertex="1" parent="1">
      <mxGeometry x="60" y="585" width="300" height="120" as="geometry" />
    </mxCell>
    <mxCell id="trace-box" value="Trazabilidad&#xa;━━━━━━━━━━━━━━━━━━━━&#xa;Tag v1.1.0&#xa;  ↕&#xa;Release v1.1.0&#xa;  ↕&#xa;webapi-1.1.0.jar&#xa;  ↕&#xa;BLUE/GREEN corriendo v1.1.0" style="text;html=1;strokeColor=#2e7d32;fillColor=#e8f5e9;align=left;verticalAlign=top;whiteSpace=wrap;rounded=1;fontSize=11;fontColor=#1b5e20;" vertex="1" parent="1">
      <mxGeometry x="750" y="585" width="240" height="140" as="geometry" />
    </mxCell>
  </root>
</mxGraphModel>
```

---

## Como importar en draw.io

1. Abrí [app.diagrams.net](https://app.diagrams.net/)
2. Menu `Extras` → `Edit Diagram`
3. Borrá el contenido existente y pegá el XML del diagrama deseado
4. Click `OK`
5. Usá `Ctrl+Shift+H` para ajustar el diagrama a la pantalla
6. Para exportar: `File → Export As → PNG` con escala 2x

> Cada diagrama está pensado para una slide de presentacion diferente.
