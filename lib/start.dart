import 'package:flutter/material.dart';
class StartScreen extends StatefulWidget {
  final String title;

  const StartScreen({Key? key, required this.title}) : super(key: key);


  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:   Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
                  child: const Text(
                    'Intelligent Course \nAllocation',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
                  const SizedBox(
                    height: 30.0,
                  ),


                  Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: const Text(
                    'Easily allocate courses to teachers in an intelligently manner',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        //color: Colors.blue,
                       // fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
                  const SizedBox(
                    height: 160.0,
                  ),

                  Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child:  ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/main_page');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      ' Admin  ',
                      style: TextStyle(fontSize: 15.0, height: 0.5),
                    ),
                  )),

                                    const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child:  ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/signup2');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Teacher',
                      style: TextStyle(fontSize: 15.0, height: 0.5),
                    ),
                  )),
               

               
               
            ],
          )),
      );
      
    
  }
}