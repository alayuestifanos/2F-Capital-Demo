import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:two_f_demo/core/widgets/common_widgets.dart';

import 'package:two_f_demo/features/sign_up/data/models/user_model.dart';
import 'package:two_f_demo/features/sign_up/presentation/bloc/sign_up_event.dart';

import 'package:two_f_demo/features/sign_up/presentation/widgets/custom_text_field.dart';
import 'package:two_f_demo/injection_container.dart';

import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_state.dart';

class Register extends StatelessWidget {
  Register({super.key});
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CommonWidgets.getAppBar(),
      body: _buildBody(height: height),
    );
  }

  BlocProvider<SignUpBloc> _buildBody({required double height}) {
    return BlocProvider(
      create: (_) => sl<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Register Success "),
              ),
            );
           
          
          } else if (state is SignUpFailed) {
            firstNameController.text = "";
            lastNameController.text = "";
            emailController.text = "";
            passwordController.text = "";
            confirmPasswordController.text = "";
            phoneNumberController.text = "";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SignUpLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w100),
                    ),
                    CustomTextField(
                      controller: firstNameController,
                      height: height,
                      headerText: "First Name",
                      hintText: "Abebe",
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "This field is required";
                        }
                        if (name.length < 2) {
                          return "Too short name";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: lastNameController,
                      height: height,
                      headerText: "Last Name",
                      hintText: "Kebede",
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "This field is required";
                        }
                        if (name.length < 2) {
                          return "Too short name";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: emailController,
                      height: height,
                      headerText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      hintText: "john@example.com",
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
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: InternationalPhoneNumberInput(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        onInputChanged: (k) {},
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        textFieldController: phoneNumberController,
                        countries: const ["ET"],
                        formatInput: false,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                      ),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      obscureText: true,
                      height: height,
                      headerText: "Enter Password",
                      hintText: " * * * * * * * * ",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Password is required";
                        }
                        final passwordRegex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (!passwordRegex.hasMatch(p0)) {
                          return "At least 1 upper,lower,number or special characters";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      height: height,
                      obscureText: true,
                      headerText: "Confirm Password",
                      hintText: " * * * * * * * * ",
                      validator: (p0) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          return "Password not matched";
                        }

                        return null;
                      },
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
                        child: const Text('REGISTER'),
                        onPressed: () {
                          var currentState = formKey.currentState;
                          if (currentState!.validate()) {
                            var user = UserModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: phoneNumberController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            context.read<SignUpBloc>().add(
                                  SignUp(user: user),
                                );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have An Account?",
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextButton(
                          onPressed: () {
                           
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
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
