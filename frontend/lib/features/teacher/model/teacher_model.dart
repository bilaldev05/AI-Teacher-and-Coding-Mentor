class TeacherModel {

  final bool success;
  final String response;

  TeacherModel({
    required this.success,
    required this.response,
  });

  factory TeacherModel.fromJson(
      Map<String, dynamic> json) {

    return TeacherModel(
      success: json['success'],
      response: json['response'],
    );
  }
}