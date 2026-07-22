# 📘 Reingeniería integral del ERP Geco

<p align="center">
  <img src="logo_geco_transparente.png" alt="Logo Geco" width="400">
</p>

> Trabajo de Fin de Máster (TFM) – Documentación oficial del proyecto de modernización del ERP Geco.

---

## 📌 Descripción general

Este repositorio contiene la documentación completa del TFM centrado en la **reingeniería integral del sistema ERP Geco**. El proyecto aborda la obsolescencia tecnológica, la rigidez arquitectónica y las limitaciones de experiencia de usuario del sistema actual, proponiendo una migración hacia una arquitectura basada en **microservicios** y un frontend moderno, aplicando **metodologías híbridas** de desarrollo.

El objetivo es transformar el ERP Geco —originalmente construido con PHP, CodeIgniter y Sencha ExtJs— en una plataforma escalable, mantenible, responsiva y alineada con los estándares actuales de ingeniería de software y experiencia de usuario.

---

## 📂 Estructura del repositorio

### 📁 DOCUMENTOS GENERALES DE TODO EL SISTEMA

| Documento | Descripción |
|-----------|-------------|
| [⌛ 00_Reingeniería Geco_Cronograma_baseline.pdf](./docs/00_Reingeniería%20Geco_Cronograma_baseline.pdf) | Diagrama Gantt del cronograma base del proyecto |
| [📋 01_Inicio_y_planificación_del_proyecto.pdf](./docs/01_Inicio_y_planificación_del_proyecto.pdf) | Inicio, planificación, alcance y stakeholders del proyecto |
| [🏗️ 02_Levantamiento_arquitectura_tecnológica_AS-IS.pdf](./docs/02_Levantamiento_arquitectura_tecnológica_AS-IS.pdf) | Levantamiento detallado de la arquitectura tecnológica AS-IS |
| [⚡ 03_Evaluación_de_rendimiento_AS-IS.pdf](./docs/03_Evaluación_de_rendimiento_AS-IS.pdf) | Evaluación de rendimiento de endpoints críticos (simulación K6) |
| [🔒 04_Revisión_de_seguridad_AS-IS.pdf](./docs/04_Revisión_de_seguridad_AS-IS.pdf) | Revisión de seguridad, vulnerabilidades y riesgos AS-IS |
| [🗃️ 05_Análisis_del_modelo_de_datos_AS-IS.pdf](./docs/05_Análisis_del_modelo_de_datos_AS-IS.pdf) | Análisis del modelo de datos relacional (MySQL) |
| [📊 06_Backlog_total_priorizado.pdf](./docs/06_Backlog_total_priorizado.pdf) | Backlog total priorizado de todos los módulos |
| [📋 07_Requisitos_no_funcionales_por_módulo.pdf](./docs/07_Requisitos_no_funcionales_por_módulo.pdf) | Requisitos no funcionales por módulo (rendimiento, usabilidad, seguridad, etc.) |
| [📐 08_Diagrama_Entidad-Relación_completo.pdf](./docs/08_Diagrama_Entidad-Relación_completo.pdf) | Diagrama Entidad-Relación completo del sistema |
| [🧩 09_Arquitectura_funcional_TO-BE.pdf](./docs/09_Arquitectura_funcional_TO-BE.pdf) | Arquitectura funcional TO-BE: microservicios, capas y tecnologías |
| [🔗 10_Definición_endpoints_API_RESTful.pdf](./docs/10_Definición_endpoints_API_RESTful.pdf) | Definición de endpoints RESTful por módulo |
| [👥 11_Validaciones_stakeholders_feedback.pdf](./docs/11_Validaciones_stakeholders_feedback.pdf) | Validaciones con stakeholders y feedback incorporado |
| [🧪 12_Resultados_pruebas_integración_final.pdf](./docs/12_Resultados_pruebas_integración_final.pdf) | Resultados de pruebas de integración final |
| [🚀 13_Manual_técnico_despliegue.pdf](./docs/13_Manual_técnico_despliegue.pdf) | Manual técnico de instalación y despliegue |
| [📖 14_Manual_usuario_general.pdf](./docs/14_Manual_usuario_general.pdf) | Manual de usuario general del sistema |
| [📊 15_Matriz_de_trazabilidad_objetivos_entregables.pdf](./docs/15_Matriz_de_trazabilidad_objetivos_entregables.pdf) | Matriz de trazabilidad entre objetivos, actividades y entregables |
| [⚠️ 16_Registro_de_riesgos_y_cambios.pdf](./docs/16_Registro_de_riesgos_y_cambios.pdf) | Registro de riesgos identificados y cambios de alcance |

---

### 📦 DOCUMENTOS MÓDULO PRODUCTOS

| Documento | Descripción |
|-----------|-------------|
| [🔍 Análisis_funcional_AS-IS_modulo_Productos.pdf](./docs/por_modulo/productos/Análisis_funcional_AS-IS_modulo_Productos.pdf) | Análisis funcional AS-IS del módulo de Productos |
| [🎨 Análisis_UX-UI_AS-IS_Productos.pdf](./docs/por_modulo/productos/Análisis_UX-UI_AS-IS_Productos.pdf) | Análisis UX-UI AS-IS del módulo de Productos |
| [📝 Funcionalidades_e_historias_de_usuario_Productos.pdf](./docs/por_modulo/productos/Funcionalidades_e_historias_de_usuario_Productos.pdf) | Funcionalidades e historias de usuario del módulo de Productos |
| [✅ Heurísticas_de_Nielsen_por_pantalla_Productos.pdf](./docs/por_modulo/productos/Heurísticas_de_Nielsen_por_pantalla_Productos.pdf) | Heurísticas de Nielsen por pantalla del módulo de Productos |
| [📊 Diagramas_de_casos_de_uso_Productos.pdf](./docs/por_modulo/productos/Diagramas_de_casos_de_uso_Productos.pdf) | Diagramas de casos de uso del módulo de Productos |
| [🔄 Diagramas_de_actividades_Productos.pdf](./docs/por_modulo/productos/Diagramas_de_actividades_Productos.pdf) | Diagramas de actividades del módulo de Productos |
| [🏗️ Diagrama_de_clases_Productos.pdf](./docs/por_modulo/productos/Diagrama_de_clases_Productos.pdf) | Diagrama de clases del módulo de Productos |
| [🖌️ Wireframes_Productos.pdf](./docs/por_modulo/productos/Wireframes_Productos.pdf) | Wireframes del módulo de Productos |
| [🚶 User_journey_Productos.pdf](./docs/por_modulo/productos/User_journey_Productos.pdf) | User journey del módulo de Productos |
| [📋 Backlog_por_sprint_Productos.pdf](./docs/por_modulo/productos/Backlog_por_sprint_Productos.pdf) | Backlog por sprint del módulo de Productos |
| [🧪 Resultados_pruebas_funcionales_Productos.pdf](./docs/por_modulo/productos/Resultados_pruebas_funcionales_Productos.pdf) | Resultados de pruebas funcionales del módulo de Productos |
| [📸 Capturas_sistema_Productos.pdf](./docs/por_modulo/productos/Capturas_sistema_Productos.pdf) | Capturas de pantalla del sistema - Módulo Productos |

---

### 🤝 DOCUMENTOS MÓDULO PROVEEDORES

| Documento | Descripción |
|-----------|-------------|
| [🔍 Análisis_funcional_AS-IS_modulo_Proveedores.pdf](./docs/por_modulo/proveedores/Análisis_funcional_AS-IS_modulo_Proveedores.pdf) | Análisis funcional AS-IS del módulo de Proveedores |
| [🎨 Análisis_UX-UI_AS-IS_Proveedores.pdf](./docs/por_modulo/proveedores/Análisis_UX-UI_AS-IS_Proveedores.pdf) | Análisis UX-UI AS-IS del módulo de Proveedores |
| [📝 Funcionalidades_e_historias_de_usuario_Proveedores.pdf](./docs/por_modulo/proveedores/Funcionalidades_e_historias_de_usuario_Proveedores.pdf) | Funcionalidades e historias de usuario del módulo de Proveedores |
| [✅ Heurísticas_de_Nielsen_por_pantalla_Proveedores.pdf](./docs/por_modulo/proveedores/Heurísticas_de_Nielsen_por_pantalla_Proveedores.pdf) | Heurísticas de Nielsen por pantalla del módulo de Proveedores |
| [📊 Diagramas_de_casos_de_uso_Proveedores.pdf](./docs/por_modulo/proveedores/Diagramas_de_casos_de_uso_Proveedores.pdf) | Diagramas de casos de uso del módulo de Proveedores |
| [🔄 Diagramas_de_actividades_Proveedores.pdf](./docs/por_modulo/proveedores/Diagramas_de_actividades_Proveedores.pdf) | Diagramas de actividades del módulo de Proveedores |
| [🏗️ Diagrama_de_clases_Proveedores.pdf](./docs/por_modulo/proveedores/Diagrama_de_clases_Proveedores.pdf) | Diagrama de clases del módulo de Proveedores |
| [🖌️ Wireframes_Proveedores.pdf](./docs/por_modulo/proveedores/Wireframes_Proveedores.pdf) | Wireframes del módulo de Proveedores |
| [🚶 User_journey_Proveedores.pdf](./docs/por_modulo/proveedores/User_journey_Proveedores.pdf) | User journey del módulo de Proveedores |
| [📋 Backlog_por_sprint_Proveedores.pdf](./docs/por_modulo/proveedores/Backlog_por_sprint_Proveedores.pdf) | Backlog por sprint del módulo de Proveedores |
| [🧪 Resultados_pruebas_funcionales_Proveedores.pdf](./docs/por_modulo/proveedores/Resultados_pruebas_funcionales_Proveedores.pdf) | Resultados de pruebas funcionales del módulo de Proveedores |
| [📸 Capturas_sistema_Proveedores.pdf](./docs/por_modulo/proveedores/Capturas_sistema_Proveedores.pdf) | Capturas de pantalla del sistema - Módulo Proveedores |

---

### 📋 DOCUMENTOS MÓDULO RESERVAS

| Documento | Descripción |
|-----------|-------------|
| [🔍 Análisis_funcional_AS-IS_modulo_Reservas.pdf](./docs/por_modulo/reservas/Análisis_funcional_AS-IS_modulo_Reservas.pdf) | Análisis funcional AS-IS del módulo de Reservas |
| [🎨 Análisis_UX-UI_AS-IS_Reservas.pdf](./docs/por_modulo/reservas/Análisis_UX-UI_AS-IS_Reservas.pdf) | Análisis UX-UI AS-IS del módulo de Reservas |
| [📝 Funcionalidades_e_historias_de_usuario_Reservas.pdf](./docs/por_modulo/reservas/Funcionalidades_e_historias_de_usuario_Reservas.pdf) | Funcionalidades e historias de usuario del módulo de Reservas |
| [✅ Heurísticas_de_Nielsen_por_pantalla_Reservas.pdf](./docs/por_modulo/reservas/Heurísticas_de_Nielsen_por_pantalla_Reservas.pdf) | Heurísticas de Nielsen por pantalla del módulo de Reservas |
| [📊 Diagramas_de_casos_de_uso_Reservas.pdf](./docs/por_modulo/reservas/Diagramas_de_casos_de_uso_Reservas.pdf) | Diagramas de casos de uso del módulo de Reservas |
| [🔄 Diagramas_de_actividades_Reservas.pdf](./docs/por_modulo/reservas/Diagramas_de_actividades_Reservas.pdf) | Diagramas de actividades del módulo de Reservas |
| [🏗️ Diagrama_de_clases_Reservas.pdf](./docs/por_modulo/reservas/Diagrama_de_clases_Reservas.pdf) | Diagrama de clases del módulo de Reservas |
| [🖌️ Wireframes_Reservas.pdf](./docs/por_modulo/reservas/Wireframes_Reservas.pdf) | Wireframes del módulo de Reservas |
| [🚶 User_journey_Reservas.pdf](./docs/por_modulo/reservas/User_journey_Reservas.pdf) | User journey del módulo de Reservas |
| [📋 Backlog_por_sprint_Reservas.pdf](./docs/por_modulo/reservas/Backlog_por_sprint_Reservas.pdf) | Backlog por sprint del módulo de Reservas |
| [🧪 Resultados_pruebas_funcionales_Reservas.pdf](./docs/por_modulo/reservas/Resultados_pruebas_funcionales_Reservas.pdf) | Resultados de pruebas funcionales del módulo de Reservas |
| [📸 Capturas_sistema_Reservas.pdf](./docs/por_modulo/reservas/Capturas_sistema_Reservas.pdf) | Capturas de pantalla del sistema - Módulo Reservas |

---

### 📋 DOCUMENTOS DE SPRINTS Y GESTIÓN DE PROYECTO

| Documento | Descripción |
|-----------|-------------|
| [📋 Sprint_1_Planificación_y_backlog.pdf](./docs/sprints/Sprint_1_Planificación_y_backlog.pdf) | Planificación y backlog del Sprint 1 |
| [📋 Sprint_1_Desarrollo_y_resultados.pdf](./docs/sprints/Sprint_1_Desarrollo_y_resultados.pdf) | Desarrollo y resultados del Sprint 1 |
| [📋 Sprint_1_Feedback_usuarios_y_ajustes.pdf](./docs/sprints/Sprint_1_Feedback_usuarios_y_ajustes.pdf) | Feedback de usuarios y ajustes del Sprint 1 |
| [📋 Sprint_2_Planificación_y_backlog.pdf](./docs/sprints/Sprint_2_Planificación_y_backlog.pdf) | Planificación y backlog del Sprint 2 |
| [📋 Sprint_2_Desarrollo_y_resultados.pdf](./docs/sprints/Sprint_2_Desarrollo_y_resultados.pdf) | Desarrollo y resultados del Sprint 2 |
| [📋 Sprint_2_Feedback_usuarios_y_ajustes.pdf](./docs/sprints/Sprint_2_Feedback_usuarios_y_ajustes.pdf) | Feedback de usuarios y ajustes del Sprint 2 |
| [📋 Sprint_3_Planificación_y_backlog.pdf](./docs/sprints/Sprint_3_Planificación_y_backlog.pdf) | Planificación y backlog del Sprint 3 |
| [📋 Sprint_3_Desarrollo_y_resultados.pdf](./docs/sprints/Sprint_3_Desarrollo_y_resultados.pdf) | Desarrollo y resultados del Sprint 3 |
| [📋 Sprint_3_Feedback_usuarios_y_ajustes.pdf](./docs/sprints/Sprint_3_Feedback_usuarios_y_ajustes.pdf) | Feedback de usuarios y ajustes del Sprint 3 |
| [📋 Sprint_4_Planificación_y_backlog.pdf](./docs/sprints/Sprint_4_Planificación_y_backlog.pdf) | Planificación y backlog del Sprint 4 |
| [📋 Sprint_4_Desarrollo_y_resultados.pdf](./docs/sprints/Sprint_4_Desarrollo_y_resultados.pdf) | Desarrollo y resultados del Sprint 4 |
| [📋 Sprint_4_Feedback_usuarios_y_ajustes.pdf](./docs/sprints/Sprint_4_Feedback_usuarios_y_ajustes.pdf) | Feedback de usuarios y ajustes del Sprint 4 |
| [🧪 Resultados_pruebas_unitarias_todos_módulos.pdf](./docs/sprints/Resultados_pruebas_unitarias_todos_módulos.pdf) | Resultados de pruebas unitarias de todos los módulos |
| [🧪 Resultados_pruebas_integración_sprints.pdf](./docs/sprints/Resultados_pruebas_integración_sprints.pdf) | Resultados de pruebas de integración por sprint |
| [🧪 Resultados_pruebas_regresión.pdf](./docs/sprints/Resultados_pruebas_regresión.pdf) | Resultados de pruebas de regresión |
| [🧪 Resultados_pruebas_usabilidad.pdf](./docs/sprints/Resultados_pruebas_usabilidad.pdf) | Resultados de pruebas de usabilidad con usuarios |
| [📝 Actas_reuniones_seguimiento.pdf](./docs/sprints/Actas_reuniones_seguimiento.pdf) | Actas de reuniones de seguimiento |
| [📝 Registro_cambios_alcance.pdf](./docs/sprints/Registro_cambios_alcance.pdf) | Registro de cambios de alcance durante el proyecto |

---

### 🎨 DOCUMENTOS UX/UI

| Documento | Descripción |
|-----------|-------------|
| [🚶 User_journeys_completos_todos_módulos.pdf](./docs/ux_ui/User_journeys_completos_todos_módulos.pdf) | User journeys completos de todos los módulos |
| [🗺️ Arquitectura_de_información_global.pdf](./docs/ux_ui/Arquitectura_de_información_global.pdf) | Arquitectura de información global del sistema |
| [🧭 Mapa_de_navegación_global.pdf](./docs/ux_ui/Mapa_de_navegación_global.pdf) | Mapa de navegación global con estructura de menús |
| [📊 Dashboards_gráficos_y_widgets_por_módulo.pdf](./docs/ux_ui/Dashboards_gráficos_y_widgets_por_módulo.pdf) | Dashboards, gráficos y widgets por módulo |
| [👥 Validación_stakeholders_UX_UI.pdf](./docs/ux_ui/Validación_stakeholders_UX_UI.pdf) | Validación de UX/UI con stakeholders y mejoras incorporadas |
| [🎨 Guía_estilos_design_system.pdf](./docs/ux_ui/Guía_estilos_design_system.pdf) | Guía de estilos y design system del ERP Geco |

---

### 💻 CÓDIGO FUENTE Y BASE DE DATOS

| Documento | Descripción |
|-----------|-------------|
| 📦 GitHub Backend: https://github.com/mazgeco/geco-ms  | Código fuente del backend en Spring Boot (Java 21) |
| 📦 GitHub Frontend: https://github.com/mazgeco/geco-a | Código fuente del frontend en Angular 17+ |
| [🗃️ script_bd_schema_completo.sql](./src/script_bd_schema_completo.sql) | Script completo del esquema de base de datos |
| [🗃️ script_bd_datos_iniciales.sql](./src/script_bd_datos_iniciales.sql) | Script de datos maestros iniciales |
| [🗃️ script_bd_datos_prueba.sql](./src/script_bd_datos_prueba.sql) | Script de datos de prueba para desarrollo |
| [📚 documentación_API_Swagger_OpenAPI.zip](./src/documentación_API_Swagger_OpenAPI.zip) | Documentación de la API (Swagger/OpenAPI) |

---

> 📌 *Los documentos están alojados en la carpeta `/docs` y se abren directamente en el navegador o se descargan según la configuración de GitHub.*

---

## 🧠 Contexto y estado del arte (resumen)

### Problema identificado
El ERP Geco actual presenta una arquitectura monolítica con alto acoplamiento, baja escalabilidad, dificultades de mantenimiento, ausencia de diseño responsivo y procesos manuales que afectan la eficiencia operativa (Pressman, 2010; Bass et al., 2012).

### Solución propuesta
- **Backend:** Migración a **Java 21 + Spring Boot** (microservicios).
- **Frontend:** Migración a **Angular 21** (TypeScript, SPA, diseño responsivo).
- **Arquitectura:** De monolito a microservicios independientes (Newman, 2015).
- **Metodología:** Híbrida (cascada para análisis AS-IS + Scrum para desarrollo TO-BE).

### Principales ventajas
- Escalabilidad independiente por microservicio.
- Despliegue autónomo y tolerancia a fallos aislada.
- Experiencia de usuario mejorada y adaptación a dispositivos móviles.
- Reducción de costes de licencia (Angular frente a Sencha ExtJs).
- Mayor mantenibilidad y reducción de deuda técnica.

---

## 🧩 Metodología híbrida aplicada

| Fase | Enfoque | Actividades clave |
|------|---------|-------------------|
| Análisis AS-IS | Modelo en cascada | Inventario de módulos, dependencias, lógica de negocio, deuda técnica. |
| Diseño TO-BE + desarrollo | Scrum (sprints de 2-3 semanas) | Backlog priorizado, desarrollo incremental de microservicios, integración continua, pruebas automatizadas. |

Este enfoque sigue las recomendaciones de Pressman (2010) para proyectos de modernización de ERP, equilibrando planificación estructurada y adaptabilidad.

---

## 🛠️ Tecnologías clave

| Capa | Tecnología original | Tecnología objetivo |
|------|----------------------|----------------------|
| Backend | PHP, CodeIgniter | Java 21, Spring Boot |
| Frontend | Sencha ExtJs | Angular 17+, TypeScript |
| Arquitectura | Monolito | Microservicios |
| Base de datos | MySQL 5.7 | MySQL 8.0 |
| Seguridad | Sesiones nativas PHP | JWT + Spring Security |
| Despliegue | Manual | Docker + CI/CD (propuesto) |

---

## 📖 Referencias principales

- Bass, L., Clements, P., & Kazman, R. (2012). *Software Architecture in Practice*.
- Fowler, M., & Beck, K. (2019). *Refactoring: Improving the Design of Existing Code*.
- Newman, S. (2015). *Building Microservices*.
- Pressman, R. S. (2010). *Ingeniería del Software. Un enfoque práctico*.
- Sommerville, I., & Domínguez Torres, J. M. (2011). *Ingeniería del software*.
- International Organization for Standardization (2019). *ISO 9241-210: Ergonomics of human-system interaction*.

---

## 👨‍🎓 Autores

- **Naranjo Rodríguez Laura Vanessa** – Módulo de Proveedores
- **Párraga Castro María Magdalena** – Módulo de Productos
- **Zapata Díaz María Gabriela** – Módulo de Reservas

Máster en Ingeniería de Software / Desarrollo de Sistemas Informáticos  
Universidad Internacional de la Rioja (UNIR)

---

## 📄 Licencia

Este documento y el repositorio asociado tienen fines académicos. Para cualquier uso comercial o consulta, contactar con los autores.

---

<p align="center">
  <i>“La modernización de sistemas legacy no es solo tecnología, es una estrategia de negocio.”</i>
</p>