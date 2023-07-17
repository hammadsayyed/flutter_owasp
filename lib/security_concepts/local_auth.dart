import 'package:flutter/material.dart';
import 'package:flutter_owasp/constants.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({Key? key}) : super(key: key);

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Biometric Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: biometricAuth,
                child: const Text('Test Biometric')),
          ],
        ),
      ),
    );
  }

  biometricAuth()async{
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    final List<BiometricType> availableBiometrics =
    await auth.getAvailableBiometrics();

    if(canAuthenticate){
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(biometricOnly: true));
      print('didAuthenticate');
      print(didAuthenticate);
    }
    // if (availableBiometrics.isNotEmpty) {
    //   // Some biometrics are enrolled.
    // }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }
}
