import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> args) {
  final openAiModelsResDir = Directory("resources/openai_models");
  final openAiModelsJsonFiles = openAiModelsResDir.listSync().whereType<File>();

  final outputDir = Directory("lib/generated/openai_models");
  if (outputDir.existsSync()) outputDir.deleteSync(recursive: true);
  outputDir.createSync(recursive: true);

  for (final jsonFile in openAiModelsJsonFiles) {
    final outputFilePath = p.join(
      outputDir.path,
      p.setExtension(p.basenameWithoutExtension(jsonFile.path), '.dart'),
    );
    final outputFileContent = _generateModelsDartFile(jsonFile);
    final outputFile = File(outputFilePath);
    outputFile.createSync();
    outputFile.writeAsStringSync(outputFileContent);
    Process.runSync("dart", ["format", outputFilePath]);
  }
}

String _generateModelsDartFile(File jsonFile) {
  StringBuffer buffer = StringBuffer();
  buffer.writeln("import \"../../models/open_ai_model.dart\";");
  buffer.writeln();
  buffer.writeln("const List<OpenAiModel> models = [");

  final jsonText = jsonFile.readAsStringSync();
  final jsonList = jsonDecode(jsonText) as List;
  for (final item in jsonList) {
    final map = item as Map;
    buffer.writeln("\tOpenAiModel(");
    buffer.writeln("\t\tmodelFamily: \"${map["modelFamily"]}\",");
    buffer.writeln("\t\tmodel: \"${map["model"]}\",");
    buffer.writeln("\t\tdescription: \"${map["description"] ?? ""}\",");
    buffer.writeln("\t\tlimit: \"${map["limit"] ?? ""}\",");
    buffer.writeln("\t\ttrainingData: \"${map["trainingData"] ?? ""}\",");
    buffer.writeln("\t),");
  }

  buffer.writeln("];");
  return buffer.toString();
}
