import 'package:flutter/material.dart';
import 'package:nozaapp/controller/provider/chatbot_provider.dart';
import 'package:provider/provider.dart';


class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatbotProvider>(
      builder: (context, p, child) {
        return  Container(
          height: 100,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            // color: Colors.blue[600],
        // color: Color(0xFFD8F2E9),
                      // color: Color(0xFFDB8DD0),
                       gradient: LinearGradient(colors: [
                      //  Color(0xFFC562AF),
                       Color(0xFFDB8DD0),
                       Color.fromARGB(255, 255, 132, 197),
                       Color(0xFFDB8DD0),
      
      
      
                    ]
                    ),
                      
        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(29),
                        topRight: Radius.circular(29),
                        
                      )
            
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
            child: Row(
              children: [
               
                Builder(
                  builder: (context) {
                    var p=context.watch<ChatbotProvider>();
                    return Expanded(
                      child: TextField(
                        
                            controller: p.controller,
                            decoration: InputDecoration(
                              hintText: "Ask Anything",
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                  
                      
                                ),
                                borderSide: BorderSide(
                                  // color: Colors.white,
                                  color: Color(0xFF6A1E55),
                                  
                                  width: 1
                                )
            
                              ),
                              focusedBorder: OutlineInputBorder(
                                
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                      
                                ),
                                borderSide: BorderSide(
                                  // color: Colors.blue,
                                  color: Color(0xFF6A1E55),
      
                                  width: 1
            
                                )
                              ),
                              suffixIcon: InkWell(
                               
                                child: Padding(
                                  padding:  EdgeInsets.only(right:8),
                                  child: Icon(Icons.settings_voice,color: Colors.black,),
                                )),
                            ),
                          ),
                    );
                  }
                ),
                SizedBox(width: 10,),
            
                InkWell(
                   onTap: (){
                                // var p= context.read<ChatbotProvider>(); 
                                p.sendmessage();
                                },
                  child: CircleAvatar(
                    radius: 25,
                    // backgroundColor: Colors.blue,
        backgroundColor: Color(0xFF6A1E55),
      
                    child:p.isloading?SizedBox(
                      height: 20,width: 20,
                      child: CircularProgressIndicator(color: Colors.white,)): InkWell(
                        onTap:(){
                           p.sendmessage();
                        },
                        child: Icon(Icons.send,color: Colors.white,size: 20,))),
                ),
               
            
              ],
            ),
          ),
        );
      },
     
    );
  }
}