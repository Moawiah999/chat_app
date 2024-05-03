// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyBkyYpMV-d02VOp2ZLErcHHrkHFQryHtVo',
    appId: '1:714938727455:web:5a21db20741ca2e68ee92a',
    messagingSenderId: '714938727455',
    projectId: 'chat-app-new-9d974',
    authDomain: 'chat-app-new-9d974.firebaseapp.com',
    storageBucket: 'chat-app-new-9d974.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCT-O3VwNbAmEQ1pMKaXz1XzNcpIW5fp8c',
    appId: '1:714938727455:android:61b2e9f7b3f9f1ca8ee92a',
    messagingSenderId: '714938727455',
    projectId: 'chat-app-new-9d974',
    storageBucket: 'chat-app-new-9d974.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDozBdA7IuVO6SllO0ZLNTLDpa-0asnVME',
    appId: '1:714938727455:ios:1e443979eae0d08e8ee92a',
    messagingSenderId: '714938727455',
    projectId: 'chat-app-new-9d974',
    storageBucket: 'chat-app-new-9d974.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDozBdA7IuVO6SllO0ZLNTLDpa-0asnVME',
    appId: '1:714938727455:ios:1e443979eae0d08e8ee92a',
    messagingSenderId: '714938727455',
    projectId: 'chat-app-new-9d974',
    storageBucket: 'chat-app-new-9d974.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );
}
