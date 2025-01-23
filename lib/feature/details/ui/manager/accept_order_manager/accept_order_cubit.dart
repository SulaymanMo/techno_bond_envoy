import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/details_repo.dart';
import '../../../data/repo_impl/details_impl.dart';

part 'accept_order_state.dart';

class AcceptOrderCubit extends Cubit<AcceptOrderState> {
  final DetailsRepo _repo = DetailsImpl.instance;
  AcceptOrderCubit() : super(AcceptOrderInitial());

  Future<void> acceptOrder(int orderId) async {
    emit(AcceptOrderLoading());
    final result = await _repo.acceptOrder(orderId);
    result.fold(
      (failure) {
        emit(AcceptOrderFailure(failure.ex));
        // print(failure.ex);
      },
      (success) {
        emit(AcceptOrderSuccess());
      },
    );
  }
}
