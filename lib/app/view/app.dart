import 'package:challenge_repository/challenge_repository.dart';
import 'package:challenge_service/challenge_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_challenge/app/view/landing_page.dart';
import 'package:firebase_challenge/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final challengeService = ChallengeService(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    );
    final challengeRepository = ChallengeRepository(
      challengeService: challengeService,
    );
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(challengeRepository),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LandingPage(),
          );
        }));
  }
}
