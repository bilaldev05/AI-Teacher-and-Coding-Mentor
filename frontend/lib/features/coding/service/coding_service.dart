import '../../../core/network/api_client.dart';

import '../model/coding_model.dart';

class CodingService {

  Future<CodingModel> askCoding({
    required String language,
    required String problem,
  }) async {

    final response =
        await ApiClient.dio.post(

      "/coding/ask",

      data: {
        "language": language,
        "problem": problem,
      },
    );

    return CodingModel.fromJson(
      response.data,
    );
  }
}