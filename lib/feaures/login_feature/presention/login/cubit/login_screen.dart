import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/cores/di.dart';
import 'package:login_task/cores/utils/app_strings.dart';
import 'package:login_task/cores/utils/styles.dart';
import 'package:login_task/feaures/login_feature/presention/home/home_screen.dart';
import 'package:login_task/feaures/login_feature/presention/login/cubit/login_cubit.dart';
import 'package:login_task/feaures/login_feature/presention/login/cubit/register_screen.dart';
import 'package:login_task/feaures/login_feature/presention/login/widgets/custom_text_form_field.dart';
import 'package:login_task/feaures/login_feature/presention/login/widgets/default_button.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController? emailController;
  late TextEditingController? passwordController;
  late LoginCubit _loginCubit;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _loginCubit = getIt.get<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.headingName,
                style: Styles.styleHeader,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                AppStrings.subHeadingName,
                style: Styles.styleSubHeader,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                AppStrings.emailString,
                style: Styles.style20,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomeTextFiled(
                autovalidateMode: autovalidateMode,
                textEditingController: emailController!,
                hinText: 'Enter Your Email',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                AppStrings.passwordString,
                style: Styles.style20,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomeTextFiled(
                autovalidateMode: autovalidateMode,
                validator: (String? val) {
                  if (val!.length >= 7) {
                    return null;
                  } else {
                    return 'password must at least 8 char';
                  }
                },
                textEditingController: passwordController!,
                hinText: 'Enter Your Password',
              ),
              SizedBox(
                height: 55.h,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                bloc: _loginCubit,
                builder: (context, state) {
                  return state is LoginSignInLoading
                      ? Center(child: CircularProgressIndicator())
                      : DefalutButton(
                          title: AppStrings.titleButton,
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              await _loginCubit.checkLoginAndRegister(context,
                                  emailController!, passwordController!, true);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          });
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                  child: Text(
                    AppStrings.registerText,
                    style: Styles.style12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
