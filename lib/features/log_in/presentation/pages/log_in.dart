import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_f_demo/core/widgets/common_widgets.dart';
import 'package:two_f_demo/features/log_in/data/models/log_in_model.dart';
import 'package:two_f_demo/features/log_in/presentation/bloc/login_bloc.dart';
import 'package:two_f_demo/features/log_in/presentation/bloc/login_event.dart';
import 'package:two_f_demo/features/sign_up/presentation/widgets/widgets.dart';

import 'package:two_f_demo/injection_container.dart';

import '../bloc/login_state.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const routeName = "log_in_page_route";

  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonWidgets.getAppBar(),
      body: _buildBody(height),
    );
  }

  BlocProvider<LoginBloc> _buildBody(double height) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sign in Success"),
              ),
            );
            emailController.text = "";
            passwordController.text = "";
          }
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Email or password not correct",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red),
                ),
              ),
            );
            emailController.text = "";
            passwordController.text = "";
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _loginFormKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w100),
                    ),
                    CustomTextField(
                      height: height,
                      headerText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      hintText: "john@gmail.com",
                      controller: emailController,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "This field is required";
                        }
                        if (!EmailValidator.validate(email)) {
                          return "Invalid email";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                        obscureText: true,
                        height: height,
                        headerText: "Enter Password",
                        hintText: "********",
                        controller: passwordController),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                        child: const Text('LOGIN'),
                        onPressed: () {
                          LoginModel model = LoginModel(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          context.read<LoginBloc>().add(
                                LoginWithEmailAndPassword(loginModel: model),
                              );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have An Account?",
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/",
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
