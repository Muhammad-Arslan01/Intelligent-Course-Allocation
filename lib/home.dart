import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Center(child: Text('Logged in as ${user.email}')),
            TextButton(
              onPressed: (() => FirebaseAuth.instance.signOut()),
              child: const Text(
                'Signout',
                style: TextStyle(fontSize: 20),
              )
                
              
            )
          ],
        ),
      ),
    );
  }
}
