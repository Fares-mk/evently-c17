import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {


  // 1. The instance is now a singleton accessed via .instance
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> _init() async {
    // 2. You must await initialization.
    // On Android, this sets up the Credential Manager.
    await _googleSignIn.initialize(
      // serverClientId is often the "Web Client ID" from Firebase console
      // Required if you need a server auth code for your backend.
      serverClientId: '145461889640-kc6cvf33r5je6onsdqb33ii1td50smaj.apps.googleusercontent.com',
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    await _init();
    try {
      // 3. New Method: authenticate() replaces the older signIn() in many flows
      // though .signIn() still exists, .authenticate() is the modern GIS standard.
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null;
      // 4. Obtain auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      // 5. Link with Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }
}