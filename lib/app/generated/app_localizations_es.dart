// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get connectionStatus => 'Estado de conexión';

  @override
  String get theme => 'Tema';

  @override
  String get toggleTheme => 'Cambiar tema';

  @override
  String themeSwitched(Object theme) {
    return 'Tema cambiado a $theme';
  }

  @override
  String get language => 'Idioma';

  @override
  String languageSwitched(Object lang) {
    return 'Idioma cambiado a $lang';
  }

  @override
  String current(Object value) {
    return 'Actual: $value';
  }

  @override
  String get networking => 'Red';

  @override
  String get callNetwork => 'Llamar a la red';

  @override
  String get storage => 'Almacenamiento';

  @override
  String get saveValue => 'Guardar valor';

  @override
  String get readValue => 'Leer valor';

  @override
  String stored(Object value) {
    return 'Guardado: $value';
  }

  @override
  String get snackbarUtils => 'Snackbar y Utilidades';

  @override
  String get showSnackbar => 'Mostrar Snackbar';

  @override
  String get snackbarMessage => '¡Este es un snackbar de Showcase!';

  @override
  String get loading => 'Cargando...';

  @override
  String error(Object message) {
    return 'Error: $message';
  }

  @override
  String get noValueFound => 'No se encontró valor';

  @override
  String get savedToStorage => '¡Guardado en almacenamiento!';

  @override
  String get driftDatabase => 'Base de datos Drift';

  @override
  String get addItem => 'Agregar elemento';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get noItemsInDatabase => 'No hay elementos en la base de datos.';

  @override
  String itemInfo(Object id, Object name, Object value) {
    return 'ID: $id, Nombre: $name, Valor: $value';
  }
}
