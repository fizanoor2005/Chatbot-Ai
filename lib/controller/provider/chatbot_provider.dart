


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nozaapp/model/chatbot_model.dart';

class ChatbotProvider extends ChangeNotifier{
  ChatbotModel? chatresponse;
  List allmessages=[];
 bool isloading=false;

 isShowloading(bool value){
  isloading=value;
  notifyListeners();
 }

  TextEditingController controller=TextEditingController();
 sendmessage()async{
  // controller.clear();
  allmessages.add(controller.text);
  isShowloading(true);
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
  allmessages.add(chatresponse!.candidates[0].content.parts[0].text);
  controller.clear();
  isShowloading(false);
  notifyListeners();
  }
  

 }


}