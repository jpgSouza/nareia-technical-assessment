import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';
import 'daily_state.dart';

class DailyCubit extends Cubit<DailyState> {
  final GetDailyIdeasUseCase _getDailyIdeasUseCase;

  DailyCubit(this._getDailyIdeasUseCase) : super(const DailyState());

  Future<void> getDailyIdeas() async {
    emit(state.copyWith(state: const LoadingState()));

    final ideas = await _getDailyIdeasUseCase();

    emit(
      state.copyWith(
        state: const SuccessState(),
        ideas: ideas,
      ),
    );
  }
}
