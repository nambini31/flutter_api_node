import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/models/inscription/Inscription_model.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';

class InscriptionController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> registerWithEmailAndPassword(InscriptionModel inscription, String collectionName) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: inscription.email,
        password: inscription.motDePasse,
      );
  
      String userId = userCredential.user!.uid; 
      await enregistrerDonneesDansFirestore(userId, inscription, collectionName);
      return userCredential.user;
    } catch (e) {
      print('Erreur lors de la création du compte : $e');
      return null;
    }
  }

  Future<void> enregistrerDonneesDansFirestore(String userId, InscriptionModel inscription, String collectionName) async {
    try {
      await _firestore.collection(collectionName).doc(userId).set({
        'nom': inscription.nom,
        'prenom': inscription.prenom,
        'dateNaissance': inscription.dateNaissance,
        'lieuNaissance': inscription.lieuNaissance,
        'email': inscription.email,
        'numeroTelephone': inscription.numeroTelephone,

      });

      await register(inscription.email, inscription.motDePasse);

      print('Données enregistrées dans Firestore avec succès');
    } catch (e) {
      print('Erreur lors de l\'enregistrement des données dans Firestore : $e');
    }
  }
}
