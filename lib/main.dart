import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';
import 'core/helper/observer.dart';
import 'core/theme/app_theme.dart';
import 'feature/auth/data/model/login_data_model.dart';
import 'lang/codegen_loader.g.dart';
import 'core/helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'core/service/local_service.dart';
import 'core/constant/const_string.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  Bloc.observer = Observer();
  await EasyLocalization.ensureInitialized();
  await LocalService.instance.init();
  // ! _____ Prevent Device Orientation _____ ! //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ! _____ //
  LoginDataModel? data = LocalService.instance.get(ConstHive.userKey);
  debugPrint("${data?.id}");
  debugPrint(data?.token);
  runApp(
    EasyLocalization(
      path: ConstLang.langPath,
      startLocale: ConstLang.ar,
      fallbackLocale: ConstLang.ar,
      assetLoader: const CodegenLoader(),
      supportedLocales: const [ConstLang.ar, ConstLang.en],
      child: MyApp(isLogin: data == null),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Envoy TechnoBond',
          theme: appTheme(),
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          initialRoute: isLogin ? RoutePath.login : RoutePath.home,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
