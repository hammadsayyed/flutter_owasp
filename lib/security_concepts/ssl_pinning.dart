import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

import '../constants.dart';

class SSLPinningDemo extends StatefulWidget {
  const SSLPinningDemo({super.key});

  @override
  _SSLPinningDemoState createState() => _SSLPinningDemoState();
}

class _SSLPinningDemoState extends State<SSLPinningDemo> {
  String _response = '';
  late Dio dioClient;
  bool isLoading1 = false;
  bool isLoading2 = false;


  @override
  void initState() {
    super.initState();
  }

  // Add CertificatePinningInterceptor in dio Client
  Dio getClient(String baseUrl){
    var dio =  Dio(BaseOptions(baseUrl: baseUrl));
      dio.interceptors.add(CertificatePinningInterceptor(
          allowedSHAFingerprints: [Constants.CERTIFICATE_KEY]));
    return dio;
  }

  fetchData()async{
    try{
      setState(() {
        isLoading1 = true;
      });
      dioClient = getClient(Constants.baseUrl);
      // final response = await dioClient.get(Constants.baseUrl);
      final response = await dioClient.get('/');
      print(response.statusCode);
      print(response.statusMessage);
      _response = response.statusMessage.toString();
    }catch(err){
      _response = err.toString();
    }
    setState(() {
      isLoading1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SSL Pinning Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data with SSL Pinning'),
            ),
            const SizedBox(height: 16.0),
            isLoading1 ? const CircularProgressIndicator() : Text('Response: $_response',
              style: const TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
