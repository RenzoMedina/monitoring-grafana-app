# 📊 Monitoring Grafana App 

Infraestructura modular para monitoreo de aplicaciones y servicios, usando Filebeat, Logstash, Prometheus, Grafana y Nginx. Ideal para entornos reproducibles, trazables y auditables.Repositorio educativo para aprender los fundamentos de DevOps mediante la implementación de un sitio estático Docker y Vue


# 🚀 Características

- 🔍 Recolección de logs con Filebeat y Logstash
- 📈 Métricas con Prometheus y visualización en Grafana
- 🌐 Proxy reverso con Nginx para acceso seguro
- 🐳 Orquestación con Docker Compose
- 📦 Configuración modular y reproducible

# 📁 Estructura del proyecto

``` plaintext
monitoring-grafana-app/ 
├── filebeat/ # Configuración de Filebeat 
├── infra/ # Infraestructura base 
├── logstash/pipeline/ # Pipelines de Logstash 
├── nginx/ # Configuración de Nginx 
├── docker-compose.yml # Orquestación de servicios 
├── prometheus.yml # Targets y reglas de Prometheus 
└── .gitignore

```

# ⚙️ Requisitos

- Docker & Docker Compose
- Puertos disponibles: `3000` (Grafana), `9090` (Prometheus), `80` (Nginx)
    
# 🧪 Uso

Correremos las pruebas con CyPress

```bash
# Clonar el repositorio
git clone https://github.com/RenzoMedina/monitoring-grafana-app.git
cd monitoring-grafana-app

# Levantar los servicios
docker-compose up -d

```
Ahora podrías acceder a:

- Grafana: [http://localhost:3000](http://localhost:3000)

- Prometheus: [http://localhost:9090](http://localhost:9090)

- Nginx: [http://localhost](http://localhost)

# 📌 Notas

- Las configuraciones están pensadas para entornos locales y pueden adaptarse a producción.

- Se recomienda revisar los pipelines de Logstash y los dashboards de Grafana para personalización.

## Authors
- Backend Developer & DevOps Jr
- [@renzomedina](https://github.com/RenzoMedina)

