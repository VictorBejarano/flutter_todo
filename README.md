# Flutter ToDo

<p align="center">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/images/logo.png?raw=true" width="200px" height="200px" alt="NxDevTools logo">
</p>

### Temas

- [Descripción de la aplicación](#descripción-de-la-aplicación)
- [Herramientas utilizadas](#herramientas-utilizadas)
- [Herramientas utilizadas](#herramientas-utilizadas)

## Descripción de la aplicación

Esta aplicación está diseñada para la gestión de tareas que los empleados deben realizar. Compatible con Android, la aplicación ofrece una experiencia intuitiva y fácil de usar. Simplemente inicia sesión y podrás ver, crear, modificar o eliminar tareas según tus necesidades. Con esta herramienta, la organización y el seguimiento de las responsabilidades laborales se vuelven más eficientes y convenientes para todos los usuarios.

## Herramientas utilizadas

<a href="https://flutter.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/logo_flutter.png?raw=true" height="80px">
</a>
<a href="https://dart.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/logo_dart.png?raw=true" height="80px">
</a>
<a href="https://bloclibrary.dev/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/logo_bloc.png?raw=true" height="80px">
</a>
<a href="https://www.android.com/" target="_blank">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/logo_android.png?raw=true" height="80px">
</a>

## Ejecutar el proyecto

Para ejecutar el proyecto, asegúrate de tener un equipo con Windows, Linux o Mac y sigue los siguientes pasos:

1. Descarga el repositorio de [Flutter ToDo](https://github.com/VictorBejarano/flutter_todo).

2. Instala el SDK de Flutter a la versión 3.19.0 siguiendo las [instrucciones](https://docs.flutter.dev/get-started/install/windows/mobile?tab=virtual).

3. En la terminal, en la carpeta raíz del proyecto, ejecuta el siguiente comando para instalar las dependencias del proyecto:
   ```
   flutter pub get
   ```
4. Una vez que todas las dependencias se hayan instalado correctamente, puedes ejecutar el proyecto Flutter con el siguiente comando:
   ```
   flutter run
   ```
   Este comando iniciará el proceso de compilación y ejecutará la aplicación en un emulador de Android o en un dispositivo conectado, dependiendo de la configuración [Ver ejemplo](https://docs.flutter.dev/get-started/test-drive).

## Instalación del APK

Para instalar la aplicación en tu dispositivo Android, sigue estos pasos:

1. **Descarga del Archivo APK:** Descarga el archivo APK desde la sección de [releases](https://github.com/VictorBejarano/flutter_todo/releases) del repositorio.

2. **Transferencia del Archivo:** Se recomienda transferir el archivo directamente desde un dispositivo Android o mediante un cable USB conectado a una PC.

3. **Explorador de Archivos:** Utiliza el explorador de archivos de Android o descarga aplicaciones similares desde Google Play Store para buscar y ejecutar el archivo APK.

4. **Instalación y Permisos:** Al ejecutar el archivo APK, sigue las instrucciones en pantalla para completar la instalación. Es posible que se te solicite aceptar los permisos necesarios durante el proceso.

## Instrucciones de uso.

- Abrir la aplicacion Flutter ToDo.
- En la ventana de login ingrese el usuario y contraseña, para fin de las pruebas existen dos usuarios: usuario.prueba01@gmail.com y contraseña 123456As.01 el cual se encuetra activo y usuario.prueba02@gmail.com y contraseña 123456As.02 el cual esta inactivo.
  Cuando se gena un error se muestra el siguiente mensaje:
  Cuando le da ingresar saldra una ventana de carga:
  Para ver los datos de los usuarios dar click aca
- Al ingresar saldra la siguiente ventana donde se observa el listado por defecto que tambien se puede ver en archivo json dando clic aca.
- Cuando se da clic en el boton de crear como se ve en la siguiente imagen:
  Saldra un formulario en el cual se deben ingresar los datos solicitados, todos son requeridos.
  Al finalizar se debe dar clic en el boton crear y la nueva tarea saldra en el listado
- Al dar tap sobre una de las tarjetas como en de la siguiente imagen:
  Saldra el formulario donde solo se puede ver los datos de la tarea donde se puede dar tap en el boton editar o el boton eliminar
- Para editar la tarea se da tap en el boton editar y se puede modificar la tarea incluyendo el estado:
  posteriormente se da en el boton editar y se vera el cambio reflejado en la lista de tareas
- Para eliminar la tarea se debe dar tap en la tarea y solo basta con dar en el boton eliminar, en la siguiente imagen ya la tarea no existe
- Para refrescar los datos solo basta con deslizar el listado hasta abajo y el listado vuelve a estar por defecto
- Tambien cuando se eliminan todas las tareas solo es dar tap sobre el boton actualizar de la siguiente imagen.

## Instrucciones de Uso

1. **Iniciar la Aplicación Flutter ToDo:** Abre la aplicación Flutter ToDo en tu dispositivo.

<p align="center">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image01.png?raw=true" width="200px">
</p>

2. **Inicio de Sesión:** En la ventana de inicio de sesión, introduce el nombre de usuario y la contraseña. Para propósitos de prueba, existen dos usuarios disponibles:

   - **Usuario:** usuario.prueba01@gmail.com, **Contraseña:** 123456As.01 (activo)
   - **Usuario:** usuario.prueba02@gmail.com, **Contraseña:** 123456As.02 (inactivo)

<p align="center">
  <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image02.png?raw=true" width="200px">
</p>

3. **Manejo de Errores:** Si ocurre un error durante el inicio de sesión, se mostrará un mensaje indicándolo.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image03.png?raw=true" width="200px">
  </p>

  Para ver los datos de los usuarios, haz clic en el [enlace](https://github.com/VictorBejarano/flutter_todo/blob/main/assets/json/auth.json) proporcionado.

4. **Ventana de Carga:** Después de hacer clic en "Ingresar", aparecerá una ventana de carga.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image04.png?raw=true" width="200px">
  </p>

5. **Listado de Tareas:** Después de iniciar sesión, se mostrará un listado predeterminado de tareas. También puedes ver este listado en un archivo [JSON](https://github.com/VictorBejarano/flutter_todo/blob/main/assets/json/task.json).

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image05.png?raw=true" width="200px">
  </p>

6. **Crear Nueva Tarea:** Para crear una nueva tarea, haz clic en el botón "Crear" y completa el formulario con los datos requeridos.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image06.png?raw=true" width="200px">
  </p>

7. **Editar Tarea:** Si deseas editar una tarea existente, toca la tarjeta correspondiente y selecciona "Editar". Modifica los detalles según sea necesario y guarda los cambios.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image07.png?raw=true" width="200px">
  </p>
  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image08.png?raw=true" width="200px">
  </p>

8. **Eliminar Tarea:** Para eliminar una tarea, selecciona la tarjeta de la tarea deseada y pulsa el botón "Eliminar".
9. **Refrescar Listado:** Para actualizar la lista de tareas y volver al estado predeterminado, desliza hacia abajo el listado.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image09.png?raw=true" width="200px">
  </p>

10. **Actualizar Datos Vacíos:** Si no hay tareas en la lista, simplemente toca el botón "Actualizar" para cargar de nuevo los datos.

  <p align="center">
    <img src="https://github.com/VictorBejarano/flutter_todo/blob/main/assets/doc/image10.png?raw=true" width="200px">
  </p>
