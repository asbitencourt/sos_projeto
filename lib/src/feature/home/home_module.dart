import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_projeto/src/feature/home/home_page.dart';
import 'package:sos_projeto/src/feature/home/widgets/cubit/sos_cubit.dart';
import 'package:sos_projeto/src/repositories/location/location_repository.dart';
import 'package:sos_projeto/src/repositories/location/location_repository_impl.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LocationRepository>(
            (i) => LocationRepositoryImpl(dio: i())),
        Bind.lazySingleton(
          (i) => SosCubit(
            repository: i(),
            authService: i(),
            locatorSerivce: i(),
          ),
        ),
      ];

  @override
  String get moduleRouteName => '/home';

  @override
  // TODO: implement pages
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => HomePage(
              controller: Injector.get(),
            )
      };
}
