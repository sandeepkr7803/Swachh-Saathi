import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:swachh_saathi_admin/Models/article_model.dart';
import 'package:swachh_saathi_admin/constants.dart';

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile, String articleId) async {
    final ref = _storage.ref().child('articles/$articleId.jpg');
    final uploadTask = await ref.putFile(imageFile);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<void> uploadArticle({
    required String title,
    required String description,
    // required File imageFile,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception("User not logged in");

    // Let Firestore generate the ID
    final docRef = firestore.collection('articles').doc();
    final articleId = docRef.id;

    // final imageUrl = await uploadImage(imageFile, articleId);

    final article = Article(
      id: articleId,
      title: title,
      description: description,
      // imageUrl: imageUrl,
      userId: user.uid,
      createdAt: DateFormat('d MMMM yyyy hh:mm a').format(DateTime.now()),
    );

    await docRef.set(article.toMap());
  }
}
