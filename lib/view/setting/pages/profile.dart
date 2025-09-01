import 'package:assistantapp/core/class/custom_button.dart';
import 'package:assistantapp/view/setting/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/custom_text_form.dart';
import '../../../core/services/validation/inputvalidator.dart';
import '../../../core/constances/colors.dart';

class ProfilePage extends StatelessWidget {
  SettingsController controller = Get.find();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        nameController.text = controller.name.value ?? "";
        emailController.text = controller.email.value ?? "";
        phoneController.text = controller.number.value ?? "";

        return Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: controller.pickImage,
                child: Obx(() {
                  if (controller.pickedImage.value != null) {
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(controller.pickedImage.value!),
                    );
                  } else if (controller.profileImage.value != null) {
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        controller.profileImage.value!,
                      ),
                    );
                  } else {
                    return CircleAvatar(radius: 70, child: Icon(Icons.person));
                  }
                }),
              ),
              SizedBox(height: 20),
              CustomTextForm(
                mycontroller: nameController,
                hinttext: "UserName",
                obscureText: false,
                validator: (val) {
                  return InputValidator.validateName(val);
                },
              ),
              SizedBox(height: 10),
              CustomTextForm(
                mycontroller: emailController,
                hinttext: "Email",
                obscureText: false,
                suffixIcon: Icon(Icons.email),
                validator: (val) {
                  return InputValidator.validateEmail(val);
                },
              ),
              SizedBox(height: 10),
              CustomTextForm(
                mycontroller: phoneController,
                hinttext: "PhoneNumber",
                obscureText: false,
                suffixIcon: Icon(Icons.phone),
                validator: (val) {
                  return InputValidator.validatephonenumber(val);
                },
              ),

              SizedBox(height: 20),
              Custombutton(
                color: green,
                onTap: () {
                  controller.saveProfile(
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                  );
                },
                text: "Save",
              ),
            ],
          ),
        );
      }),
    );
  }
}
