import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection_container.dart';
import '../features/chat/presentation/bloc/chat_bloc.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<ChatBloc>(
      create: (_) => serviceLocator<ChatBloc>(),
    ),
  ];
}
