import 'package:email_validator/email_validator.dart';
import 'package:firebase_app/core/common/buttons.dart';
import 'package:firebase_app/core/common/textfield.dart';
import 'package:firebase_app/features/authentication/data/repositories_imp/repository_imp.dart';
import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:firebase_app/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:firebase_app/features/home/presentation/pages/main_page.dart';
import 'package:firebase_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        risgesterUsecase:
            RisgesterUsecase(repository: injector.get<AuthRepositoryImp>()),
        loginUsecase:
            LoginUsecase(repository: injector.get<AuthRepositoryImp>()),
      ),
      child: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
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
                    child: Image.asset(
                      'images/logoa.jpg',
                      scale: 3,
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
                    mycontroller: _username,
                    validator: (p0) {
                      if (_username.text.isNotEmpty) {
                        return null;
                      } else {
                        return "Username must not be empty";
                      }
                    },
                    hintText: "Username*",
                    obscureText: false,
                  ),
                  const SizedBox(height: 16),
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
                      if (state is ResgisterCubitSucsess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                        );
                      } else if (state is LoginCubitFail) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: const Text('Erorr'),
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
                          if (_email.text.isEmpty ||
                              _password.text.isEmpty ||
                              _username.text.isEmpty) {
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
                            _registerButton(context);
                          }
                        },
                        colors: !_isButtonEnabled
                            ? [Colors.black, Colors.grey]
                            : [Colors.black, Colors.red],
                        text: (state is ResgisterCubitLoading)
                            ? 'Loading....'
                            : "Sign Up",
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

  void _registerButton(BuildContext context) {
    BlocProvider.of<AuthCubit>(context)
        .addResgister(AuthEntity(email: _email.text, password: _password.text));
  }

  void _isEnabled() {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _username.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
