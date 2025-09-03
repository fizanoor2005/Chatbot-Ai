import 'package:flutter/material.dart';
import 'package:nozaapp/components/custom_textfield.dart';
import 'package:nozaapp/controller/provider/chatbot_provider.dart';
import 'package:nozaapp/view/splashscreen.dart';
import 'package:provider/provider.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.white,
      backgroundColor: Color(0xFF6A1E55),
    
      
      body: 
      Consumer<ChatbotProvider>(
        builder: (context,p,child) {
          // var p=context.watch<ChatbotProvider>();
          return Column(            
            children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
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
                padding: EdgeInsets.only(left:10,top:size.width<=500 ?30:15,bottom: 10),
                child: Row(                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashscreen()));
                        },
                        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                      
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
              
              Expanded(
                child: ListView.builder(
                  itemCount: p.allmessages.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    bool ai=index.isOdd;
                    return Padding(
                    padding: EdgeInsets.only(left:size.width<500?10:100,right: size.width<500?50:180,top: 25,bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       ai?CircleAvatar(
                          backgroundColor: Color(0xFFDB8DD0),
                       backgroundImage: AssetImage("assets/image.png",),
                        ):Text(""),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: ai?CrossAxisAlignment.start:CrossAxisAlignment.end,
                            children: [
                              ai?Text("Noza",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),):
                              Text("You",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height:5),

                          
                               Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                
                              )
                            ),
                            
                             child:  Padding(
                              padding: EdgeInsets.only(left: 10,right: 10,bottom: ai?0:10,top: 10),
                              child: Text(p.allmessages[index]),)
                            
                            ),
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  );
                  },
                  
                ),
              ),
             Container(
              child: Text(""),
             ),
            ],
          );
        }
        
      ),
      
      bottomSheet: CustomTextfield(),
      // bottomNavigationBar: CustomTextfield()
    );
  }
}