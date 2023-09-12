import 'package:equatable/equatable.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';

class DailyState extends Equatable {
  final BaseState state;

  final List<IdeasEntity> ideas;

  const DailyState({
    this.state = const IdleState(),
    this.ideas = const [],
  });

  DailyState copyWith({
    BaseState? state,
    List<IdeasEntity>? ideas,
  }) {
    return DailyState(
      state: state ?? this.state,
      ideas: ideas ?? this.ideas,
    );
  }

  @override
  List<Object?> get props => [state, ideas];
}
