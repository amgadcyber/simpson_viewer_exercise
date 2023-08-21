import 'dart:convert';

import 'package:get/get.dart';

import '../configs/configs.dart';
import '../features/core.dart';
import '../utils/logger.dart';

class APIRepository extends GetxController {
  static APIRepository get instance => Get.find();

  /// [fetchData] -- Fetch Data from API
  Future<BaseModel> fetchData() async {
    try {
      Logger.debugPrint('Starting...');
      final response = await APIProvider().connectToAPI();
      final body = response.body;

      Map<String, dynamic> json = jsonDecode(body);
      BaseModel? model;

      final m = BaseModel.fromJson(json);

      model = m;

      // Logger.debugPrint(m.relatedTopics[0]);
      Logger.debugPrint('Finished');
      return model;
    } catch (e) {
      Logger.debugPrintError(e);
      return Future.error(e);
    }
  }
}

class APIProvider extends GetConnect {
  /// [connectToAPI] -- Connect to API
  Future<Response> connectToAPI() async {
    try {
      final response = await get(AppFlavor.dataAPI);
      return response;
    } catch (error) {
      Logger.debugPrint('Error fetching data: $error');
      return const Response(bodyString: 'Error fetching data', statusCode: 500);
    }
  }
}
