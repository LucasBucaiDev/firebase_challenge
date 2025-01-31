import 'package:firebase_challenge/auth/auth.dart';
import 'package:firebase_challenge/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkCurrentUser();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            authenticated: (_) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MyHomePage(
                  title: 'Titulo x',
                ),
              ),
            ),
            unauthenticated: (_) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            ),
          );
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
