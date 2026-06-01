class CodingModel {

  final bool success;
  final String response;

  CodingModel({
    required this.success,
    required this.response,
  });

  factory CodingModel.fromJson(
      Map<String, dynamic> json) {

    return CodingModel(
      success: json['success'],
      response: json['response'],
    );
  }
}