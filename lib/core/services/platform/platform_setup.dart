export 'platform_setup_stub.dart'
    if (dart.library.html) 'platform_setup_web.dart'
    if (dart.library.io) 'platform_setup_desktop.dart';
