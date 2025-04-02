# Proyecto de Monitoreo con EMR, EC2, Prometheus y Grafana

Este proyecto tiene como objetivo crear un **clúster EMR en AWS** y configurar una **instancia EC2** en la que se instalará **Prometheus** para recolectar métricas. Posteriormente, estas métricas serán visualizadas en **Grafana** para realizar monitoreo en tiempo real.

### Diagrama de flujo del proyecto:
1. **Crear Instancia EC2**: Usando un script para lanzar la máquina EC2.
2. **Configurar Prometheus**: Instalar Prometheus en la instancia EC2 para recopilar métricas de la máquina.
3. **Configurar EMR**: Lanzar un clúster EMR para procesamiento de datos.
4. **Configurar Grafana**: Visualizar las métricas recolectadas por Prometheus en Grafana.

## Requisitos

Antes de comenzar, asegúrate de tener lo siguiente:

- **AWS CLI** instalado y configurado en tu máquina local. 
- **Instancia EC2** con permisos de IAM adecuados para ejecutar el script de EC2 y crear recursos EMR.
- **Prometheus** y **Grafana** instalados en tu máquina EC2.
  
## Pasos para la Creación del Proyecto

### Clonar el Repositorio

Clona el repositorio donde se encuentra el proyecto:

```bash
git clone https://github.com/tu-usuario/emr-ec2-prometheus-grafana.git
cd emr-ec2-prometheus-grafana

### Manual

Sigue los pasos en el manual (Priscila_sabino_Monitoreo_AWS_EMR)
