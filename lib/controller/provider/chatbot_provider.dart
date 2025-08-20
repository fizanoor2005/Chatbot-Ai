


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nozaapp/model/chatbot_model.dart';

class ChatbotProvider extends ChangeNotifier{
  ChatbotModel? chatresponse;

  TextEditingController controller=TextEditingController();
 sendmessage()async{
  final headers = {
  'Content-Type': 'application/json',
  'X-goog-api-key': 'AIzaSyDySX3Vpk89y8SfROQGSAqqd07gv5Y14ZA'
};
final body=json.encode({
  "contents": [
    {
      "parts": [
        {
          "text": controller.text
        }
      ]
    }
  ]
});
  final url=Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent");
  var data=await http.post(url,body: body,headers: headers);
  if (data.statusCode==200) {
    var response=jsonDecode(data.body);
  chatresponse= ChatbotModel.fromJson(response);
  notifyListeners();
  }
  

 }


}