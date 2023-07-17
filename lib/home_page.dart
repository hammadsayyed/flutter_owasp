import 'package:flutter/material.dart';
import 'package:flutter_owasp/security_concepts/encrypt_storage.dart';
import 'package:flutter_owasp/security_concepts/local_auth.dart';
import 'package:flutter_owasp/security_concepts/reverse_engineer.dart';
import 'package:flutter_owasp/security_concepts/root_detection.dart';
import 'package:flutter_owasp/security_concepts/secure_keys_with_env.dart';
import 'package:flutter_owasp/security_concepts/ssl_pinning.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReverseEngineerKey()),
              );
            },
                child: const Text('Reverse Engineer Key Leak')),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FetchEnvKey()),
              );
            },
                child: const Text('Secure Keys With ENV')),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EncryptStorage()),
              );
            },
                child: const Text('Secure Storage')),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocalAuth()),
              );
            },
                child: const Text('Local Auth')),


            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RootDetection()),
              );
            },
                child: const Text("Root/Jailbreak Detection")),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SSLPinningDemo()),
              );
            },
                child: const Text("SSL Pinning")),
          ],
        ),
      ),
    );
  }
}