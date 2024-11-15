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
    apiKey: 'AIzaSyB3XpBGPMULOka1FrfgI_kr1fxH0K77guQ',
    appId: '1:166944293640:android:344efb6c238c173aef22bd',
    messagingSenderId: '166944293640',
    projectId: 'projectchatbot-31035',
    storageBucket: 'projectchatbot-31035.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDquzjKv_Rio_zDGqXw13iiU2bgS2TCmOU',
    appId: '1:166944293640:ios:70708ea7ea935dceef22bd',
    messagingSenderId: '166944293640',
    projectId: 'projectchatbot-31035',
    storageBucket: 'projectchatbot-31035.firebasestorage.app',
    androidClientId: '166944293640-qotbjssgf7spdt7tdmgktlnlh1o0b9aj.apps.googleusercontent.com',
    iosClientId: '166944293640-9qh8ndeeo1lk3b2hhn82frelg968hrqc.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectChatbot',
  );

}