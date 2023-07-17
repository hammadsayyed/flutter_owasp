import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EncryptStorage extends StatefulWidget {
  const EncryptStorage({Key? key}) : super(key: key);

  @override
  State<EncryptStorage> createState() => _EncryptStorageState();
}

class _EncryptStorageState extends State<EncryptStorage> {

  late final FlutterSecureStorage storage;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Keys With ENV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: saveNormalWay,
                child: const Text('Save in Normal way')),

            ElevatedButton(onPressed: saveEncryptedWay,
                child: const Text('Save in Encrypted way')),
          ],
        ),
      ),
    );
  }

  saveNormalWay() async {
    await prefs.setInt('counter', 10);
    await prefs.setBool('repeat', true);
    await prefs.setString('action', 'Start');
  }

  saveEncryptedWay() async {
    await storage.write(key: 'key', value: 'value');
    await storage.write(key: 'secure_key', value: 'SAVING_SECURED_KEY');
  }
}
