<p align="center">
  <img src="logo_geco_transparente.png" alt="Logo Geco" width="200">
</p>

# 📘 Reingeniería integral del ERP Geco mediante una arquitectura moderna y metodologías híbridas para la optimización de procesos y experiencia de usuario

> Trabajo de Fin de Máster (TFM) – Documentación oficial del proyecto de modernización del ERP Geco.

## 📌 Descripción general

Este repositorio contiene la documentación completa del TFM centrado en la **reingeniería integral del sistema ERP Geco**. El proyecto aborda la obsolescencia tecnológica, la rigidez arquitectónica y las limitaciones de experiencia de usuario del sistema actual, proponiendo una migración hacia una arquitectura basada en **microservicios** y un frontend moderno, aplicando **metodologías híbridas** de desarrollo.

El objetivo es transformar el ERP Geco —originalmente construido con PHP, CodeIgniter y Sencha ExtJs— en una plataforma escalable, mantenible, responsiva y alineada con los estándares actuales de ingeniería de software y experiencia de usuario.

---

## 📂 Estructura del repositorio

| Documento | Descripción |
|-----------|-------------|
| [📄 Memoria_TFM_Geco.pdf](./docs/Memoria_TFM_Geco.pdf) | Memoria completa del TFM (contexto, estado del arte, metodología, resultados y conclusiones). |
| [📊 Anexo_Arquitectura_Microservicios.pdf](./docs/Anexo_Arquitectura_Microservicios.pdf) | Detalle técnico de la migración a microservicios con Java 21 y Spring Boot. |
| [🎨 Anexo_UX_UI_Angular.pdf](./docs/Anexo_UX_UI_Angular.pdf) | Análisis de experiencia de usuario y diseño responsivo con Angular 21. |
| [🔄 Anexo_Metodologia_Hibrida.pdf](./docs/Anexo_Metodologia_Hibrida.pdf) | Descripción del enfoque híbrido (cascada para análisis AS-IS + Scrum para desarrollo). |
| [📊 Presentacion_TFM_Geco.pdf](./docs/Presentacion_TFM_Geco.pdf) | Presentación resumen del proyecto. |

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
| Frontend | Sencha ExtJs | Angular 21, TypeScript |
| Arquitectura | Monolito | Microservicios |
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

Naranjo Rodríguez Laura Vanessa  
Párraga Castro María Magdalena  
Zapata Díaz María Gabriela

Máster en Ingeniería de Software / Desarrollo de Sistemas Informáticos  

---

## 📄 Licencia

Este documento y el repositorio asociado tienen fines académicos. Para cualquier uso comercial o consulta, contactar con el autor.

---

<p align="center">
  <i>“La modernización de sistemas legacy no es solo tecnología, es una estrategia de negocio.”</i>
</p>
