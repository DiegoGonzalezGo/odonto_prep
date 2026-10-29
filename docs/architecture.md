# Arquitectura inicial de OdontoPrep UJAT

## Propósito

Esta aplicación es una herramienta educativa personal para estudiar un temario propuesto de preparación para Odontología. No representa una guía oficial de la Universidad Juárez Autónoma de Tabasco (UJAT).

El proyecto sigue una arquitectura organizada por funcionalidades y mantiene una separación sencilla entre presentación y datos:

- `lib/app/`: composición de la aplicación, navegación y tema visual.
- `lib/core/`: recursos compartidos y futuros widgets comunes.
- `lib/features/study/`: catálogo de módulos y temas cargado desde JSON local.
- `lib/features/quizzes/`: futura implementación de cuestionarios y sus fuentes.
- `lib/features/progress/`: futuro progreso de estudio y intentos guardados localmente.
- `lib/features/favorites/`: futura gestión de temas o lecciones favoritas.
- `lib/features/settings/`: futura pantalla de preferencias.
- `assets/data/`: contenido público disponible sin conexión.
- `assets/images/`: recursos visuales futuros, separados por anatomía e ilustraciones.
- `docs/`: documentación técnica del proyecto.

Los módulos se mantienen como datos, no como copias de pantallas o paquetes por módulo. Las mismas componentes podrán mostrar los módulos y temas almacenados en JSON.

## Flujo de datos

La ruta del catálogo implementado es:

`Pantalla -> StudyController -> StudyRepository -> LocalStudySource -> assets/data/*.json`

La pantalla observa al controlador mediante Provider. El controlador contiene el estado de presentación y llama al repositorio. El repositorio decide cómo obtiene los datos; actualmente usa la fuente local basada en `rootBundle`. Las pantallas no acceden directamente a archivos ni servicios externos.

## Cómo agregar contenido

### Agregar un tema

1. Añadir una entrada en `assets/data/topics.json` con un `id` estable, único y en formato de cadena.
2. Asignar `moduleId` con el identificador exacto del módulo padre.
3. Definir `order` para determinar la posición dentro del módulo.
4. Ejecutar la aplicación; `StudyRepository` cargará el tema sin cambios adicionales.

### Agregar una futura lección

1. Crear el JSON correspondiente dentro de `assets/data/lessons/`.
2. Relacionarlo con su tema mediante el identificador estable del tema.
3. Añadir su ruta de asset en `pubspec.yaml` si no queda cubierta por el directorio declarado.
4. Incorporar el modelo y la lectura de la fuente a la funcionalidad `study` o a la funcionalidad correspondiente.
5. Conservar la separación pantalla -> controlador -> repositorio -> fuente.

La primera lección interactiva prevista es `Anatomía dental`. Su contenido académico aún no ha sido incluido.

## Persistencia futura

- **SQLite (`sqflite`)**: progreso, favoritos persistentes, intentos de cuestionarios y otros datos de usuario. La implementación y el repositorio correspondiente deben añadirse cuando se desarrollen esas funciones.
- **SharedPreferences**: únicamente preferencias pequeñas, por ejemplo tema o ajustes de interfaz.
- Las pantallas no deben acceder directamente a SQLite ni SharedPreferences.

Firestore se incorporará posteriormente como fuente remota opcional para actualizar contenido público. La selección local/remota y el manejo de caché quedarán en los repositorios de datos. Las pantallas y controladores dependerán de interfaces o repositorios, nunca de Firebase SDK ni HTTP directamente.

## Navegación

La base usa `Navigator` con rutas centralizadas en `AppRouter`. `go_router` puede evaluarse después si aparecen rutas múltiples, enlaces profundos o navegación que requiera estado complejo. No se ha agregado porque no aporta una necesidad actual.

## Estado actual

Implementado:

- Proyecto Flutter Android existente preservado.
- Provider y un controlador mínimo de estudio mediante `ChangeNotifier`.
- Tres módulos y doce temas cargados desde JSON local sin conexión.
- Pantalla inicial que presenta módulos y temas.
- Tema y navegación básicos centralizados.
- Estructura por funcionalidades preparada para cuestionarios, progreso, favoritos y ajustes.

Pendiente:

- Lecciones interactivas y contenido de Anatomía dental.
- Modelos específicos de lecciones y cuestionarios.
- sqflite, SharedPreferences y sus repositorios.
- Firestore y actualización remota de contenido.
- APIs externas, autenticación y servicios facturados.
