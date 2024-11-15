// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


 
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
    apiKey: 'AIzaSyBcrSXF6egujzb-VN0Bklb2nOk7gf2e6HY',
    appId: '1:265143456343:web:61162df45abb4239780912',
    messagingSenderId: '265143456343',
    projectId: 'courses-auth-8c6ab',
    authDomain: 'courses-auth-8c6ab.firebaseapp.com',
    storageBucket: 'courses-auth-8c6ab.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKEAuKibogBo9SCEQ8dD-a9TfC2nlaQ-w',
    appId: '1:265143456343:android:4727685f7bacca3c780912',
    messagingSenderId: '265143456343',
    projectId: 'courses-auth-8c6ab',
    storageBucket: 'courses-auth-8c6ab.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpARXbJItFHABFXkldHcf5N1LNe_4gPks',
    appId: '1:265143456343:ios:88b9c0807e382512780912',
    messagingSenderId: '265143456343',
    projectId: 'courses-auth-8c6ab',
    storageBucket: 'courses-auth-8c6ab.firebasestorage.app',
    iosBundleId: 'com.example.coursesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpARXbJItFHABFXkldHcf5N1LNe_4gPks',
    appId: '1:265143456343:ios:88b9c0807e382512780912',
    messagingSenderId: '265143456343',
    projectId: 'courses-auth-8c6ab',
    storageBucket: 'courses-auth-8c6ab.firebasestorage.app',
    iosBundleId: 'com.example.coursesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcrSXF6egujzb-VN0Bklb2nOk7gf2e6HY',
    appId: '1:265143456343:web:5fd253d3bd0c1a13780912',
    messagingSenderId: '265143456343',
    projectId: 'courses-auth-8c6ab',
    authDomain: 'courses-auth-8c6ab.firebaseapp.com',
    storageBucket: 'courses-auth-8c6ab.firebasestorage.app',
  );
}

