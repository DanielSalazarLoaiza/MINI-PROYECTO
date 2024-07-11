import 'dart:io';
import 'dart:math';



class TemaExposicion {
  String nombre;
  int cantidadEstudiantes;
  List<String> estudiantesAsignados = [];

  TemaExposicion(this.nombre, this.cantidadEstudiantes) {
    estudiantesAsignados = [];
  }
}

class Estudiante {
  String nombreCompleto;

  Estudiante(this.nombreCompleto);
}



void crearTemaExposicion(List<TemaExposicion> temasExposicion) {
  print('Ingrese el nombre del tema de exposición:');
  var nombre = stdin.readLineSync()!;
  print('Ingrese la cantidad de estudiantes para este tema:');
  var cantidadEstudiantes = int.parse(stdin.readLineSync()!);

  var tema = TemaExposicion(nombre, cantidadEstudiantes);
  temasExposicion.add(tema);

  print('Tema de exposición creado exitosamente.');
}

void mostrarTemasExposicion(List<TemaExposicion> temasExposicion) {
  if (temasExposicion.isEmpty) {
    print('No hay temas de exposición creados.');
  } else {
    print('Temas de exposición:');
    temasExposicion.forEach((tema) {
      print('Nombre: ${tema.nombre}, Cantidad de Estudiantes: ${tema.cantidadEstudiantes}');
    });
  }
}

void eliminarTemaExposicion(List<TemaExposicion> temasExposicion) {
  if (temasExposicion.isEmpty) {
    print('No hay temas de exposición para eliminar.');
  } else {
    print('Ingrese el nombre del tema de exposición a eliminar:');
    var nombreEliminar = stdin.readLineSync()!;
    var temaEncontrado = temasExposicion.firstWhere((tema) => tema.nombre == nombreEliminar, orElse: () => TemaExposicion('', 0));

    if (temaEncontrado.nombre.isNotEmpty) {
      temasExposicion.remove(temaEncontrado);
      print('Tema de exposición eliminado correctamente.');
    } else {
      print('No se encontró el tema de exposición.');
    }
  }
}


void ingresarEstudiante(List<Estudiante> estudiantes) {
  print('Ingrese el nombre completo del estudiante:');
  var nombreCompleto = stdin.readLineSync()!;
  
  var estudiante = Estudiante(nombreCompleto);
  estudiantes.add(estudiante);
  
  print('Estudiante ingresado correctamente.');
}

void mostrarEstudiantes(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes ingresados.');
  } else {
    print('Estudiantes ingresados:');
    estudiantes.forEach((estudiante) {
      print('Nombre Completo: ${estudiante.nombreCompleto}');
    });
  }
}



void asignarEstudiantesAleatoriamente(List<TemaExposicion> temasExposicion, List<Estudiante> estudiantes, Random random) {
  if (temasExposicion.isEmpty || estudiantes.isEmpty) {
    print('No se pueden asignar estudiantes porque no hay temas o estudiantes ingresados.');
  } else {
    
    temasExposicion.forEach((tema) {
      tema.estudiantesAsignados.clear();
    });

 
    estudiantes.shuffle(random);
    var indexEstudiante = 0;

    temasExposicion.forEach((tema) {
      var estudiantesPorAsignar = tema.cantidadEstudiantes;
      while (estudiantesPorAsignar > 0 && indexEstudiante < estudiantes.length) {
        tema.estudiantesAsignados.add(estudiantes[indexEstudiante].nombreCompleto);
        estudiantesPorAsignar--;
        indexEstudiante++;
      }
    });

    print('Asignación aleatoria de estudiantes completada.');
  }
}

void mostrarAsignacionesActuales(List<TemaExposicion> temasExposicion) {
  if (temasExposicion.isEmpty) {
    print('No hay temas de exposición con asignaciones.');
  } else {
    print('Asignaciones actuales:');
    temasExposicion.forEach((tema) {
      print('Tema: ${tema.nombre}');
      print('Estudiantes asignados: ${tema.estudiantesAsignados}');
    });
  }
}



void cargarDatosDePrueba(List<TemaExposicion> temasExposicion, List<Estudiante> estudiantes) {
 
  var tema1 = TemaExposicion('Tema1', 3);
  var tema2 = TemaExposicion('Tema 2', 2);
  var tema3 = TemaExposicion('Tema 3', 4);

  temasExposicion.add(tema1);
  temasExposicion.add(tema2);
  temasExposicion.add(tema3);

  var estudiante1 = Estudiante('Juan Pérez');
  var estudiante2 = Estudiante('María Gómez');
  var estudiante3 = Estudiante('Pedro Rodríguez');
  var estudiante4 = Estudiante('Ana López');
  var estudiante5 = Estudiante('Carlos Sánchez');

  estudiantes.add(estudiante1);
  estudiantes.add(estudiante2);
  estudiantes.add(estudiante3);
  estudiantes.add(estudiante4);
  estudiantes.add(estudiante5);
}

void main() {
  var temasExposicion = <TemaExposicion>[];
  var estudiantes = <Estudiante>[];
  var random = Random();

  while (true) {
    print('Menú:');
    print('1. Crear tema de exposición');
    print('2. Mostrar temas de exposición');
    print('3. Eliminar tema de exposición');
    print('4. Ingresar estudiante');
    print('5. Mostrar estudiantes');
    print('6. Asignar estudiantes aleatoriamente');
    print('7. Mostrar asignaciones actuales');
    print('8. Cargar datos de prueba');
    print('9. Salir');

    var opcion = stdin.readLineSync()!;
    switch (opcion) {
      case '1':
        crearTemaExposicion(temasExposicion);
        break;
      case '2':
        mostrarTemasExposicion(temasExposicion);
        break;
      case '3':
        eliminarTemaExposicion(temasExposicion);
        break;
      case '4':
        ingresarEstudiante(estudiantes);
        break;
      case '5':
        mostrarEstudiantes(estudiantes);
        break;
      case '6':
        asignarEstudiantesAleatoriamente(temasExposicion, estudiantes, random);
        break;
      case '7':
        mostrarAsignacionesActuales(temasExposicion);
        break;
      case '8':
        cargarDatosDePrueba(temasExposicion, estudiantes);
        break;
      case '9':
        print('Saliendo...');
        return;
      default:
        print('Opción inválida. Intente nuevamente.');
    }
  }
}