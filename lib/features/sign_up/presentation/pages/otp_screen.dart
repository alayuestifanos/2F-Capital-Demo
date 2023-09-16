import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:two_f_demo/config/routes/routes.dart';
import 'package:two_f_demo/core/widgets/common_widgets.dart';
import 'package:two_f_demo/features/log_in/presentation/pages/log_in.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var verificationCode = "";
  var pin = "";
  @override
  void initState() {
    verifyPhone(widget.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonWidgets.getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                "OTP",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Text(
                "Insert the OTP sent to your number",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.phoneNumber,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/",
                        (route) => false,
                      );
                    },
                    child: const Text("Edit"),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                width: double.infinity,
                child: OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  numberOfFields: 6,
                  focusedBorderColor: Colors.black,

                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  textStyle: const TextStyle(color: Colors.black, height: 1.5),
                  borderWidth: 1.0,
                  margin: const EdgeInsets.only(right: 0),
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    pin = verificationCode;
                  }, // end onSubmit
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextButton(
                onPressed: () async {
                  await verifyPhone(widget.phoneNumber);
                },
                child: const Text(
                  'Resend',
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
                  child: const Text('CONTINUE'),
                  onPressed: () async {
                    await validate(pin);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validate(String pin) async {
    try {
      print("pin $pin");

      var user = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationCode,
          smsCode: pin,
        ),
      );
      if (user.user != null) {
        var route = AppRoutes.go(
          to: Login(),
        );
        if (context.mounted) {
          Navigator.push(context, route);
        }
      }
    } on FirebaseAuthException catch (e) {
      print("The error is");
      print(
        e.toString(),
      );
      print("invalid code");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Invalid code",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.red),
            ),
          ),
        );
      }
    }
  }

  verifyPhone(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+251$phoneNumber",
      verificationCompleted: (credential) {
        print(credential);
      },
      verificationFailed: (exception) {
        print(exception.toString());
      },
      codeSent: (verificationId, resendToken) {
        verificationCode = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
}
