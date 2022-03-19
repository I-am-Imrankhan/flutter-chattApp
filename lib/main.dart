import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_chatapp/providers/authenticationProvider.dart';
import 'package:my_flutter_chatapp/providers/counterViewModel.dart';
import 'package:my_flutter_chatapp/screens/homePage.dart';
import 'package:my_flutter_chatapp/screens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterViewModel(),
        ),
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => Authenticate()},
      /* title: 'CApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(), */
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return MyHomePage();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return LoginScreen();
  }
}
