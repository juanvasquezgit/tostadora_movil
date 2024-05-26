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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBX-AL79Vv78oFo7nTnCxKE2Q2HxdMPZu8',
    appId: '1:451070999128:android:74745daf5962a055d7e82d',
    messagingSenderId: '451070999128',
    projectId: 'proyecto-de6af',
    databaseURL: 'https://proyecto-de6af-default-rtdb.firebaseio.com',
    storageBucket: 'proyecto-de6af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrUgXIBlIx3QjDWDzqGge8FlHTyGus3ag',
    appId: '1:451070999128:ios:2f6683b9d3c08bcfd7e82d',
    messagingSenderId: '451070999128',
    projectId: 'proyecto-de6af',
    databaseURL: 'https://proyecto-de6af-default-rtdb.firebaseio.com',
    storageBucket: 'proyecto-de6af.appspot.com',
    iosBundleId: 'co.edu.uceva.digitalCoffee',
  );
}
