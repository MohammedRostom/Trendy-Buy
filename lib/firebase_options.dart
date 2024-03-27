// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';
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
    apiKey: 'AIzaSyBNgrUFbT5g3klGNyq2A4TDC6JuqGg7u30',
    appId: '1:326170741611:web:1e7ab9318d764eb0e6da2e',
    messagingSenderId: '326170741611',
    projectId: 'nodeapp-9bdef',
    authDomain: 'nodeapp-9bdef.firebaseapp.com',
    storageBucket: 'nodeapp-9bdef.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbYIE3eIvlu_Sev5Te7GfjbwhAfXQQvzQ',
    appId: '1:326170741611:android:7a16c75b82ccb611e6da2e',
    messagingSenderId: '326170741611',
    projectId: 'nodeapp-9bdef',
    storageBucket: 'nodeapp-9bdef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZMR-Hjk4G5sgI1yoaI5dKxWMZjsBUlCo',
    appId: '1:326170741611:ios:6ae81ee4aab36239e6da2e',
    messagingSenderId: '326170741611',
    projectId: 'nodeapp-9bdef',
    storageBucket: 'nodeapp-9bdef.appspot.com',
    iosBundleId: 'com.example.noteAppWithCubit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZMR-Hjk4G5sgI1yoaI5dKxWMZjsBUlCo',
    appId: '1:326170741611:ios:1072346abeda3fd7e6da2e',
    messagingSenderId: '326170741611',
    projectId: 'nodeapp-9bdef',
    storageBucket: 'nodeapp-9bdef.appspot.com',
    iosBundleId: 'com.example.noteAppWithCubit.RunnerTests',
  );
}