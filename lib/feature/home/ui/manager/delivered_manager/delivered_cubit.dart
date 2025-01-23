import '../../../data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/delivered_order_repo.dart';
import '../../../data/repo_impl/delivered_order_impl.dart';

part 'delivered_state.dart';

class DeliveredCubit extends Cubit<DeliveredState> {
  int ordersLength = 0;
  DeliveredCubit() : super(DeliveredInitial());
  final DeliveredOrderRepo _repo = DeliveredOrderImpl.instance;

  Future<void> getDeliveredOrders() async {
    emit(DeliveredLoading());
    final result = await _repo.getDeliveredOrders();
    result.fold(
      (failure) {
        emit(DeliveredFailure(failure.ex));
      },
      (orders) {
        ordersLength = orders.length;
        emit(DeliveredSuccess(orders));
      },
    );
  }
}
