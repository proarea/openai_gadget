import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', requireEnvFile: true)
abstract class Env {
  @EnviedField(varName: 'OPENAI_TOKEN', obfuscate: true)
  static final openAiToken = _Env.openAiToken;
}
