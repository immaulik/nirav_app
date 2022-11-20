import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/screens/register/register_ctrl.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';
import 'package:timepass/src/utils/widgets/custom_textfield.dart';
import 'package:timepass/src/utils/widgets/loader.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final c = Get.put(RegisterCtrl());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register",
                style: context.textTheme.headlineLarge!
                    .copyWith(fontSize: 24, color: AppColors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Text("First, You have to register."),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: c.nameCTRL,
                hint: "Enter your name",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender"),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          c.selectGender(0);
                        },
                        child: Obx(
                          () => Row(
                            children: [
                              c.selectGender.value == 0
                                  ? Icon(
                                      Icons.radio_button_checked_outlined,
                                      color: context.theme.primaryColor,
                                    )
                                  : Icon(Icons.radio_button_unchecked_outlined,
                                      color: AppColors.grey),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          c.selectGender(1);
                        },
                        child: Obx(
                          () => Row(
                            children: [
                              c.selectGender.value == 1
                                  ? Icon(
                                      Icons.radio_button_checked_outlined,
                                      color: context.theme.primaryColor,
                                    )
                                  : Icon(Icons.radio_button_unchecked_outlined,
                                      color: AppColors.grey),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                hint: "Enter Country",
                textInputAction: TextInputAction.next,
                controller: c.countryCTRL,
                keyBoardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter country";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                hint: "Enter your age",
                textInputAction: TextInputAction.next,
                controller: c.ageCTRL,
                keyBoardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter age";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: context.width,
                height: 45,
                child: ElevatedButton(
                  child: Obx(
                    () => c.isLoading.isTrue
                        ? Center(child: Loader())
                        : Text(
                            "Submit",
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: AppColors.white),
                          ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      c.createAccount();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
