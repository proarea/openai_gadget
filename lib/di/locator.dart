import 'package:get_it/get_it.dart';
import 'package:openai_client/openai_client.dart';

import '../deps/blocs/chat_bloc.dart';
import '../deps/blocs/settings_bloc.dart';
import '../deps/services/open_ai_service.dart';
import '../generated/env.dart';

final locator = GetIt.instance;

Future<void> injectDependencies() async {
  locator.registerLazySingleton(
    () => OpenAIClient(
      configuration: OpenAIConfiguration(
        apiKey: Env.openAiToken,
      ),
    ),
  );

  locator.registerLazySingleton(
    () => OpenAiService(
      openAiClient: locator<OpenAIClient>(),
    ),
  );

  locator.registerFactory(
    () => ChatBloc(
      openAiService: locator<OpenAiService>(),
    ),
  );

  locator.registerLazySingleton(
    () => SettingsBloc(),
  );
}
