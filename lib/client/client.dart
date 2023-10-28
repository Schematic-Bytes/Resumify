import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Client with ChangeNotifier {
  var file;
  Client(this.file);

  void getHttp() async {
    var response = await Dio().get("http://localhost:5000/");
  }

  void uploadFile() async {
    FormData formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(file),
      },
    );
    var response = await Dio().post(
      "http://localhost:5000/parse/single/",
      data: formData,
    );
    print(response.statusCode);
    notifyListeners();
  } // print(response);
}
