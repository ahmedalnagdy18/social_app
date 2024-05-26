import 'package:email_validator/email_validator.dart';
import 'package:firebase_app/core/common/buttons.dart';
import 'package:firebase_app/core/common/textfield.dart';
import 'package:firebase_app/features/authentication/data/repositories_imp/repository_imp.dart';
import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:firebase_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:firebase_app/features/authentication/presentation/pages/register.dart';
import 'package:firebase_app/features/home/presentation/pages/main_page.dart';
import 'package:firebase_app/injection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        risgesterUsecase:
            RisgesterUsecase(repository: injector.get<AuthRepositoryImp>()),
        loginUsecase:
            LoginUsecase(repository: injector.get<AuthRepositoryImp>()),
      ),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    double quarterHeight = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
              children: <TextSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                  text: 'Sign up',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: _isEnabled,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: quarterHeight),
                      child: Image.asset(
                        'images/logoa.jpg',
                        scale: 3,
                      ),
                    ),
                  ),
                  const Text(
                    'Login to your Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 28),
                  TextFieldWidget(
                    mycontroller: _email,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    hintText: "Email*",
                    obscureText: false,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    mycontroller: _password,
                    validator: (p0) {
                      if (_password.text.isNotEmpty) {
                        return null;
                      } else {
                        return "Password must not be empty";
                      }
                    },
                    hintText: "Password*",
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginCubitSucsess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                        );
                      } else if (state is LoginCubitFail) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: const Text('Wrong Password'),
                          action: SnackBarAction(
                            label: 'Undo',
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                        onPressed: () {
                          if (_email.text.isEmpty || _password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: const Text(
                                  'Error ! you must write all field'),
                              action: SnackBarAction(
                                label: 'Undo',
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ));
                          }
                          if (_isButtonEnabled) {
                            _loginButton(context);
                          }
                        },
                        text: (state is LoginCubitLoading)
                            ? 'Loading....'
                            : "Login",
                        colors: !_isButtonEnabled
                            ? [Colors.black, Colors.grey]
                            : [Colors.black, Colors.red],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<AuthCubit>(context)
        .addLogin(AuthEntity(email: _email.text, password: _password.text));
  }

  void _isEnabled() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
