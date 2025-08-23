import 'package:assistantapp/core/class/inputvalidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Routes/AppRoutes.dart';
import '../../../core/constances/colors.dart';
import '../../../core/services/helper.dart';
import '../../../models/auth_model/login-request.dart';
import '../../../widgets/custom_widgets/CustomButton.dart';
import '../../../widgets/custom_widgets/CustomTextForm.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    final height = _mediaQuery.size.height;
    final width = _mediaQuery.size.width;
    final isportrait = _mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => _controller.isLoading.value
            ? Center(
                child: Lottie.asset(
                  'assets/animations/Animation - 1740348375718.json',
                  fit: BoxFit.cover,
                  repeat: true,
                  height: 150,
                  width: 150,
                ),
              )
            : Container(
                padding: EdgeInsets.all(width * 0.05),
                child: ListView(
                  children: [
                    Form(
                      key: _controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height * 0.06),
                          Text(
                            "Log in".tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: height * 0.04),
                          Text(
                            "Log in to your account\n and then continue using this app"
                                .tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: height * 0.08),
                          CustomTextForm(
                            validator: (val) {
                              return InputValidator.validateEmail(val);
                            },
                            mycontroller: _controller.emailController,
                            hinttext: "Enter your Email".tr,
                            obscureText: false,
                          ),
                          SizedBox(height: height * 0.05),
                          CustomTextForm(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _controller.passwordvisiblity.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[500],
                              ),
                              onPressed: () =>
                                  _controller.passwordvisiblity.toggle(),
                            ),

                            validator: (val) {
                              return InputValidator.validatePassword(val);
                            },
                            obscureText: _controller.passwordvisiblity.value,
                            mycontroller: _controller.passwordController,
                            hinttext: 'Enter Your Password'.tr,
                          ),
                          SizedBox(height: height * 0.01),
                          InkWell(
                            onTap: () => {Get.toNamed(AppRoutes.checkemail)},
                            child: Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(
                                top: height * 0.01,
                                bottom: height * 0.02,
                              ),
                              child: Text(
                                "Forgot Password ?".tr,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: width * 0.03,
                                  color: green,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.08),
                          Custombutton(
                            onTap: () {
                              if (_controller.formKey.currentState!
                                  .validate()) {
                                final helper _prefsHelper = Get.find<helper>();
                                final String? fireBaseToken = _prefsHelper.prefs.getString("fireBaseToken");
                                final model = loginRequest(
                                  email: _controller.emailController.text,
                                  password: _controller.passwordController.text,
                                  deviceToken: fireBaseToken!,
                                );
                                _controller.loginUser(model);
                              }
                            },
                            text: 'Login'.tr,
                            color: green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
