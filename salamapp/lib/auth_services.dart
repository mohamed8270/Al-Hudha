import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salamapp/interface/bottomnav.dart';

import 'signup screen/signup.dart';

class AuthService {
  // handleAuthState()
  // signInwithGoogle()
  // signOut()

  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getProfileImage() {
    if (FirebaseAuth.instance.currentUser!.photoURL != null) {
      return Image.network(
        FirebaseAuth.instance.currentUser!.photoURL!,
        height: 100,
        width: 100,
      );
    } else {
      return const Icon(
        Icons.account_circle,
        size: 100,
      );
    }
  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNav();
        } else {
          return const SignScreen();
        }
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // ignore: non_constant_identifier_names
    final Credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(Credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
