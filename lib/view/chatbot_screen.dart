import 'package:flutter/material.dart';
import 'package:nozaapp/controller/provider/chatbot_provider.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.white,
      backgroundColor: Color(0xFF6A1E55),
    
      
      body: 
      SingleChildScrollView(
        
        
        child: Consumer<ChatbotProvider>(
          builder: (context,p,child) {
            var p=context.watch<ChatbotProvider>();
            return Column(
              
              children: [
                
              Container(
                height: 100,
                decoration: BoxDecoration(
                  
                  // color: Color(0xFFDB8DD0),
                  gradient: LinearGradient(colors: [
                    //  Color(0xFFC562AF),
                     Color(0xFFDB8DD0),
                     Color.fromARGB(255, 255, 132, 197),
                     Color(0xFFDB8DD0),



                  ]
                  ),
                  
                  
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10,top: 30,bottom: 10),
                  child: Row(
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                        
                      ),
      
                         CircleAvatar(
                          radius: 25,
                          backgroundColor:  Color(0xFF6A1E55),
                              child:ClipOval(child: Image.asset("assets/image.png",fit: BoxFit.cover,)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                                Text("Noza",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                                
                                                Row(
                                                  children: [
                                                    Icon(Icons.circle,size: 12,color: Color(0xFF6A1E55),),
                                                    
                                                    Text(" Online",style: TextStyle(color: Color(0xFF6A1E55),fontWeight: FontWeight.bold),),
      
                                                    
                                                  ],
                                                  
                                                ),
                                                   
                                  ],
                                ),
                            ),
                            Spacer(),
                                                    Padding(
                                                      padding:  EdgeInsets.only(right: 10),
                                                      child: Icon(Icons.more_vert,color: Colors.black,),
                                                    ),
                                                   
      
                    ],
                  ),
                ),
              ), 
                if(p.chatresponse!=null)
                
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10,right: 50,top: 25,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
      
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 0,top: 10),
                        child: Text(p.chatresponse!.candidates[0].content.parts[0].text),
                      )),
                  )),
               Container(
                child: Text(""),
               ),
              ],
            );
          }
          
        ),
        
      ),
      bottomSheet: Container(
        height: 100,
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
                      topRight: Radius.circular(29)
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
                              var p= context.read<ChatbotProvider>(); 
                              p.sendmessage();
                              },
                child: CircleAvatar(
                  radius: 25,
                  // backgroundColor: Colors.blue,
      backgroundColor: Color(0xFF6A1E55),

                  child: Icon(Icons.send,color: Colors.white,size: 20,)),
              ),
             
          
            ],
          ),
        ),
      ),
    );
  }
}