part of 'receive_order_cubit.dart';

sealed class ReceiveOrderState {}

final class ReceiveOrderInitial extends ReceiveOrderState {}

final class ReceiveOrderLoading extends ReceiveOrderState {}

final class ReceiveOrderSuccess extends ReceiveOrderState {
  final String success;
  ReceiveOrderSuccess(this.success);
}

final class ReceiveOrderFailure extends ReceiveOrderState {
  final String error;
  ReceiveOrderFailure(this.error);
}
