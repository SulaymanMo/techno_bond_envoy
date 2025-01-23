import '../../data/model/login_model.dart';
import '../../data/model/request_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/auth_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthImpl _repo;

  AuthCubit() : super(AuthInitial()) {
    _repo = AuthImpl.instance;
  }

  Future<void> login(RequestLogin requestLogin) async {
    if (state is AuthLoading) return;
    emit(AuthLoading());
    final result = await _repo.login(requestLogin);
    result.fold(
      (failure) {
        emit(AuthFailure(failure.ex));
      },
      (success) {
        emit(AuthSuccess(success));
      },
    );
  }
}
