import 'package:challenge_repository/challenge_repository.dart';
import 'package:firebase_challenge/app/view/landing_page.dart';
import 'package:firebase_challenge/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.challengeRepository});

  final ChallengeRepository challengeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: challengeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(challengeRepository),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: LandingPage(),
            );
          },
        ),
      ),
    );
  }
}
