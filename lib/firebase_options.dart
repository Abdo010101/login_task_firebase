// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCvj3qXOLdHZWsmqUPqsAzRyXakmtdITS0',
    appId: '1:587745212451:web:18447d7bf3b5e8ea241996',
    messagingSenderId: '587745212451',
    projectId: 'loginusingfirebase-6a85d',
    authDomain: 'loginusingfirebase-6a85d.firebaseapp.com',
    storageBucket: 'loginusingfirebase-6a85d.appspot.com',
    measurementId: 'G-ZCBF92FVFM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNNp0yF7bjqpz0TsQOeW8Bn4e7Fitx9KA',
    appId: '1:587745212451:android:2476ad0a9c94c7f0241996',
    messagingSenderId: '587745212451',
    projectId: 'loginusingfirebase-6a85d',
    storageBucket: 'loginusingfirebase-6a85d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC94pSbocWeMw3PQEKjwX5bdjywSyGehM',
    appId: '1:587745212451:ios:1a1f6adada8b1a0f241996',
    messagingSenderId: '587745212451',
    projectId: 'loginusingfirebase-6a85d',
    storageBucket: 'loginusingfirebase-6a85d.appspot.com',
    iosBundleId: 'com.example.loginTask',
  );
}