import "../../models/open_ai_model.dart";

const List<OpenAiModel> models = [
  OpenAiModel(
    modelFamily: "GPT-3.5",
    model: "text-davinci-003",
    description:
        "Can do any language task with better quality, longer output, and consistent instruction-following than the curie, babbage, or ada models. Also supports inserting completions within text.",
    limit: "4,000 tokens",
    trainingData: "Up to Jun 2021",
  ),
  OpenAiModel(
    modelFamily: "GPT-3.5",
    model: "text-davinci-002",
    description:
        "Similar capabilities to text-davinci-003 but trained with supervised fine-tuning instead of reinforcement learning",
    limit: "4,000 tokens",
    trainingData: "Up to Jun 2021",
  ),
  OpenAiModel(
    modelFamily: "GPT-3.5",
    model: "code-davinci-002",
    description: "Optimized for code-completion tasks",
    limit: "4,000 tokens",
    trainingData: "Up to Jun 2021",
  ),
];
