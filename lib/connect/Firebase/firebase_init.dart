import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAro5IBkGYjxcN3D__Epp4s6tWq5CCvYh8",
      appId: "1:445979400630:web:d47d3ec6c99129464c4917",
      messagingSenderId: "445979400630",
      projectId: "winedgeproject",
      authDomain: "winedgeproject.firebaseapp.com",
      storageBucket: "winedgeproject.appspot.com",
      measurementId: "G-LBVG9E30YP",
    ),
  );

  if (app != null) {
    print('Firebase a été initialisé avec succès');
    // Vous pouvez ajouter d'autres opérations ici après l'initialisation
  } else {
     print('Firebase a rencontrer une erreur de connexion');
  }
}
