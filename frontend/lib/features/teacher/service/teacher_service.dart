import '../../../core/network/api_client.dart';

import '../model/teacher_model.dart';

class TeacherService {

  Future<TeacherModel> askTeacher({
    required String subject,
    required String question,
  }) async {

    final response =
        await ApiClient.dio.post(

      "/teacher/ask",

      data: {
        "subject": subject,
        "question": question,
      },
    );

    return TeacherModel.fromJson(
      response.data,
    );
  }
}