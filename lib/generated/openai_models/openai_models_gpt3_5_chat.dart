import "../../models/open_ai_model.dart";

const List<OpenAiModel> models = [
  OpenAiModel(
    modelFamily: "GPT-3.5",
    model: "gpt-3.5-turbo",
    description:
        "Most capable GPT-3.5 model and optimized for chat at 1/10th the cost of text-davinci-003. Will be updated with our latest model iteration.",
    limit: "4,096 tokens",
    trainingData: "Up to Sep 2021",
  ),
  OpenAiModel(
    modelFamily: "GPT-3.5",
    model: "gpt-3.5-turbo-0301",
    description:
        "Snapshot of gpt-3.5-turbo from March 1st 2023. Unlike gpt-3.5-turbo, this model will not receive updates, and will only be supported for a three month period ending on June 1st 2023.",
    limit: "4,096 tokens",
    trainingData: "Up to Sep 2021",
  ),
];
