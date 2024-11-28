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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAwlJf5CfGXxc--UWYbGtOP-HxeCzdgpjU',
    appId: '1:183023375274:web:a56c676d855ea22cba51d3',
    messagingSenderId: '183023375274',
    projectId: 'sddproject-5e9e3',
    authDomain: 'sddproject-5e9e3.firebaseapp.com',
    storageBucket: 'sddproject-5e9e3.firebasestorage.app',
    measurementId: 'G-YG05EB980K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2pU1CtGfwJJLA8PsVhr5UsiC9M0fFz3M',
    appId: '1:183023375274:android:e49f6ada558d1f7bba51d3',
    messagingSenderId: '183023375274',
    projectId: 'sddproject-5e9e3',
    storageBucket: 'sddproject-5e9e3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkFgXmxlyNIsrod1ubbcYFw40XQJoMvo0',
    appId: '1:183023375274:ios:58e4612c92d5471bba51d3',
    messagingSenderId: '183023375274',
    projectId: 'sddproject-5e9e3',
    storageBucket: 'sddproject-5e9e3.firebasestorage.app',
    iosBundleId: 'com.example.sddproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkFgXmxlyNIsrod1ubbcYFw40XQJoMvo0',
    appId: '1:183023375274:ios:58e4612c92d5471bba51d3',
    messagingSenderId: '183023375274',
    projectId: 'sddproject-5e9e3',
    storageBucket: 'sddproject-5e9e3.firebasestorage.app',
    iosBundleId: 'com.example.sddproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwlJf5CfGXxc--UWYbGtOP-HxeCzdgpjU',
    appId: '1:183023375274:web:9b14df0ddd3d76bfba51d3',
    messagingSenderId: '183023375274',
    projectId: 'sddproject-5e9e3',
    authDomain: 'sddproject-5e9e3.firebaseapp.com',
    storageBucket: 'sddproject-5e9e3.firebasestorage.app',
    measurementId: 'G-K413C0CXST',
  );
}
