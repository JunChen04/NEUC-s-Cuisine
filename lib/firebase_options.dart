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
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD05pzGUSwV0DyYi1u_1_PxBnUpWTaJ1pw',
    appId: '1:1008087885998:android:8e91d6b7e1ed4d7a67e53f',
    messagingSenderId: '1008087885998',
    projectId: 'neuccuisine-2899f',
    storageBucket: 'neuccuisine-2899f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0B84Tq5ba2i3ubgj7yaKn_04veKHUJ7s',
    appId: '1:1008087885998:ios:674e889ca3e60e5367e53f',
    messagingSenderId: '1008087885998',
    projectId: 'neuccuisine-2899f',
    storageBucket: 'neuccuisine-2899f.appspot.com',
    iosBundleId: 'com.example.neucCuisine',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB4_fToH9YiGXCkY8X0NAiYv32-AV-WKsI',
    appId: '1:1008087885998:web:a91b781a35d7e71267e53f',
    messagingSenderId: '1008087885998',
    projectId: 'neuccuisine-2899f',
    authDomain: 'neuccuisine-2899f.firebaseapp.com',
    storageBucket: 'neuccuisine-2899f.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0B84Tq5ba2i3ubgj7yaKn_04veKHUJ7s',
    appId: '1:1008087885998:ios:674e889ca3e60e5367e53f',
    messagingSenderId: '1008087885998',
    projectId: 'neuccuisine-2899f',
    storageBucket: 'neuccuisine-2899f.appspot.com',
    iosBundleId: 'com.example.neucCuisine',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4_fToH9YiGXCkY8X0NAiYv32-AV-WKsI',
    appId: '1:1008087885998:web:b82d290d6a71bf1867e53f',
    messagingSenderId: '1008087885998',
    projectId: 'neuccuisine-2899f',
    authDomain: 'neuccuisine-2899f.firebaseapp.com',
    storageBucket: 'neuccuisine-2899f.appspot.com',
  );

}