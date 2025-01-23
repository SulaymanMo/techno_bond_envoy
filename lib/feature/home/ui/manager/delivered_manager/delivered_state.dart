part of 'delivered_cubit.dart';

sealed class DeliveredState {}

final class DeliveredInitial extends DeliveredState {}

final class DeliveredLoading extends DeliveredState {}

final class DeliveredFailure extends DeliveredState {
  final String error;
  DeliveredFailure(this.error);
}

final class DeliveredSuccess extends DeliveredState {
  final List<OrderModel> orders;
  DeliveredSuccess(this.orders);
}
