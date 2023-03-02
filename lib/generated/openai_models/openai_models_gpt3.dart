import "../../models/open_ai_model.dart";

const List<OpenAiModel> models = [
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "text-curie-001",
    description: "Very capable, faster and lower cost than Davinci.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "text-babbage-001",
    description: "Capable of straightforward tasks, very fast, and lower cost.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "text-ada-001",
    description:
        "Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "davinci",
    description:
        "Most capable GPT-3 model. Can do any task the other models can do, often with higher quality.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "curie",
    description: "Very capable, but faster and lower cost than Davinci.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "babbage",
    description: "Capable of straightforward tasks, very fast, and lower cost.",
    limit: "2,048 tokens",
    trainingData: "Up to Oct 2019",
  ),
  OpenAiModel(
    modelFamily: "GPT-3",
    model: "ada",
    description:
        "Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost",
    limit: "",
    trainingData: "",
  ),
];
