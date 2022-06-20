import 'package:cryptochatter/helper/RandomUsername.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static void signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  static Future<UserOrError> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserOrError userOrError = UserOrError();
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      userOrError.user = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        userOrError.error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        userOrError.error = 'Wrong password provided.';
      }
    } catch (e) {
      userOrError.error = e.toString();
    }

    return userOrError;
  }

  static Future<UserOrError> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    name = randomUsername();
    UserOrError userOrError = UserOrError();
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      userOrError.user = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        userOrError.error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        userOrError.error = 'The account already exists for that email.';
      }
    } catch (e) {
      userOrError.error = e.toString();
    }
    return userOrError;
  }
}

class UserOrError {
  User? user;
  String? error;
}
