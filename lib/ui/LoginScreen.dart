import 'package:cryptochatter/ui/CoinsScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cryptochatter/ui/index.dart' as screens;
import 'package:cryptochatter/firebase_options.dart';
import 'package:cryptochatter/form/form_button.dart';
import 'package:cryptochatter/helper/fire_auth.dart';

goToCoinsScreen(BuildContext context, User user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screens.CoinsScreen(user: user)),
  );
}

signIn(String email, String password) async {
  UserOrError user = await FireAuth.signInUsingEmailPassword(
    email: email,
    password: password,
  );
  return user;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  String? emailError, passwordError;
  late Future<FirebaseApp> firebaseApp;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    User? user = FirebaseAuth.instance.currentUser;


    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoinsScreen(
            user: user,
          ),
        ),
      );
    }
    return firebaseApp;
  }

  onSubmitted(String email, String password) async {
    UserOrError userOrError = await signIn(email, password);
    return userOrError;
  }

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";

    emailError = null;
    passwordError = null;
    firebaseApp = _initializeFirebase();
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = "Email is invalid";
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = "Please enter a password";
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() async {
    if (validate()) {
      UserOrError userOrError = await onSubmitted(email, password);
      if (userOrError.user != null) {
        var localUser = userOrError.user;
        goToCoinsScreen(context, localUser!);
      } else {
        print("Invalid");
        setState(() {
          passwordError = userOrError.error;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      // body: FutureBuilder(
      //     future: _initializeFirebase(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState != ConnectionState.done) {
      //         return Column(
      //           children: const [
      //             CircularProgressIndicator(),
      //           ],
      //         );
      //       }
      //       return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(height: screenHeight * .12),
          const Text(
            "Welcome,",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * .01),
          Text(
            "Sign in to continue!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(.6),
            ),
          ),
          SizedBox(height: screenHeight * .12),
          InputField(
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            labelText: "Email",
            errorText: emailError,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autoFocus: true,
          ),
          SizedBox(height: screenHeight * .025),
          InputField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            onSubmitted: (val) => submit(),
            labelText: "Password",
            errorText: passwordError,
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * .075,
          ),
          FormButton(
            text: "Log In",
            onPressed: submit,
          ),
          SizedBox(
            height: screenHeight * .15,
          ),
          TextButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CoinsScreen(),
                    ),
                  ),
              child: RichText(
                  text: TextSpan(
                text: "Skip",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ))),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const screens.RegisterScreen(),
              ),
            ),
            child: RichText(
              text: TextSpan(
                text: "I'm a new user, ",
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
    //}));
  }
}
