import 'package:amit_flutter/data/local/my_cache.dart';
import 'package:amit_flutter/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_material_button.dart';
import 'package:amit_flutter/constants/screens.dart' as screens;
import 'package:amit_flutter/constants/my_cache_keys.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController(text: MyCache.getString(key: MyCacheKeys.myEmail));
TextEditingController passwordController = TextEditingController(text: MyCache.getString(key: MyCacheKeys.myPassword));
var formKey = GlobalKey<FormState>();
IconData suffixIcon = Icons.visibility_off_outlined;
bool isHidden = true;


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: DefaultText(
          text: 'Login',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 20.sp,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    Fluttertoast.showToast(
                        msg: "Hello User!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.sp
                    );
                  });
                },
                child: Image.asset(
                  'assets/taxi-unlocking.png',
                  height: 30.h,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: 60.w,
                margin: EdgeInsets.only(top: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.sp),
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  scrollPhysics: const ScrollPhysics(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.deepOrangeAccent,
                    ),
                    label: const DefaultText(text: 'Email'),
                    labelStyle: const TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2.sp,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.sp,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Email address can't be empty";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 60.w,
                margin: EdgeInsets.only(top: 3.h, bottom: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.sp),
                ),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isHidden,
                  obscuringCharacter: '#',
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    prefixIcon: const Icon(
                      Icons.lock_open_outlined,
                      color: Colors.deepOrangeAccent,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isHidden) {
                            suffixIcon = Icons.remove_red_eye_outlined;
                          } else {
                            suffixIcon = Icons.visibility_off_outlined;
                          }
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(
                        suffixIcon,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    label: const DefaultText(text: 'Password'),
                    labelStyle: const TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2.sp,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.sp,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "Password can't be empty";
                    }else if(passwordController.text.length < 6){
                      return "Password can't be less than 6 Characters";
                    }
                    return null;
                  },
                ),
              ),
                DefaultMaterialButton(
                  margin: EdgeInsets.symmetric(horizontal: 19.w).copyWith(bottom: 2.h,),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Login Succeeded!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.sp
                        );
                      });
                      MyCache.putString(key: MyCacheKeys.myEmail, value: emailController.text);
                      MyCache.putString(key: MyCacheKeys.myPassword, value: passwordController.text);
                      Navigator.pushNamedAndRemoveUntil(context, screens.homeScreen, (route) => false, arguments: emailController.text);
                    }
                  },
                  radius: 20.sp,
                  child: const DefaultText(
                    text: 'LOGIN',
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.deepOrange,
                  internalPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 25.w),
                  splashColor: Colors.white,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 2.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: DefaultText(
                      text: 'Or',
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 2.h,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 2.h),
                height: 6.h,
                width: 63.w,
                child: OutlinedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      setState(() {
                        Fluttertoast.showToast(
                            msg: "Login With Google Succeeded!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.sp
                        );
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: SvgPicture.asset(
                          'assets/google.svg',
                          fit: BoxFit.contain,
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                      const DefaultText(
                        text: 'Login With Google',
                        color: Colors.red,
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    side: const BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: "Don't have an account?",
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: (){},
                        child: DefaultText(
                          text: 'Sign Up!',
                          fontSize: 12.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
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
