import "../../models/open_ai_model.dart";

const List<OpenAiModel> models = [
  OpenAiModel(
    modelFamily: "Codex",
    model: "code-davinci-002",
    description:
        "Most capable Codex model. Particularly good at translating natural language to code. In addition to completing code, also supports inserting completions within code.",
    limit: "8,000 tokens",
    trainingData: "Up to Jun 2021",
  ),
  OpenAiModel(
    modelFamily: "Codex",
    model: "code-cushman-001",
    description:
        "Almost as capable as Davinci Codex, but slightly faster. This speed advantage may make it preferable for real-time applications.",
    limit: "Up to 2,048 tokens",
    trainingData: "",
  ),
];
