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
    apiKey: 'AIzaSyAtgWBONZe0lZ4rqoWZZj_laWBQRDLysYo',
    appId: '1:191883750882:android:cbe9ebe4801d5fc4af1dbb',
    messagingSenderId: '191883750882',
    projectId: 'fir-challenge-a9be0',
    storageBucket: 'fir-challenge-a9be0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmwdubYo7F_dqF6WzzGG4WlBdKjOpvq0k',
    appId: '1:191883750882:ios:7560cdd3d01518b1af1dbb',
    messagingSenderId: '191883750882',
    projectId: 'fir-challenge-a9be0',
    storageBucket: 'fir-challenge-a9be0.firebasestorage.app',
    iosBundleId: 'com.urbetrack.firebaseChallenge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmwdubYo7F_dqF6WzzGG4WlBdKjOpvq0k',
    appId: '1:191883750882:ios:7560cdd3d01518b1af1dbb',
    messagingSenderId: '191883750882',
    projectId: 'fir-challenge-a9be0',
    storageBucket: 'fir-challenge-a9be0.firebasestorage.app',
    iosBundleId: 'com.urbetrack.firebaseChallenge',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAlPtC-G-BdeHccikV72wRKLpt7afi8Mbo',
    appId: '1:191883750882:web:d1c9bf33aac77845af1dbb',
    messagingSenderId: '191883750882',
    projectId: 'fir-challenge-a9be0',
    authDomain: 'fir-challenge-a9be0.firebaseapp.com',
    storageBucket: 'fir-challenge-a9be0.firebasestorage.app',
    measurementId: 'G-X9BVBZ21P2',
  );
}
