import 'package:stack_scrap/home/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider {
  HomeProvider();

  Future<QuestionData> getData() async {
    var res = await http
        .get("http://192.168.0.107:8000/stack/questions/?format=json");
    var decodedJson = jsonDecode(res.body);
    print(decodedJson);
    QuestionData qd = QuestionData();
    qd.questions = [];

    for (var json in decodedJson) {
      qd.questions.add(Questions.fromJson(json));

    }

    return qd;
  }
}
