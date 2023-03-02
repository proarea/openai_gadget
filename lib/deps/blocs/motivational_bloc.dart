// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/open_ai_model.dart';
import '../services/open_ai_service.dart';

class MotivationalBloc extends Cubit<MotivationalBlocState> {
  final OpenAiService openAiService;

  MotivationalBloc({
    required this.openAiService,
  }) : super(const MotivationalBlocState.initial());

  void generate(OpenAiModel openAiModel, String languageName) async {
    emit(state.copyWithGenerating());
    try {
      final response = await openAiService.askForCompletion(
        openAiModel,
        "Generate motivational affirmation for the day (respond using language: $languageName)",
      );

      if (isClosed) return;
      emit(state.copyWithResult(response));
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWithError());
    }
  }
}

class MotivationalBlocState {
  final String result;
  final bool generating;
  final bool errorOccured;

  const MotivationalBlocState({
    required this.result,
    required this.generating,
    required this.errorOccured,
  });

  const MotivationalBlocState.initial()
      : result = "",
        generating = false,
        errorOccured = false;

  MotivationalBlocState copyWithResult(String result) {
    return MotivationalBlocState(
      result: result,
      generating: false,
      errorOccured: false,
    );
  }

  MotivationalBlocState copyWithError() {
    return const MotivationalBlocState(
      result: "",
      generating: false,
      errorOccured: true,
    );
  }

  MotivationalBlocState copyWithGenerating() {
    return const MotivationalBlocState(
      result: "",
      generating: true,
      errorOccured: false,
    );
  }

  @override
  bool operator ==(covariant MotivationalBlocState other) {
    if (identical(this, other)) return true;

    return other.result == result &&
        other.generating == generating &&
        other.errorOccured == errorOccured;
  }

  @override
  int get hashCode =>
      result.hashCode ^ generating.hashCode ^ errorOccured.hashCode;
}
