import 'package:flutter/material.dart';

// class OrientationExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           if (orientation == Orientation.portrait) {
//             return SingleChildScrollView(
//               child: Center(child: Column(
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 300,
//                       width: 300,
//                       child: Center(child: Text("Potrait Mode")),
//                       color: Colors.amber,
//                     ),
//                   )
//                 ],
//               )),
//             );
//           } else {
//             return SingleChildScrollView(
//               child: Center(child: Column(
//                 children: [
//                    Center(
//                     child: Container(
//                       height: 500,
//                       width: 500,
//                       child: Center(child: Text("Landscape  Mode")),
//                       color: Colors.amber,
//                     ),
//                   ),
//                    Center(
//                     child: Container(
//                       height: 300,
//                       width: 300,
//                       child: Center(child: Text("Potrait Mode")),
//                       color: Colors.amber,
//                     ),
//                   ), Center(
//                     child: Container(
//                       height: 300,
//                       width: 300,
//                       child: Center(child: Text("Potrait Mode")),
//                       color: Colors.amber,
//                     ),
//                   )
//                 ],
//               )),
//             );
//           }
//         },
//       ),
//     );
//   }
// }



class MyPage extends StatelessWidget {
  // Key for contact section
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey   aboutKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 100, 
        title: Text("Scroll to Contact"),
        actions: [
          TextButton(
            onPressed: () {
              Scrollable.ensureVisible(
                contactKey.currentContext!,
                duration: Duration(seconds: 1),
              );
            },
            child: Text("Contact", style: TextStyle(color: Colors.white)),
           

          ),
          InkWell(
            onTap: (){
              Scrollable.ensureVisible(
                aboutKey.currentContext!,
              );
            },
            child: Text("Contact", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 400, color: Colors.blue, child: Center(child: Text("Home", style: TextStyle(fontSize: 24, color: Colors.white)))),
            Container(
              key: aboutKey,
              height: 400, color: Colors.green, child: Center(child: Text("About", style: TextStyle(fontSize: 24, color: Colors.white)))),
            Container(
              key: contactKey,
              height: 400,
              color: Colors.red,
              child: Center(child: Text("Contact", style: TextStyle(fontSize: 24, color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}