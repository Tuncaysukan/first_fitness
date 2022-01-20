import 'dart:io';

import 'package:fitness_first/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String isSelected = 'login';
  bool isVisible = true;
  bool psw = true;
  bool confirmPsw = true;
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: blackColor.withOpacity(0.7),
        child: WillPopScope(
          onWillPop: () async {
            bool backStatus = onWillPop();
            if (backStatus) {
              exit(0);
            }
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        logo(),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        tabBar(),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        isSelected == 'login'
                            ? loginDetail()
                            : registerDetail(),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        otherOptions(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  logo() {
    return Image.asset(
      'assets/logo.png',
      height: 75,
      width: 140,
      fit: BoxFit.cover,
    );
  }

  tabBar() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = 'login';
              });
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected == 'login' ? primaryColor : whiteColor,
                    width: 3,
                  ),
                ),
              ),
              child: Text(
                'Giriş',
                style: TextStyle(
                  color: isSelected == 'login' ? primaryColor : whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = 'register';
              });
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected == 'register' ? primaryColor : whiteColor,
                    width: 3,
                  ),
                ),
              ),
              child: Text(
                'Kayıt Ol',
                style: TextStyle(
                  color: isSelected == 'register' ? primaryColor : whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loginDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        nameTextField(),
        heightSpace,
        heightSpace,
        passwordTextField(),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        loginButton(),
      ],
    );
  }

  nameTextField() {
    return TextField(
      keyboardType: TextInputType.name,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'Kullanıcı Adı',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.person_outline,
            color: whiteColor,
            size: 18,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          obscureText: !isVisible,
          cursorColor: primaryColor,
          style: white14MediumTextStyle,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            hintText: 'Şifre',
            hintStyle: white14MediumTextStyle,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.lock_outline,
                color: whiteColor,
                size: 18,
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  isVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: whiteColor,
                  size: 15,
                ),
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
            ),
          ),
        ),
        heightSpace,
        Text(
          'Şifremi Unuttum',
          style: primaryColor12SemiBoldTextStyle,
        ),
      ],
    );
  }

  loginButton() {
    return InkWell(
      onTap: () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Giriş',
          style: white18BoldTextStyle,
        ),
      ),
    );
  }

  registerDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fullNameTextField(),
        heightSpace,
        heightSpace,
        emailTextField(),
        heightSpace,
        heightSpace,
        mobileNumberTextField(),
        heightSpace,
        heightSpace,
        pswTextField(),
        heightSpace,
        heightSpace,
        confirmPasswordTextField(),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        registerButton(),
      ],
    );
  }

  fullNameTextField() {
    return TextField(
      keyboardType: TextInputType.name,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'İsim',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.person_outline,
            color: whiteColor,
            size: 18,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  emailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'E Posta',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.email_outlined,
            color: whiteColor,
            size: 18,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  mobileNumberTextField() {
    return TextField(
      keyboardType: TextInputType.phone,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'Telefon No',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.call_outlined,
            color: whiteColor,
            size: 18,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  pswTextField() {
    return TextField(
      obscureText: !psw,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'Şifre',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.lock_outline,
            color: whiteColor,
            size: 18,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              psw = !psw;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              psw ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: whiteColor,
              size: 15,
            ),
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  confirmPasswordTextField() {
    return TextField(
      obscureText: !confirmPsw,
      cursorColor: primaryColor,
      style: white14MediumTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        hintText: 'Şifre Tekrar',
        hintStyle: white14MediumTextStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.lock_outline,
            color: whiteColor,
            size: 18,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              confirmPsw = !confirmPsw;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              confirmPsw
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: whiteColor,
              size: 15,
            ),
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2),
        ),
      ),
    );
  }

  registerButton() {
    return InkWell(
      onTap: () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Kayıt Ol',
          style: white18BoldTextStyle,
        ),
      ),
    );
  }

  otherOptions() {
    return Column(
      children: [
        Text(
          'Sosyal Hesaplar İle Giriş Yap',
          style: white14MediumTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(fixPadding * 1.2),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/facebook.png',
                        color: primaryColor,
                        height: 16,
                        width: 16,
                      ),
                      widthSpace,
                      widthSpace,
                      Text(
                        'Facebook',
                        style: white14MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(fixPadding * 1.2),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google.png',
                        color: primaryColor,
                        height: 16,
                        width: 16,
                      ),
                      widthSpace,
                      widthSpace,
                      Text(
                        'Google',
                        style: white14MediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
