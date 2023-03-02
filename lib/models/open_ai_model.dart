class OpenAiModel {
  final String modelFamily;
  final String model;
  final String description;
  final String limit;
  final String trainingData;

  const OpenAiModel({
    required this.modelFamily,
    required this.model,
    this.description = "",
    this.limit = "",
    this.trainingData = "",
  });

  @override
  bool operator ==(covariant OpenAiModel other) {
    if (identical(this, other)) return true;

    return other.modelFamily == modelFamily &&
        other.model == model &&
        other.description == description &&
        other.limit == limit &&
        other.trainingData == trainingData;
  }

  @override
  int get hashCode {
    return modelFamily.hashCode ^
        model.hashCode ^
        description.hashCode ^
        limit.hashCode ^
        trainingData.hashCode;
  }
}
