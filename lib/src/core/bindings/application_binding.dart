import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sos_projeto/src/core/bindings/interceptor/b4a_intercept.dart';
import 'package:sos_projeto/src/repositories/user/user_repository.dart';
import 'package:sos_projeto/src/repositories/user/user_repository_impl.dart';
import 'package:sos_projeto/src/services/auth/auth_service.dart';
import 'package:sos_projeto/src/services/locator/locator_serivce.dart';

class ApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<Dio>((i) => Dio()..interceptors.add(B4aIntercept())),
        Bind.lazySingleton<AudioPlayer>((i) => AudioPlayer()
          ..setReleaseMode(ReleaseMode.loop)
          ..setSource(AssetSource('audios/siren.wav'))),
        Bind.lazySingleton<FlutterSecureStorage>(
            (i) => const FlutterSecureStorage()),
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.singleton<LocatorSerivce>((i) => LocatorSerivce()..init()),
        Bind.lazySingleton<AuthService>(
          (i) => AuthService(
            storage: i(),
            repository: i(),
          ),
        ),
      ];
}
