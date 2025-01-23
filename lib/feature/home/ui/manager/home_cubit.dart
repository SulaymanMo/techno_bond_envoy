import '../../../../core/service/local_service.dart';
import '../../data/repo/home_repo.dart';
import '../../data/model/order_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/const_string.dart';
import '../../../auth/data/model/login_data_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int ordersLength = 0;
  bool isCurrent = false;
  final HomeRepo _repo = HomeImpl.instance;
  HomeCubit() : super(HomeInitial());

  Future<void> getOrders(int? status) async {
    if (state is HomeLoading) return;
    emit(HomeLoading());
    final result = await _repo.fetchOrders(status);
    result.fold(
      (failure) {
        emit(HomeFailure(failure.ex));
      },
      (orderData) {
        // isCurrent = orderData.currentOrder != null;
        // ordersLength = orderData.orders!.length;
        emit(HomeSuccess(orderData));
      },
    );
  }

  LoginDataModel? getUser() {
    return LocalService.instance.get(ConstHive.userKey);
  }
}
