# 📘 Guía rápida de Git

---

# 📑 Menú

1. [Configuración](#configuración)
2. [Repositorio](#repositorio)
3. [Estado](#estado)
4. [Agregar archivos](#agregar-archivos)
5. [Commits](#commits)
6. [Ramas](#ramas)
7. [Actualizar repositorio](#actualizar-repositorio)
8. [Rollback y deshacer cambios](#rollback-y-deshacer-cambios)
9. [Historial](#historial)
10. [Stash](#stash)
11. [Tags](#tags)
12. [Cheat Sheet](#cheat-sheet)

---

# Configuración

⬅️ [Volver al menú](#-menú)

## Configurar usuario

```bash
git config --global user.name "Gabby Otta"
git config --global user.email "correo@dominio.com"
```

Ver configuración

```bash
git config --list
```

---

# Repositorio

⬅️ [Volver al menú](#-menú)

Para añadir un repositorio en git:
``` bash
# Inicializar Git (si aún no existe)
git init
# Añadir todos los archivos
git add .
# Crear el primer commit
git commit -m "Initial commit"
# Cambiar a la rama principal (opcional, pero recomendado)
git branch -M main
# Agregar el repositorio remoto
git remote add origin https://github.com/gabbydeveloper/nombre_repositorio.git
# Enviar los cambios
git push -u origin main
```

---

# Estado

⬅️ [Volver al menú](#-menú)

Ver cambios

```bash
git status
```

---

# Agregar archivos

⬅️ [Volver al menú](#-menú)

Agregar un archivo

```bash
git add archivo.txt
```

Agregar todos

```bash
git add .
```

---

# Commits

⬅️ [Volver al menú](#-menú)

Guardar cambios

```bash
git commit -m "Mensaje"
```

Agregar y hacer commit

```bash
git commit -am "Mensaje"
```

Modificar último commit

```bash
git commit --amend
```

---

# Ramas

⬅️ [Volver al menú](#-menú)

Ver ramas

```bash
git branch
```

Crear rama

```bash
git branch desarrollo
```

Cambiar de rama

```bash
git switch desarrollo
```

o

```bash
git checkout desarrollo
```

Crear y cambiar

```bash
git switch -c desarrollo
```

Eliminar rama

```bash
git branch -d desarrollo
```

---

# Actualizar repositorio

⬅️ [Volver al menú](#-menú)

Enviar cambios

```bash
git push
```

Traer cambios

```bash
git pull
```

Traer sin mezclar

```bash
git fetch
```

Subir rama nueva

```bash
git push -u origin nombre-rama
```

---

# Rollback y deshacer cambios

⬅️ [Volver al menú](#-menú)

## Descartar cambios de un archivo

```bash
git restore archivo.txt
```

---

## Descartar todos los cambios

```bash
git restore .
```

---

## Sacar archivos del Stage

```bash
git restore --staged archivo.txt
```

Todos

```bash
git restore --staged .
```

---

## Eliminar archivos nuevos (no versionados)

```bash
git clean -f
```

Eliminar carpetas también

```bash
git clean -fd
```

Ver qué eliminaría

```bash
git clean -n
```

---

## Volver al último commit (mantiene cambios)

```bash
git reset --soft HEAD~1
```

---

## Volver al último commit (mantiene archivos pero sin Stage)

```bash
git reset --mixed HEAD~1
```

---

## Eliminar completamente el último commit

⚠️ Pierde los cambios.

```bash
git reset --hard HEAD~1
```

---

## Volver a un commit específico

```bash
git reset --hard HASH
```

---

## Revertir un commit sin borrar historial

Ideal cuando ya hiciste Push.

```bash
git revert HASH
```

---

# Historial

⬅️ [Volver al menú](#-menú)

Ver historial

```bash
git log
```

Una línea

```bash
git log --oneline
```

Historial gráfico

```bash
git log --graph --all --decorate --oneline
```

---

# Stash

⬅️ [Volver al menú](#-menú)

Guardar cambios temporalmente

```bash
git stash
```

Ver stashes

```bash
git stash list
```

Recuperar

```bash
git stash pop
```

---

# Tags

⬅️ [Volver al menú](#-menú)

Crear Tag

```bash
git tag v1.0
```

Ver Tags

```bash
git tag
```

Enviar Tags

```bash
git push --tags
```

---

# Cheat Sheet

⬅️ [Volver al menú](#-menú)

| Acción | Comando |
|---------|----------|
| Estado | `git status` |
| Agregar todo | `git add .` |
| Commit | `git commit -m ""` |
| Push | `git push` |
| Pull | `git pull` |
| Fetch | `git fetch` |
| Ver ramas | `git branch` |
| Cambiar rama | `git switch nombre` |
| Crear rama | `git switch -c nombre` |
| Ver historial | `git log --oneline` |
| Descartar archivo | `git restore archivo` |
| Descartar todo | `git restore .` |
| Sacar del Stage | `git restore --staged .` |
| Eliminar archivos nuevos | `git clean -fd` |
| Rollback último commit | `git reset --soft HEAD~1` |
| Eliminar último commit | `git reset --hard HEAD~1` |
| Revertir commit publicado | `git revert HASH` |
| Guardar temporalmente | `git stash` |
| Recuperar stash | `git stash pop` |