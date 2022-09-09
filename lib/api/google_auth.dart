import 'package:google_sign_in/google_sign_in.dart';

class GoogoleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> google_SignIn() =>
      _googleSignIn.signIn();
      
  static Future<GoogleSignInAccount?> google_SignIn2() =>
      _googleSignIn.signIn();
  static Future google_LogOut() => _googleSignIn.disconnect();
}




