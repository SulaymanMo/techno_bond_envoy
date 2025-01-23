part of 'accept_order_cubit.dart';

sealed class AcceptOrderState {}

final class AcceptOrderInitial extends AcceptOrderState {}

final class AcceptOrderLoading extends AcceptOrderState {}

final class AcceptOrderSuccess extends AcceptOrderState {}

final class AcceptOrderFailure extends AcceptOrderState {
  final String error;
  AcceptOrderFailure(this.error);
}
