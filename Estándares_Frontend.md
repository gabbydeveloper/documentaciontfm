# Estándares Frontend
Estos estándares han sido creados para generalizar la programación del Frontend del ERP Geco.
## Formas
### HTML para las formas
```html
<!-- ====================================================== -->
<!-- COMPONENTES GLOBALES                                  -->
<!-- ====================================================== -->
<p-toast />
<p-confirmdialog />


<!-- ====================================================== -->
<!-- CONTENEDOR PRINCIPAL                                   -->
<!-- ====================================================== -->
<div class="col-12">

  <!-- ==================================================== -->
  <!-- TOOLBAR                                              -->
  <!-- ==================================================== -->
  <p-toolbar>

    <ng-template #start>

      <!-- ================================================= -->
      <!-- ACCIONES DEL PROCESO                              -->
      <!-- ================================================= -->

      <!-- ACCIÓN PRINCIPAL -->
      <p-button
        icon="pi pi-check"
        class="mr-1"
        label="Acción"
        pTooltip="Ejecuta la acción principal"
        tooltipPosition="bottom"
        (onClick)="ejecutarAccion()" />

      <!-- AUDITORÍA -->
      <p-button
        icon="pi pi-history"
        class="mr-1"
        pTooltip="Muestra la auditoría del registro actual"
        tooltipPosition="bottom"
        (onClick)="mostrarAuditoria()" />

      <!-- INFORMACIÓN -->
      <p-button
        icon="pi pi-info-circle"
        pTooltip="Muestra información del objeto actual"
        tooltipPosition="bottom"
        (onClick)="mostrarInformacion()" />

    </ng-template>


    <ng-template #center>
      <span></span>
    </ng-template>


    <ng-template #end>

      @if (formMessage()?.visible) {

        <div class="message-container">

          <p-message
            [severity]="formMessage()!.severity"
            [icon]="formMessage()!.icon">

            {{ formMessage()!.text }}

          </p-message>

        </div>

      }

    </ng-template>

  </p-toolbar>


  <!-- ==================================================== -->
  <!-- FORMULARIO                                           -->
  <!-- ==================================================== -->
  <form
    id="frm0000"
    class="grid m-0"
    [formGroup]="formulario">

    <!-- ================================================== -->
    <!-- PANEL / SECCIÓN 1                                  -->
    <!-- ================================================== -->
    <p-panel class="col-12">

      <!-- TÍTULO DE LA SECCIÓN SI APLICA -->
      <!--
      <ng-template #header>
        <span>Información principal</span>
      </ng-template>
      -->

      <div class="grid">

        <!-- ================================================ -->
        <!-- CAMPO 1                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo1">
              Campo 1
            </label>

            <input
              id="campo1"
              type="text"
              pInputText
              class="w-full"
              formControlName="campo1" />

          </div>

        </div>


        <!-- ================================================ -->
        <!-- CAMPO 2                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo2">
              Campo 2
            </label>

            <p-select
              id="campo2"
              class="w-full"
              [options]="opciones()"
              formControlName="campo2"
              optionLabel="etiqueta"
              optionValue="codigo">
            </p-select>

          </div>

        </div>


        <!-- ================================================ -->
        <!-- CAMPO 3                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo3">
              Campo 3
            </label>

            <p-datepicker
              id="campo3"
              class="w-full"
              dateFormat="yy-mm-dd"
              formControlName="campo3">
            </p-datepicker>

          </div>

        </div>


        <!-- ================================================ -->
        <!-- CAMPO 4                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo4">
              Campo 4
            </label>

            <input
              id="campo4"
              type="email"
              pInputText
              class="w-full"
              formControlName="campo4" />

          </div>

        </div>

      </div>

    </p-panel>


    <!-- ================================================== -->
    <!-- PANEL / SECCIÓN 2                                  -->
    <!-- ================================================== -->
    <p-panel class="col-12">

      <div class="grid">

        <!-- ================================================ -->
        <!-- CAMPO 5                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo5">
              Campo 5
            </label>

            <input
              id="campo5"
              type="text"
              pInputText
              class="w-full"
              formControlName="campo5" />

          </div>

        </div>


        <!-- ================================================ -->
        <!-- CAMPO 6                                         -->
        <!-- ================================================ -->
        <div class="col-12 md:col-6">

          <div class="field mb-1">

            <label for="campo6">
              Campo 6
            </label>

            <p-select
              id="campo6"
              class="w-full"
              [options]="opciones()"
              [filter]="true"
              formControlName="campo6"
              optionLabel="etiqueta"
              optionValue="codigo">
            </p-select>

          </div>

        </div>

      </div>

    </p-panel>

  </form>

</div>
```

# Estándares para formas

### 1. Estructura general

Toda forma debe mantener la siguiente estructura:

```text
Contenedor
 ├── Toast
 ├── ConfirmDialog
 ├── Toolbar
 │    ├── Acciones
 │    └── Mensajes
 └── Formulario
      ├── Panel / Sección
      ├── Panel / Sección
      └── Panel / Sección
```

La estructura debe mantenerse aunque una forma tenga pocos campos.

### 2. Identificación

El formulario debe tener un identificador único siguiendo la nomenclatura, el mismo del Geco anerior, en este formato: FrmXxx0000, donde Xxx es el prefijo del módulo, el objeto se crea así:

```bash
ng g c FrmXxx000 --skip-tests
```

El id se pone así en la forma, por ejemplo:

```html
<form id="frmPer0001">
```

Cada control debe tener un `id` cuando el componente lo permita, especialmente aquellos que tengan un `label` asociado.

### 3. Formularios reactivos

Las formas deben utilizar **Reactive Forms**.

Estándar:

```html
<form
  id="frm0001"
  class="grid m-0"
  [formGroup]="formulario">
```

Los valores deben manejarse mediante `formControlName` y no mediante `ngModel`.

### 4. Distribución responsive

La distribución estándar de los campos será:

```html
<div class="col-12 md:col-6">
```

Esto significa:

```text
Pantallas pequeñas → 1 campo por fila
Pantallas medianas/grandes → 2 campos por fila
```

Cuando un campo necesite ocupar todo el ancho:

```html
<div class="col-12">
```

No se deben utilizar anchos fijos para los controles.

### 5. Controles

Todos los controles deben ocupar el ancho disponible del contenedor:

```html
class="w-full"
```

Ejemplos:

```html
<input pInputText class="w-full">

<p-select class="w-full">

<p-datepicker class="w-full">
```

### 6. Etiquetas

Todo campo debe tener una etiqueta descriptiva.

Estándar:

```html
<label for="campo">
  Nombre del campo
</label>
```

El texto debe ser claro para el usuario y no corresponder necesariamente al nombre técnico del atributo.

### 7. Espaciado

Cada control debe utilizar:

```html
<div class="field mb-1">
```

El formulario principal debe utilizar:

```html
class="grid m-0"
```

Esto mantiene una separación visual uniforme entre los campos y evita márgenes externos innecesarios.

### 8. Organización por paneles

Los campos deben agruparse en `p-panel` cuando pertenezcan a una misma categoría funcional.

Por ejemplo:

```text
Información general
Información de contacto
Información adicional
Configuración
```

No se debe crear un panel por cada campo.

### 9. Combos

Los combos deben utilizar `p-select`.

Cuando el número de opciones pueda ser considerable, se debe habilitar búsqueda:

```html
[p-filter]="true"
```

El patrón estándar será:

```html
<p-select
  class="w-full"
  [options]="opciones()"
  [filter]="true"
  formControlName="campo"
  optionLabel="etiqueta"
  optionValue="codigo">
</p-select>
```

### 10. Fechas

Las fechas deben utilizar `p-datepicker`.

Formato estándar:

```html
dateFormat="yy-mm-dd"
```

Ejemplo:

```html
<p-datepicker
  class="w-full"
  dateFormat="yy-mm-dd"
  formControlName="fecha">
</p-datepicker>
```

### 11. Estados de la forma

Cuando un registro tenga estados como:

```text
Activo / Inactivo
Habilitado / Deshabilitado
Editable / No editable
```

la interfaz debe reflejar visualmente el estado y controlar la edición de los campos según las reglas del proceso.

Las reglas de negocio deben mantenerse en TypeScript y no distribuirse innecesariamente dentro del HTML.

### 12. Acciones del toolbar

Las acciones deben ubicarse en el `#start` del toolbar.

Las acciones comunes son:

```text
Guardar / Procesar
Activar / Inactivar
Auditoría
Información
```

No todas las formas deben tener todas las acciones. Solo deben mostrarse las que correspondan al proceso.

### 13. Auditoría

La acción de auditoría debe utilizar un icono asociado al historial:

```html
icon="pi pi-history"
```

Debe mostrar la auditoría del registro actual.

### 14. Información del objeto

La acción de información debe utilizar:

```html
icon="pi pi-info-circle"
```

y utilizar la función estándar de la librería:

```typescript
this.funciones.muestraInfoObjeto(
  this.idContenedor(),
  this.idObjeto(),
  this.idTabla(),
  this.permiso()
);
```

### 15. Mensajes

Los mensajes específicos del formulario deben mostrarse en el área `#end` del toolbar.

Se debe utilizar el servicio estándar de mensajes y no implementar mecanismos diferentes para cada formulario.

### 16. Confirmaciones

Las operaciones destructivas o irreversibles deben solicitar confirmación mediante:

```html
<p-confirmdialog />
```

No se deben utilizar diálogos personalizados para operaciones que puedan resolverse mediante el componente estándar.

### 17. Condicionales

Cuando ciertos campos dependan de una condición del proceso, se debe utilizar la sintaxis de control de Angular:

```html
@if (condicion) {
  ...
}
```

La condición debe representar una regla de negocio claramente identificable.

### 18. Orden de los campos

Los campos deben organizarse siguiendo el flujo natural de captura de información:

```text
Identificación
→ Información principal
→ Información complementaria
→ Información de contacto
→ Configuración
```

La distribución debe priorizar la experiencia del usuario y no el orden de las propiedades del objeto TypeScript.

### 19. Campos obligatorios

Los campos obligatorios deben estar claramente identificados y su validación debe implementarse en el `FormGroup`.

Ejemplo:

```typescript
campo: ['', Validators.required]
```

La validación visual debe ser consistente en todas las formas.

### 20. Responsabilidad del HTML

El HTML debe encargarse principalmente de:

```text
Presentación
Distribución
Binding
Controles visuales
Estados de presentación
```

La lógica de negocio, validaciones complejas y procesamiento de información deben permanecer en TypeScript o en los servicios correspondientes.


```typescript
// ==========================================================
// IMPORTS CORE
// ==========================================================
import {
  Component,
  computed,
  inject,
  Input,
  OnInit,
  signal
} from '@angular/core';

import {
  ReactiveFormsModule,
  FormBuilder
} from '@angular/forms';


// ==========================================================
// IMPORTS GENERALES
// ==========================================================

// Reemplazar por las interfaces correspondientes al formulario.
// import { Registro, Combo } from '../../../../interfaces/registro.interfaces';


// ==========================================================
// IMPORTS PRIME NG
// ==========================================================
import { ConfirmationService } from 'primeng/api';
import { PRIMENG_MODULES } from '../../../../shared/primeng/primeng.imports';


// ==========================================================
// SERVICIOS
// ==========================================================
import { FuntionsService } from '../../../../services/functions.service';
import { MessageService } from '../../../../services/message.service';
import { ToastService } from '../../../../services/toast.service';

// Reemplazar por el servicio correspondiente.
// import { RegistroService } from '../../../../services/registro.service';

// Reemplazar por el StateService correspondiente si aplica.
// import { StateService } from '../state-service';

import { StatusMessage } from '../../../../interfaces/general.interface';


@Component({
  selector: 'app-frm-0000',
  imports: [...PRIMENG_MODULES, ReactiveFormsModule],
  providers: [ConfirmationService],
  templateUrl: './frm-0000.html',
  styleUrl: './frm-0000.css',
})
export class Frm0000 implements OnInit {


  /******************************************************************************************
  * TOMA DEL PARÁMETRO ENVIADO EN LA LLAMADA DEL SELECTOR
  *******************************************************************************************/

  @Input()
  idRegistro!: number;


  /******************************************************************************************
  * IDENTIFICADORES PRINCIPALES
  *******************************************************************************************/

  idContenedor = signal<string>('Win0000');
  idObjeto = signal<string>('Frm0000');
  idTabla = signal<string>('000');
  permiso = signal<string>('w');


  /******************************************************************************************
  * ENUMS
  *******************************************************************************************/

  // Exponer enums al HTML cuando el formulario los necesite.
  // readonly EstadoRegistro = EstadoRegistro;


  /******************************************************************************************
  * INYECCIONES
  *******************************************************************************************/

  // SERVICIOS PÚBLICOS
  funciones = inject(FuntionsService);
  messageService = inject(MessageService);

  // SERVICIOS PRIVADOS
  private toastService = inject(ToastService);
  private confirmationService = inject(ConfirmationService);
  private fb = inject(FormBuilder);

  // SERVICIO DEL PROCESO
  // private registroService = inject(RegistroService);

  // STATE SERVICE, CUANDO APLIQUE
  // stateService = inject(StateService);


  /******************************************************************************************
  * MANEJO DE MENSAJES
  *******************************************************************************************/

  statusMessages = signal<Record<string, StatusMessage>>({});

  formMessage = computed(() =>
    this.messageService.obtener(
      this.statusMessages,
      'msgFrm0000'
    )
  );


  /******************************************************************************************
  * VARIABLES GENERALES DEL FORMULARIO
  *******************************************************************************************/

  loadingRegistro = signal(true);

  successfullySaved = signal(false);

  // Variables de estado cuando el formulario las necesite.
  // estadoRegistro = signal<string>('ACTIVO');
  // esActivo = signal<boolean>(false);


  /******************************************************************************************
  * LISTAS / COMBOS
  *******************************************************************************************/

  opciones = signal<any[]>([]);

  // Ejemplos:
  // tiposRegistro = signal<Combo[]>([]);
  // categorias = signal<Combo[]>([]);
  // estados = signal<Combo[]>([]);


  /******************************************************************************************
  * DECLARACIÓN DEL FORMULARIO
  *******************************************************************************************/

  public formulario = this.fb.group({

    idRegistro: [0],

    // =====================================================
    // CAMPOS DEL FORMULARIO
    // =====================================================

    campo1: [''],
    campo2: [''],
    campo3: [''],
    campo4: [''],
    campo5: [''],
    campo6: [''],

    // =====================================================
    // CAMPOS DE CONTROL
    // =====================================================

    estadoRegistro: [''],

    // =====================================================
    // CAMPOS DE AUDITORÍA
    // =====================================================

    idUsuarioCrea: [''],
    fechaCrea: [''],
    idUsuarioModifica: [''],
    fechaModifica: ['']

  }, {
    updateOn: 'blur'
  });


  /******************************************************************************************
  * GETTERS
  *******************************************************************************************/

  // OBTIENE LOS DATOS ACTUALES DEL FORMULARIO
  get currentData(): any {
    return this.formulario.getRawValue();
  }


  // OBTIENE EL VALOR DE UN CAMPO DEL FORMULARIO
  get campoPrincipalActual(): string | null | undefined {
    return this.formulario.get('campo1')?.value;
  }


  /******************************************************************************************
  * MÉTODOS QUE EJECUTAN LOS PROCESOS
  *******************************************************************************************/

  // ========================================================================================
  // INICIALIZACIÓN DEL FORMULARIO
  // ========================================================================================

  ngOnInit(): void {

    // CARGA LAS LISTAS / COMBOS
    this.cargarCombos();

    // CARGA EL REGISTRO
    this.cargarRegistro(this.idRegistro);


    // ======================================================
    // DETECCIÓN DE CAMBIOS DEL FORMULARIO
    // ======================================================

    this.formulario.valueChanges.subscribe(registro => {

      // NO PROCESA LOS CAMBIOS MIENTRAS SE CARGA EL REGISTRO
      if (this.loadingRegistro()) {
        return;
      }


      // ====================================================
      // REGLAS O TRANSFORMACIONES AUTOMÁTICAS
      // ====================================================

      /*
      Ejemplo:

      if (registro.campo1 && registro.campo2) {

        registro.campo3 =
          registro.campo1 + ' ' + registro.campo2;

      }
      */


      // ====================================================
      // GUARDADO
      // ====================================================

      this.guardarFormulario(
        registro as any
      );

    });

  }


  // ========================================================================================
  // CARGA DE COMBOS / LISTAS
  // ========================================================================================

  cargarCombos(): void {

    /*
    Ejemplo:

    this.registroService.listaOpciones()
      .subscribe({

        next: (resp) => {
          this.opciones.set(resp.data);
        },

        error: (err) => {

          this.toastService.showMessage(
            'error',
            'Error',
            'Ha ocurrido un error al cargar las opciones: '
            + err.error.message,
            err.error.status
          );

        }

      });
    */

  }


  // ========================================================================================
  // CARGA DEL REGISTRO
  // ========================================================================================

  cargarRegistro(idRegistro: number): void {

    this.loadingRegistro.set(true);


    // ======================================================
    // REGISTRO EXISTENTE
    // ======================================================

    if (idRegistro !== 0) {

      /*
      this.registroService.registroPorId(idRegistro)
        .subscribe({

          next: (resp) => {

            // TRANSFORMACIONES ANTES DE CARGAR
            // resp.data.fecha = this.funciones.convertirAFecha(
            //   resp.data.fecha
            // );


            // CARGA LOS DATOS EN EL FORMULARIO
            this.formulario.reset(resp.data);


            // FINALIZA EL ESTADO DE CARGA
            this.loadingRegistro.set(false);


            // MENSAJE DE ÉXITO
            this.messageService.mostrar(
              this.statusMessages,
              'msgFrm0000',
              'success',
              'Registro cargado correctamente.'
            );

          },

          error: (err) => {

            this.loadingRegistro.set(false);

            // MENSAJE EN LA BARRA
            this.messageService.mostrar(
              this.statusMessages,
              'msgFrm0000',
              'error',
              'El registro no se cargó correctamente.'
            );


            // MENSAJE DE ERROR
            this.toastService.showMessage(
              'error',
              'Error',
              'Ha ocurrido un error al cargar los datos: '
              + err.error.message,
              err.error.status
            );

          }

        });

      */

    } else {

      // FORMULARIO PARA NUEVO REGISTRO
      this.loadingRegistro.set(false);

    }

  }


  // ========================================================================================
  // GUARDAR / ACTUALIZAR EL REGISTRO
  // ========================================================================================

  guardarFormulario(registro: any): void {

    /*
    this.registroService.guardar(
      this.idRegistro,
      registro
    )?.subscribe({

      next: (resp) => {

        // ACTUALIZA EL ID CUANDO SE CREA UN NUEVO REGISTRO
        this.idRegistro = resp.idSecuencial;


        // INDICA QUE SE GUARDÓ CORRECTAMENTE
        this.successfullySaved.set(true);


        // MENSAJE DE ÉXITO
        this.messageService.mostrar(
          this.statusMessages,
          'msgFrm0000',
          'success',
          'Dato grabado correctamente.'
        );

      },

      error: (err) => {

        this.successfullySaved.set(false);

        this.toastService.showMessage(
          'error',
          'Error',
          'Ha ocurrido un error al grabar: '
          + err.error.message,
          err.error.status
        );

      }

    });
    */

  }


  // ========================================================================================
  // CAMBIAR ESTADO
  // ========================================================================================

  cambiarEstado(estado: any): void {

    this.confirmationService.confirm({

      message: '¿Realmente desea cambiar el estado del registro?',
      header: 'Cambio de estado',
      acceptLabel: 'Aceptar',
      rejectLabel: 'Cancelar',

      accept: () => {

        // ==================================================
        // ACTUALIZA EL FORMULARIO
        // ==================================================

        this.formulario.patchValue({
          estadoRegistro: estado
        });


        // ==================================================
        // ACTUALIZA STATE SI APLICA
        // ==================================================

        /*
        this.stateService.registro.update(
          r => ({
            ...r!,
            estadoRegistro: estado
          })
        );
        */

      }

    });

  }


  // ========================================================================================
  // MOSTRAR AUDITORÍA
  // ========================================================================================

  mostrarAuditoria(): void {

    this.funciones.muestraAuditoria(
      this.idRegistro,
      this.idTabla(),
      this.currentData
    );

  }


  // ========================================================================================
  // MOSTRAR INFORMACIÓN DEL OBJETO
  // ========================================================================================

  mostrarInformacion(): void {

    this.funciones.muestraInfoObjeto(
      this.idContenedor(),
      this.idObjeto(),
      this.idTabla(),
      this.permiso()
    );

  }

}
```

# Estándares para TypeScript de formas

### 1. Estructura del componente

Todos los componentes de tipo formulario deben mantener este orden:

```text
Imports
↓
@Input
↓
Identificadores principales
↓
Enums
↓
Inyecciones
↓
Manejo de mensajes
↓
Variables generales
↓
Combos / listas
↓
Formulario
↓
Getters
↓
ngOnInit()
↓
Carga de combos
↓
Carga del registro
↓
Guardado
↓
Cambio de estado
↓
Auditoría
↓
Información
```

### 2. Reactive Forms

Todas las formas deben utilizar `ReactiveFormsModule` y `FormBuilder`.

El formulario debe declararse mediante:

```typescript
this.fb.group({...})
```

y los controles deben vincularse mediante `formControlName`.

### 3. Identificadores

Los identificadores principales del componente deben seguir el patrón:

```typescript
idContenedor
idObjeto
idTabla
permiso
```

Estos valores permiten utilizar las funciones genéricas de auditoría e información.

### 4. Signals

Se deben utilizar `signal()` para estados y colecciones que cambien durante el ciclo de vida del componente.

Ejemplo:

```typescript
loadingRegistro = signal(true);
registros = signal<Registro[]>([]);
```

### 5. Mensajes

Todos los formularios deben utilizar el mecanismo estándar:

```typescript
statusMessages = signal<Record<string, StatusMessage>>({});
```

y:

```typescript
formMessage = computed(() =>
  this.messageService.obtener(
    this.statusMessages,
    'msgFrm0000'
  )
);
```

### 6. Carga inicial

`ngOnInit()` debe limitarse a iniciar la carga de la información necesaria:

```typescript
ngOnInit(): void {
  this.cargarCombos();
  this.cargarRegistro(this.idRegistro);
}
```

### 7. Control de carga inicial

Cuando se utilice `valueChanges` para guardar automáticamente, **debe existir un mecanismo que impida ejecutar el guardado mientras se cargan los datos iniciales**.

Patrón estándar:

```typescript
if (this.loadingRegistro()) {
  return;
}
```

Esto evita el problema de ejecutar el guardado durante el `reset()` inicial del formulario.

### 8. Guardado automático

Cuando el proceso lo requiera, los cambios pueden manejarse mediante:

```typescript
this.formulario.valueChanges.subscribe(...)
```

La lógica de transformación de datos debe ejecutarse antes del método de guardado.

### 9. Combos

La carga de catálogos debe centralizarse en:

```typescript
cargarCombos()
```

Cada llamada al servicio debe actualizar el `signal` correspondiente.

### 10. Carga del registro

La consulta del registro debe estar aislada en:

```typescript
cargarRegistro(idRegistro)
```

Debe contemplar al menos:

```text
Registro nuevo
Registro existente
Transformación de datos
Carga del formulario
Manejo de errores
Mensaje de resultado
```

### 11. Guardado

La creación y actualización deben centralizarse en un único método:

```typescript
guardarFormulario()
```

El componente no debe duplicar lógica de creación y actualización cuando el servicio ya soporta ambas operaciones.

### 12. Cambio de estado

Los cambios de estado deben solicitar confirmación mediante `ConfirmationService`.

Después de confirmar:

```text
Actualizar estado visual
↓
Actualizar FormGroup
↓
Actualizar StateService si aplica
```

### 13. StateService

El `StateService` debe utilizarse únicamente cuando sea necesario compartir información entre componentes relacionados.

No debe utilizarse para almacenar información que solo corresponde al formulario actual.

### 14. Auditoría

La auditoría debe delegarse a la función estándar:

```typescript
this.funciones.muestraAuditoria(
  this.idRegistro,
  this.idTabla(),
  this.currentData
);
```

### 15. Información del objeto

La información debe delegarse a:

```typescript
this.funciones.muestraInfoObjeto(
  this.idContenedor(),
  this.idObjeto(),
  this.idTabla(),
  this.permiso()
);
```

### 16. Manejo de errores

Los errores de servicios deben:

1. Mostrar un mensaje mediante `ToastService`.
2. Mostrar un mensaje de estado en el formulario cuando corresponda.
3. Restablecer los indicadores de carga.

### 17. Responsabilidad del componente

El TypeScript del formulario debe encargarse de:

```text
Estado de la interfaz
FormGroup
Carga de información
Validaciones
Transformaciones
Comunicación con servicios
Mensajes
Acciones del formulario
```

La lógica de acceso a datos debe permanecer en los servicios y no en el componente.

### 18. Código específico del negocio

Las reglas particulares del módulo deben identificarse claramente y no mezclarse con la infraestructura estándar.

Por ejemplo:

```typescript
// ======================================================
// REGLAS ESPECÍFICAS DEL PROCESO
// ======================================================
```

Así se puede distinguir rápidamente entre:

**estándar técnico**
y
**regla de negocio**.




## Grids
### Estándares para grids
- El identificador del grid debe seguir la nomenclatura GrdXxxx0000, los nombres son los mismos del Geco anterior, hay que crearlo así: 
	```bash
	ng g c GrdXxx0000 --skip-tests
	```
- Todos los grids deben utilizar `p-table`.
- Los botones del toolbar deben utilizar identificadores secuenciales.
- Todo grid debe incluir toolbar cuando el proceso requiera acciones.
- Las acciones estándar son:
  - Insertar
  - Eliminar
  - Refrescar
  - Auditoría
  - Información
- Los registros deben utilizar `dataKey`.
- Para edición inline se debe utilizar `editMode="row"`.
- Los grids editables deben utilizar `p-cellEditor`.
- Cada celda editable debe definir:
  - `input`: componente utilizado para edición.
  - `output`: representación del valor en modo consulta.
- La columna de acciones debe ubicarse al final.
- Los botones de acción deben utilizar iconografía PrimeIcons.
- Los identificadores de botones que dependen del registro deben concatenar el identificador único del registro.
- Las listas deben utilizar paginación cuando el volumen de información pueda crecer.
- Se debe utilizar `showGridlines` y tamaño `small` como estándar visual.

### HTML Para los Grids

```html
<div class="col-12">
  <!-- ===================================== -->
  <!-- TOOLBAR -->
  <!-- ===================================== -->
  <p-toolbar>
    <ng-template #start>
      <!-- INSERTAR -->
      <p-button
        id="btnGrd00101"
        icon="pi pi-plus"
        class="mr-1"
        label="Insertar"
        pTooltip="Inserta una fila"
        tooltipPosition="bottom"
        (onClick)="insertarRegistro()" />
      <!-- ELIMINAR VARIOS -->
      <p-button
        id="btnGrd00102"
        icon="pi pi-trash"
        class="mr-1"
        label="Eliminar"
        pTooltip="Elimina las filas seleccionadas"
        tooltipPosition="bottom"
        (onClick)="eliminarVarios()" />
      <!-- REFRESCAR -->
      <p-button
        id="btnGrd00103"
        icon="pi pi-refresh"
        class="mr-1"
        pTooltip="Refresca los datos del grid"
        tooltipPosition="bottom"
        (onClick)="cargarRegistros()" />
      <!-- AUDITORÍA -->
      <p-button
        id="btnGrd00104"
        icon="pi pi-history"
        class="mr-1"
        pTooltip="Muestra la auditoría del registro seleccionado"
        tooltipPosition="bottom"
        (onClick)="mostrarAuditoria()" />
      <!-- INFORMACIÓN -->
      <p-button
        id="btnGrd00105"
        icon="pi pi-info-circle"
        pTooltip="Muestra información del objeto"
        tooltipPosition="bottom"
        (onClick)="mostrarInformacion()" />
    </ng-template>

    <ng-template #center>
      <span></span>
    </ng-template>

    <ng-template #end>
      @if (gridMessage()?.visible) {
        <div class="message-container">
          <p-message
            [severity]="gridMessage()!.severity"
            [icon]="gridMessage()!.icon">
            {{ gridMessage()!.text }}
          </p-message>
        </div>
      }
    </ng-template>
  </p-toolbar>

  <!-- ===================================== -->
  <!-- GRID -->
  <!-- ===================================== -->
  <p-table
    id="grd0010"
    [value]="registros()"
    editMode="row"
    selectionMode="multiple"
    [(selection)]="selectedRows"
    [metaKeySelection]="metaKey"
    dataKey="idRegistro"
    class="p-datatable-sm"
    [paginator]="true"
    [rows]="10"
    showGridlines
    [size]="'small'">

    <!-- ===================================== -->
    <!-- HEADER -->
    <!-- ===================================== -->
    <ng-template pTemplate="header">
      <tr>
        <th style="width: 25%">
          Campo 1
        </th>
        <th style="width: 30%">
          Campo 2
        </th>
        <th style="width: 25%">
          Campo 3
        </th>
        <th style="width: 10%">
          Campo 4
        </th>
        <th style="width: 10%">
        </th>
      </tr>
    </ng-template>
    <!-- ===================================== -->
    <!-- BODY -->
    <!-- ===================================== -->
    <ng-template
      pTemplate="body"
      let-rowData
      let-editing="editing"
      let-rowIndex="rowIndex">
      <tr
        [pEditableRow]="rowData"
        [pSelectableRow]="rowData"
        [pSelectableRowIndex]="rowIndex">
        <!-- ================================= -->
        <!-- CAMPO 1 -->
        <!-- ================================= -->
        <td>
          <p-cellEditor>
            <!-- INPUT -->
            <ng-template pTemplate="input">
              <input
                pInputText
                type="text"
                [(ngModel)]="rowData.campo1"
                class="w-full" />
            </ng-template>
            <!-- OUTPUT -->
            <ng-template pTemplate="output">
              {{ rowData.campo1 }}
            </ng-template>
          </p-cellEditor>
        </td>

        <!-- ================================= -->
        <!-- CAMPO 2 -->
        <!-- ================================= -->
        <td>
          <p-cellEditor>
            <!-- INPUT -->
            <ng-template pTemplate="input">
              <input
                pInputText
                type="text"
                [(ngModel)]="rowData.campo2"
                class="w-full" />
            </ng-template>
            <!-- OUTPUT -->
            <ng-template pTemplate="output">
              {{ rowData.campo2 }}
            </ng-template>
          </p-cellEditor>
        </td>
        <!-- ================================= -->
        <!-- CAMPO 3 -->
        <!-- ================================= -->
        <td>
          <p-cellEditor>
            <!-- INPUT -->
            <ng-template pTemplate="input">
              <p-datepicker
                [(ngModel)]="rowData.campo3"
                appendTo="body"
                dateFormat="yy-mm-dd"
                class="w-full" />
            </ng-template>
            <!-- OUTPUT -->
            <ng-template pTemplate="output">
              {{ rowData.campo3 | date:'yyyy-MM-dd' }}
            </ng-template>
          </p-cellEditor>
        </td>
        <!-- ================================= -->
        <!-- ESTADO -->
        <!-- ================================= -->
        <td class="text-center">
          <p-cellEditor>
            <!-- INPUT -->
            <ng-template pTemplate="input">
              <p-checkbox
                [binary]="true"
                [(ngModel)]="rowData.estado">
              </p-checkbox>
            </ng-template>
            <!-- OUTPUT -->
            <ng-template pTemplate="output">
              <i
                class="pi"
                [ngClass]="rowData.estado
                  ? 'pi-check-circle text-green-500'
                  : 'pi-circle'">
              </i>
            </ng-template>
          </p-cellEditor>
        </td>
        <!-- ================================= -->
        <!-- ACCIONES -->
        <!-- ================================= -->
        <td class="text-center">
          <!-- EDITAR / ELIMINAR -->
          @if (!editing) {
            <button
              pButton
              [id]="'btnGrd00106' + rowData.idRegistro"
              pInitEditableRow
              icon="pi pi-pencil"
              text
              rounded
              severity="primary">
            </button>
            <button
              pButton
              [id]="'btnGrd00107' + rowData.idRegistro"
              icon="pi pi-trash"
              text
              rounded
              severity="danger"
              (click)="eliminarRegistro(rowData)">
            </button>
          }
          <!-- GUARDAR / CANCELAR -->
          @if (editing) {
            <button
              pButton
              [id]="'btnGrd00108' + rowData.idRegistro"
              pSaveEditableRow
              icon="pi pi-check"
              text
              rounded
              severity="success"
              class="mr-1"
              (click)="guardarRegistro(rowData)">
            </button>
            <button
              pButton
              [id]="'btnGrd00109' + rowData.idRegistro"
              pCancelEditableRow
              icon="pi pi-times"
              text
              rounded
              severity="danger">
            </button>
          }
        </td>
      </tr>
    </ng-template>
  </p-table>
</div>
```
### Typescript para Grids

```ts
import { Component, computed, inject, Input, OnInit, signal } from '@angular/core';
import { ConfirmationService } from 'primeng/api';

import { PRIMENG_MODULES } from '../../../../shared/primeng/primeng.imports';
import { FuntionsService } from '../../../../services/functions.service';
import { MessageService } from '../../../../services/message.service';
import { ToastService } from '../../../../services/toast.service';
import { StatusMessage } from '../../../../interfaces/general.interface';

// ========================================================================================
// INTERFACES DEL GRID
// Reemplazar por la interfaz correspondiente al proceso.
// ========================================================================================
interface Registro {
  idRegistro: number;
  idPadre: number;
  campo1: string;
  campo2: string;
  campo3: Date | null;
  estado: boolean;
}

// ========================================================================================
// SERVICIO DEL PROCESO
// Reemplazar por el servicio correspondiente.
// ========================================================================================
// import { RegistroService } from '../../../../services/registro.service';

@Component({
  selector: 'app-grd-0000',
  imports: [...PRIMENG_MODULES],
  templateUrl: './grd-0000.html',
  styleUrl: './grd-0000.css',
})
export class Grd0000 implements OnInit {
  /*****************************************************************************************
  * TOMA DE PARÁMETROS ENVIADOS EN LA LLAMADA DEL SELECTOR
  *****************************************************************************************/
  @Input()
  idPadre!: number;
  /*****************************************************************************************
  * IDENTIFICADORES PRINCIPALES
  *****************************************************************************************/
  idContenedor = signal<string>('Win0000');
  idObjeto = signal<string>('Grd0000');
  idTabla = signal<string>('000');
  permiso = signal<string>('w');
  /*****************************************************************************************
  * INYECCIONES
  *****************************************************************************************/
  // SERVICIOS PÚBLICOS
  funciones = inject(FuntionsService);
  messageService = inject(MessageService);
  // SERVICIOS PRIVADOS
  private confirmationService = inject(ConfirmationService);
  // private registroService = inject(RegistroService);
  private toastService = inject(ToastService);
  /*****************************************************************************************
  * MANEJO DE MENSAJES
  *****************************************************************************************/
  statusMessages = signal<Record<string, StatusMessage>>({});
  gridMessage = computed(() =>
    this.messageService.obtener(
      this.statusMessages,
      'msgGrd0000'
    )
  );
  /*****************************************************************************************
  * VARIABLES DEL GRID
  *****************************************************************************************/
  registros = signal<Registro[]>([]);
  selectedRows: Registro[] = [];
  metaKey: boolean = true;
  /*****************************************************************************************
  * INICIALIZACIÓN
  *****************************************************************************************/

  ngOnInit(): void {
    // CARGA LOS DATOS DEL GRID
    this.cargarRegistros();
  }

  /*****************************************************************************************
  * MÉTODOS QUE EJECUTAN LOS PROCESOS
  *****************************************************************************************/
  // ========================================================================================
  // INSERTAR UNA FILA
  // ========================================================================================
  insertarRegistro(): void {
    const nuevoRegistro: Registro = {
      // ID TEMPORAL PARA NUEVOS REGISTROS
      idRegistro: 0,
      // ID DEL REGISTRO PADRE
      idPadre: this.idPadre,
      // CAMPOS DEL REGISTRO
      campo1: '',
      campo2: '',
      campo3: null,
      estado: false
    };
    const mensaje = this.funciones.insertRow(
      this.registros,
      nuevoRegistro,
      'idRegistro',
      this.idPadre !== 0,
      'btnGrd000010'
    );
    if (mensaje !== '') {
      this.toastService.showMessage(
        'error',
        'Error',
        mensaje
      );
    }
  }
  // ========================================================================================
  // GUARDAR UNA FILA
  // ========================================================================================
  guardarRegistro(registro: Registro): void {
    // ======================================================
    // VALIDACIONES ESPECÍFICAS DEL PROCESO
    // ======================================================
    /*
    Ejemplo:
    if (registro.campo1 === '') {
      this.toastService.showMessage(
        'error',
        'Error',
        'El campo 1 es obligatorio.'
      );
      return;
    }
    */
    // ======================================================
    // GRABACIÓN
    // ======================================================
    /*
    this.registroService.guardar(registro).subscribe({
      next: (resp) => {
        registro.idRegistro = resp.idSecuencial;
        this.messageService.mostrar(
          this.statusMessages,
          'msgGrd0000',
          'success',
          'Registro grabado correctamente.'
        );
      },
      error: (err) => {
        this.toastService.showMessage(
          'error',
          'Error',
          'Ha ocurrido un error: ' + err.error.message,
          err.error.status
        );
      }
    });
    */
  }
  // =====================================================================
  // CARGAR LOS REGISTROS
  // =====================================================================
  cargarRegistros(): void {
    // LIMPIA EL GRID ANTES DE CARGAR LA INFORMACIÓN
    this.registros.set([]);
    /*
    this.registroService.listar(this.idPadre).subscribe({
      next: (resp) => {
        this.registros.set(resp.data);
        this.messageService.mostrar(
          this.statusMessages,
          'msgGrd0000',
          'success',
          'Registros cargados correctamente.'
        );
      },

      error: (err) => {

        this.toastService.showMessage(
          'error',
          'Error',
          'Ha ocurrido un error al cargar los registros: '
          + err.error.message,
          err.error.status
        );

        this.messageService.mostrar(
          this.statusMessages,
          'msgGrd0000',
          'error',
          'Hubo un error al cargar los registros.'
        );

      }

    });
    */
  }
  // ========================================================================================
  // ELIMINAR UNA FILA
  // ========================================================================================
  eliminarRegistro(rowData: Registro): void {
    // ======================================================
    // EL REGISTRO TODAVÍA NO EXISTE EN BASE DE DATOS
    // ======================================================
    if (rowData.idRegistro === 0) {

      this.registros.set(
        this.registros().filter(
          item => item.idRegistro !== rowData.idRegistro
        )
      );
      return;
    }
    // ======================================================
    // CONFIRMACIÓN DE ELIMINACIÓN
    // ======================================================
    this.confirmationService.confirm({
      message: '¿Desea eliminar el registro?',
      header: 'Eliminar',
      acceptLabel: 'Aceptar',
      rejectLabel: 'Cancelar',
      accept: () => {
        /*
        this.registroService.eliminar(rowData.idRegistro).subscribe({
          next: (resp) => {

            this.registros.set(
              this.registros().filter(
                item => item.idRegistro !== resp.idSecuencial
              )
            );
            this.messageService.mostrar(
              this.statusMessages,
              'msgGrd0000',
              'success',
              'Registro eliminado correctamente.'
            );
          },
          error: (err) => {
            this.toastService.showMessage(
              'error',
              'Error',
              'Ha ocurrido un error: ' + err.error.message,
              err.error.status
            );
            this.messageService.mostrar(
              this.statusMessages,
              'msgGrd0000',
              'error',
              'Hubo un error al eliminar el registro.'
            );
          }
        });
        */
      }
    });
  }
  // ========================================================================================
  // ELIMINAR VARIAS FILAS
  // ========================================================================================
  eliminarVarios(): void {
    const selected = this.selectedRows;
    // VALIDACIÓN DE SELECCIÓN
    if (selected.length === 0) {
      this.toastService.showMessage(
        'error',
        'Error',
        'Seleccione varias filas'
      );
      return;
    }

    // CONFIRMACIÓN
    this.confirmationService.confirm({
      message: '¿Desea eliminar todos los registros seleccionados?',
      header: 'Eliminar',
      acceptLabel: 'Aceptar',
      rejectLabel: 'Cancelar',
      accept: () => {
        for (const row of selected) {
          /*
          this.registroService.eliminar(row.idRegistro).subscribe({

            next: (resp) => {

              this.registros.set(
                this.registros().filter(
                  item => item.idRegistro !== resp.idSecuencial
                )
              );

            },

            error: (err) => {

              this.toastService.showMessage(
                'error',
                'Error',
                'Ha ocurrido un error: '
                + err.error.message,
                err.error.status
              );
            }
          });
          */
        }
        // MENSAJE DE ÉXITO
        this.messageService.mostrar(
          this.statusMessages,
          'msgGrd0000',
          'success',
          'Registros eliminados correctamente.'
        );
      }
    });
  }
  // ========================================================================================
  // MOSTRAR AUDITORÍA
  // ========================================================================================
  mostrarAuditoria(): void {
    const selected = this.selectedRows || [];
    // DEBE EXISTIR EXACTAMENTE UN REGISTRO SELECCIONADO
    if (selected.length === 1) {
      this.funciones.muestraAuditoria(
        selected[0].idRegistro,
        this.idTabla(),
        selected[0]
      );
    } else {
      this.toastService.showMessage(
        'error',
        'Error',
        'Seleccione un registro para ver la auditoría'
      );
    }
  }
  // ========================================================================================
  // MOSTRAR INFORMACIÓN DEL OBJETO
  // ========================================================================================
  mostrarInformacion(): void {
    this.funciones.muestraInfoObjeto(
      this.idContenedor(),
      this.idObjeto(),
      this.idTabla(),
      this.permiso()
    );
  }
}
```
