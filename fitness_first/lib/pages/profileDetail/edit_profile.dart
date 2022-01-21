import 'package:fitness_first/pages/screens.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key key}) : super(key: key);

  final nameController = TextEditingController(text: 'Samantha John');
  final emailController =
      TextEditingController(text: 'johnsamantha@gmail.come');
  final phoneNumberController = TextEditingController(text: '1234567890');
  final passwordController = TextEditingController(text: 'Samantha John');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Edit',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          profileImage(context),
          nameTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          emailTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          phoneNumberTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          passwordTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            children: [
              doneButton(context),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              cancelButton(context),
            ],
          ),
        ],
      ),
    );
  }

  profileImage(context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Hero(
              tag: 'profilePic',
              child: Container(
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/trainer/trainer2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 200,
          child: InkWell(
            onTap: () => changeProfilePick(context),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: whiteColor,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeProfilePick(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: whiteColor,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Choose Option',
                      textAlign: TextAlign.center,
                      style: black16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.camera_alt,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Camera',
                            style: black16MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.photo_library,
                            color: blackColor,
                            size: 18.0,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Select from gallery',
                            style: black16MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: grey13MediumTextStyle,
        ),
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: fixPadding / 2,
              bottom: fixPadding,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  emailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: grey13MediumTextStyle,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: fixPadding / 2,
              bottom: fixPadding,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  phoneNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: grey13MediumTextStyle,
        ),
        TextField(
          controller: phoneNumberController,
          keyboardType: TextInputType.phone,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: fixPadding / 2,
              bottom: fixPadding,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: grey13MediumTextStyle,
        ),
        TextField(
          obscureText: true,
          controller: passwordController,
          cursorColor: primaryColor,
          style: black14MediumTextStyle,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(
              top: fixPadding / 2,
              bottom: fixPadding,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  doneButton(context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'Done',
            style: white18BoldTextStyle,
          ),
        ),
      ),
    );
  }

  cancelButton(context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'Cancel',
            style: primaryColor18BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
