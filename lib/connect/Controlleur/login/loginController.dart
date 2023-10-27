import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_api_node/connect/models/user_bridge.dart';

class LoginController {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User?> signInWithEmailAndPassword(String email, String password) async {
        try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
        );
        // print(response.error);
        return userCredential.user;
        } catch (e) {
        print('Erreur lors de la connexion : $e');
        return null;
        }
    }

    Future<void> signOut() async {
        await _auth.signOut();
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.remove('token');
        await pref.remove('userId');
        await pref.remove('prefill_email');
    }
}