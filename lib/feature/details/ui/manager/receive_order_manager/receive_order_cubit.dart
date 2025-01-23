import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/details_repo.dart';
import '../../../data/repo_impl/details_impl.dart';

part 'receive_order_state.dart';

class ReceiveOrderCubit extends Cubit<ReceiveOrderState> {
  ReceiveOrderCubit() : super(ReceiveOrderInitial());
  final DetailsRepo _repo = DetailsImpl.instance;

  Future<void> receiveOrder({
    required int orderId,
    required String otpCode,
  }) async {
    if (state is ReceiveOrderSuccess || state is ReceiveOrderLoading) return;
    emit(ReceiveOrderLoading());
    final result = await _repo.receiveOrder(orderId, otpCode);

    result.fold(
      (failure) {
        emit(ReceiveOrderFailure(failure.ex));
      },
      (success) {
        emit(ReceiveOrderSuccess(success));
      },
    );
  }
}
