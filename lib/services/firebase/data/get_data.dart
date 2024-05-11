import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetData {
  static final _firestore = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getData(
      {required String collectName}) async {
    try {
      final collection = _firestore.collection(collectName);
      final querySnapshot = await collection.get();

      return querySnapshot.docs;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getDoc(
      {required String collectName, required String docId}) async {
    try {
      final collection = _firestore.collection(collectName);
      final querySnapshot = await collection.doc(docId).get();

      return querySnapshot.data();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
