import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/ui/manager/auth_cubit.dart';
import '../constant/const_string.dart';
import 'package:flutter/material.dart';
import '../../feature/home/ui/view/nav_view.dart';
import '../../feature/auth/ui/view/login_view.dart';

// ! _____ App Routes Here (OnGenerate Approach for Example) _____ ! //
class AppRoutes {
  static Route<MaterialPageRoute>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => const NavView());
      default:
        return null;
    }
  }
}
