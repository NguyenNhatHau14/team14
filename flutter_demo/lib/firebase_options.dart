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
    apiKey: 'AIzaSyBXXmSh0yemrSv8KGydJngfyRA0DaZtVC0',
    appId: '1:805092401180:web:c34c1aff07d1c9fa4dffd9',
    messagingSenderId: '805092401180',
    projectId: 'doan-ltdd-609d9',
    authDomain: 'doan-ltdd-609d9.firebaseapp.com',
    storageBucket: 'doan-ltdd-609d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzGWWYQXDrZowM8V7kn2sgSR5MZY83GNM',
    appId: '1:805092401180:android:626c5f62875544e94dffd9',
    messagingSenderId: '805092401180',
    projectId: 'doan-ltdd-609d9',
    storageBucket: 'doan-ltdd-609d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOx52B9JIc37pREZJ6SRkuJcAOHZ7wlEs',
    appId: '1:805092401180:ios:44df8c054b42f7cc4dffd9',
    messagingSenderId: '805092401180',
    projectId: 'doan-ltdd-609d9',
    storageBucket: 'doan-ltdd-609d9.appspot.com',
    iosClientId: '805092401180-rielm60qbppkuva5km7odi2js5d7qmqs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOx52B9JIc37pREZJ6SRkuJcAOHZ7wlEs',
    appId: '1:805092401180:ios:44df8c054b42f7cc4dffd9',
    messagingSenderId: '805092401180',
    projectId: 'doan-ltdd-609d9',
    storageBucket: 'doan-ltdd-609d9.appspot.com',
    iosClientId: '805092401180-rielm60qbppkuva5km7odi2js5d7qmqs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterDemo',
  );
}
