# Angular Moderno - Guía Completa (Resumen de Estudio)
## Índice
[1. Crear aplicación Angular](#crear-aplicación-angular)
[2. Comandos varios](#comandos-varios)
[3. Data Binding](#data-binding)
[4. Signals](#signals)
[5. Input button y mostrar texto](#input-button-y-mostrar-texto)
[6. Ciclo de vida de los componentes y eventos varios](#ciclo-de-vida-de-los-componentes-y-eventos-varios)
[7. Inyección de dependencias](#inyección-de-dependencias)
[8. Control flow](#control-flow)
[9. Signals y RxJS](#signals-y-rxjs)
[10. Signals vs RxJS](#signals-vs-rxjs)
[11. Compilar con carpeta](#compilar-con-carpeta-dentro-del-dominio-principal)

## Crear aplicación Angular

```bash
npm install -g @angular/cli
ng new mi-app
cd mi-app
ng serve
```

- Angular 17+ usa **Vite por defecto**
- Vite = más rápido ?
- Webpack = legacy

------------------------------------------------------------------------
## Comandos varios
Crear componente con todo
```bash
ng g c homePage
```
Crear componente sin estilos, ni tests
``` bash
ng g c homePage --inline-style --skip-tests
```
Crear componente sin tests
```bash
ng g c homePage --skip-tests
```


Un componente en Angular es como una célula independiente que tiene capas
para funcionar, tiene las siguientes capas:
- Vista → HTML
- Controlador → TS
- Estilo → CSS

### Instalar PrimeNG
Instalar themes
```bash
npm install primeng @primeuix/themes
```
Además hay que colocar esto en el **app.config.ts**
``` ts
import { ApplicationConfig } from '@angular/core';
import { providePrimeNG } from 'primeng/config';
import Aura from '@primeuix/themes/aura';

export const appConfig: ApplicationConfig = {
    providers: [
        providePrimeNG({
            theme: {
                preset: Aura
            }
        })
    ]
};
```
Instalar íconos
```bash
npm install primeicons
```
Además debes colocar esto en el **angular.json**
```ts
"styles": [
  "node_modules/primeicons/primeicons.css",
  "src/styles.css"
]
```
### Instalar Bootstrap
Instalar librería
```bash
npm install bootstrap
```
Además debes colocar esto en el **angular.json**
```ts
"styles": [
  "node_modules/bootstrap/dist/css/bootstrap.min.css",
  "node_modules/primeicons/primeicons.css",
  "src/styles.css"
]
```
------------------------------------------------------------------------
## Data Binding
Data Binding (Enlace de datos) de una vía:
### Interpolación
```html
<td>
  <span>{{ courseName }}</span>
</td>
```
### Property binding con corchetes
```html
<td>
  <input [type]="inputType">
</td>
```
### Event binding con paréntesis
```html
<td>
  <button (click)="showWelcomeMessage()">Message</button>
</td>
```
### Data Binding (Enlace de datos) de dos vías
```html
<!-- Con ngModel -->
<td>
  <input type="text" [(ngModel)]="courseName">
</td>
```
------------------------------------------------------------------------
## Signals
Un signal es una variable reactiva en Angular. 
Significa que:
- Guarda un valor
- Cuando cambia la UI se actualiza sola
```ts
import { signal } from '@angular/core';
contador = signal(0);
```
Un computed signal es un valor que se calcula automáticamente a partir de otros signals.\
Angular lo recalcula solo.
```ts
import { computed } from '@angular/core';
doble = computed(() => this.contador() * 2);
```
El valor de un signal se cambia de dos formas:
- Reemplazando el valor
```ts
this.contador.set(10);
```
- Actualizar basado en el anterior
```ts
this.contador.update(valor => valor + 1);
```
Un signal se lee siempre como función:

**TypeScript**
```ts
this.contador()
```
**HTML**
```html
<p>{{ contador() }}</p>
```
------------------------------------------------------------------------

## Input button y mostrar texto

### HTML

```html
<input type="text" #miInput />
<button (click)="mostrarTexto(miInput.value)">Mostrar</button>
<span>{{ textoMostrado }}</span>
```

### TS

```ts
textoMostrado: string = '';

mostrarTexto(texto: string) {
  this.textoMostrado = this.texto;
}
```

------------------------------------------------------------------------

## Ciclo de vida de los componentes y eventos varios

### OnInit
Usar para:
- Disparar llamadas de APIs
- Suscribe
```ts
import { OnInit } from '@angular/core';

export class AppComponent implements OnInit {

  ngOnInit(): void {
    this.cargarDatos();
  }

  cargarDatos() {
    console.log('Init');
  }
}
```
### ngAfterViewInit
Usar para:
- Acceder a elementos del DOM con `@ViewChild`
```ts
@ViewChild('miInput') input!: ElementRef;

ngAfterViewInit() {
  this.input.nativeElement.focus();
}
```
- Inicializar librerías externas para gráficos, sliders o mapas
- Medir elementos: tamaños, porciones, ancho, alto, posición

### ngOnDestroy
Usar para:
- Unsuscribe
- Restringir el uso desde la navegación


### Diferencias de uso para ngOnInit y el constructor
- constructor = inyección
- ngOnInit = lógica

------------------------------------------------------------------------

## Inyección de dependencias

### Constructor

```ts
constructor(private servicio: MiServicio) {}
```

### inject (moderno)

```ts
import { inject } from '@angular/core';
servicio = inject(MiServicio);
```

### ¿Cuándo usar cada uno?

### inject()

- Código limpio
- Recomendado

### constructor

- Muchas dependencias
- Herencia
- Decoradores especiales

### Ejm: Servicio usuario

```ts
@Injectable({ providedIn: 'root' })
export class AuthService {
  getUsuario() {
    return { nombre: 'Gabby', email: 'test@mail.com' };
  }
}
```

``` ts
auth = inject(AuthService);

ngOnInit() {
  this.usuario = this.auth.getUsuario();
}
```

------------------------------------------------------------------------

## Control flow

### Los controles son:

- @if 
- @else 
- @for 
- @switch

```html
@if (isVisible) {
  <p>Aparece</p>
} @else {
  <p>No aparece</p>
}

@for (item of lista; track item.id) {
  <p>{{ item.nombre }}</p>
}

@switch (estado) {
  @case ('loading') {
    <p>Cargando...</p>
  }
  @case ('success') {
    <p>Todo bien ??</p>
  }
  @default {
    <p>Error</p>
  }
}
```
------------------------------------------------------------------------

## Signals y RxJS

### Convertir observable

```ts
import { toSignal } from '@angular/core/rxjs-interop';
usuario = toSignal(this.auth.getUsuario());
```
### Reglas clave

- signal → estado 
- computed → derivado 
- effect → reacción

------------------------------------------------------------------------

## Signals vs RxJS

### Signals

- Estado local
- Simple

### RxJS

- Async complejo 
- Eventos 
- Streams

### Regla final

- Estado → signals 
- Async complejo → RxJS

## Compilar con carpeta dentro del dominio principal
```bash
ng build --base-href /rifatino/
```