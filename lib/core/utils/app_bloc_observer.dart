import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (bloc is ChatBloc) {
      debugPrint('ChatBloc Event -> ${event.runtimeType}');
      return;
    }
    debugPrint('Bloc Event -> ${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is ChatBloc) {
      debugPrint(
        'ChatBloc Transition -> ${transition.currentState.runtimeType} → '
        '${transition.nextState.runtimeType} via ${transition.event.runtimeType}',
      );
      return;
    }
    debugPrint('Bloc Transition -> ${bloc.runtimeType}: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Bloc Error -> ${bloc.runtimeType}: $error');
    super.onError(bloc, error, stackTrace);
  }
}
