import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Controller/auth_controller1.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading=true;
  final authController = Get.put(AuthController1());
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Obx(() => authController.isOtpSent.value
            ? _buildVerifyOtpForm()
            : _buildGetOtpForm())
      ]),
    );
  }

  Widget _buildGetOtpForm() {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          child: Container(
            color: theme.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: screenHeight * 0.15,
                ),
                SizedBox(height: 10),
                Text(
                  'Swacch Saathi',
                  style: TextStyle(fontSize: screenWidth * 0.08, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'From Waste to Wow...',
                  style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.03),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Obx(() => Column(
                children: [
                  TextFormField(
                    autofillHints: const [AutofillHints.telephoneNumberDevice],
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (val) {
                      authController.phoneNo.value = val;
                      authController.showPrefix.value = val.isNotEmpty;
                    },
                    onSaved: (val) => authController.phoneNo.value = val!,
                    validator: (val) => (val!.isEmpty || val.length < 10)
                        ? "Enter valid number"
                        : null,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      prefix: authController.showPrefix.value
                          ? const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '(+91)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                          : null,
                      // suffixIcon: _buildSuffixIcon(),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // final form = _formKey.currentState;
                        // if(authController.isLoading.value==false){
                        //   if (form!.validate()) {
                        //     form.save();
                        //     // TextInput.finishAutofillContext();
                        //     authController.getOtp();
                        //   }
                        //   setState(() {
                        //     authController.isLoading.value=true;
                        //   });
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: authController.isLoading.value==true ? Center(child: CircularProgressIndicator(color: Colors.white,),): const Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  SizedBox(
                    height: screenHeight * 0.25,
                    width: double.infinity,
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset("assets/images/illustration1.png", fit: BoxFit.cover),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyOtpForm() {
    List<TextEditingController> otpFieldsControler = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ];
    return Scaffold(
      backgroundColor: buttonColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            setState(() {
              authController.isOtpSent.value = false;
            });


          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        title: Text("Verify OTP",style: TextStyle(
            color: Colors.white
        ),),

      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Image(
                    height: 150,
                    image: AssetImage('assets/images/logo.png')),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please enter the code",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(
                            first: true,
                            last: false,
                            controller: otpFieldsControler[0]),
                        _textFieldOTP(
                            first: false,
                            last: false,
                            controller: otpFieldsControler[1]),
                        _textFieldOTP(
                            first: false,
                            last: false,
                            controller: otpFieldsControler[2]),
                        _textFieldOTP(
                            first: false,
                            last: false,
                            controller: otpFieldsControler[3]),
                        _textFieldOTP(
                            first: false,
                            last: false,
                            controller: otpFieldsControler[4]),
                        _textFieldOTP(
                            first: false,
                            last: true,
                            controller: otpFieldsControler[5]),
                      ],
                    ),
                    Text(
                      authController.statusMessage.value,
                      style: TextStyle(
                          color: authController.statusMessageColor.value,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(authController.isLoading.value==false){
                            setState(() {
                              authController.isLoading.value=true;
                            });
                            authController.otp.value = "";
                            for (var controller in otpFieldsControler) {
                              authController.otp.value += controller.text;
                            }
                            authController.verifyOTP();
                          }




                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(buttonColor),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: authController.isLoading.value==true? Center(child: CircularProgressIndicator(color: buttonColor,),) :const Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Having Problem?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Obx(
                        () => TextButton(
                      onPressed: () => authController.resendOTP.value
                          ? authController.resendOtp()
                          : null,
                      child: Text(
                        authController.resendOTP.value
                            ? "Resend New Code"
                            : "Wait ${authController.resendAfter} seconds",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({bool first = true, last, controller}) {
    var height = (Get.width - 82) / 6;
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: true,
          controller: controller,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              Get.focusScope?.nextFocus();
            }
            if (value.isEmpty && first == false) {
              Get.focusScope?.previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: height / 2, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: backgroundColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

}
