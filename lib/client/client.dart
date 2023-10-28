import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:resumify/config.dart';

final logger = Logger("[client]");

class Client {
  late Dio _dio;

  Client() {
    _dio = Dio(
      BaseOptions(baseUrl: SERVER_URL),
    );
  }

  Future<Map<String, dynamic>?> parseSingleFile(String file) async {
    logger.info("requesting with file :- $file");

    final formData = FormData();
    formData.files.add(MapEntry("file", await MultipartFile.fromFile(file)));

    final response = await _dio.post("/parse/single/", data: formData);
    if (response.statusCode == 200) {
      return response.data;
    }

    logger.warning("server != 200 message: ${response.data}");
    return null;
  }

  Future<String?> queueMultipleFileJob(List<String> files) async {
    logger.info("queuing job for multiple files :- ${files.join('\n\t')}");

    final formData = FormData();

    for (final file in files) {
      formData.files.add(
        MapEntry(
          "files",
          await MultipartFile.fromFile(
            file,
            contentType: MediaType.parse("application/pdf"),
          ),
        ),
      );
    }

    final response = await _dio.post("/parse/multi/", data: formData);

    if (response.statusCode == 202) {
      return response.data['data']['id'];
    }

    logger.warning("server != 200 message: ${response.data}");
    return null;
  }

  Future<Map<String, dynamic>?> getJobStatus(String jobId) async {
    final response = await _dio.get("/parse/query/$jobId/");
    if (response.statusCode == 200) {
      print(response.data);
      return response.data['data']['id'];
    }

    logger.warning("server != 200 message: ${response.data}");
    return null;
  }

  Stream<Map<String, dynamic>> getJobStatusStream(String? jobId) async* {
    for (int tries = 0; tries <= 15; tries++) {
      print(" out $jobId $tries");
      if (jobId != null) {
        logger.info("Fetching job with id --> $jobId | tries --> $tries");
        final response = await getJobStatus(jobId);

        if (response != null) {
          logger.info("Fetching job with id --> $jobId | data found");
          yield response;
        }

        logger.info("Fetching job with id --> $jobId | not ready/doesn't exist");
      }
      await Future.delayed(const Duration(seconds: 10));
      print(jobId);
    }
    throw Exception("Failed to get job status tries out");
  }
}
