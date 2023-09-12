import 'package:equatable/equatable.dart';

sealed class BaseState {
  const BaseState();
}

class IdleState extends BaseState {
  const IdleState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class SuccessState extends BaseState {
  final String? message;

  const SuccessState({this.message});
}

class FailureState extends BaseState with EquatableMixin {
  final String message;

  const FailureState(this.message);

  @override
  List<Object?> get props => [message];
}
