import 'package:firebase_challenge/auth/cubit/cubit.dart';
import 'package:firebase_challenge/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value) =>
                              value!.isEmpty ? 'Ingrese un email' : null,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Contraseña'),
                          obscureText: true,
                          validator: (value) =>
                              value!.isEmpty ? 'Ingrese una contraseña' : null,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().loginWithCredentials(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                            }
                          },
                          child: const Text('Iniciar sesión'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().loginWithGoogle();
                          },
                          child: const Text('Iniciar sesión con Google'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
