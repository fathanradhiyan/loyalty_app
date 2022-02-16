part of 'pages.dart';

class Verification extends StatefulWidget {
  final String phoneNum;

  const Verification({Key? key, required this.phoneNum}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  bool isLoading = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message, Color? bgColor) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!, style: whiteTextFont.copyWith(fontSize: Sizes.dimen_12),),
        backgroundColor: bgColor,
        duration: Duration(seconds: 2),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    Sizes.dimen_16, Sizes.dimen_96, Sizes.dimen_16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selamat datang di',
                        style: whiteTextFont.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: Sizes.dimen_16,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: Sizes.dimen_8,
                    ),
                    Text('Paramita Loyalty',
                        style: whiteTextFont.copyWith(
                            letterSpacing: Sizes.dimen_1,
                            fontSize: Sizes.dimen_24,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: Sizes.dimen_32,
                    ),
                  ],
                ),
              ),
              body(size, context)
            ],
          ),
        ),
      ),
      bottomSheet: BottomButton(
        loading: isLoading,
        text: 'Lanjutkan',
        onClick: () async{
          formKey.currentState!.validate();
          // conditions for validating
          if (currentText.length != 4 || currentText != "1111") {
            errorController!.add(
                ErrorAnimationType.shake); // Triggering error shake animation
            setState((){
              hasError = true;
              snackBar('Wrong OTP', Colors.redAccent);
            });
          } else {
            setState (
              () {
                isLoading = true;
                hasError = false;
                snackBar("OTP Verified!!", Colors.greenAccent);
              },
            );
            await context.read<UserCubit>().signIn(widget.phoneNum, currentText);
            UserState state = context.read<UserCubit>().state;

            if(state is UserLoaded){
              Get.offAll(() => Home());
            }
          }
        },
      ),
    );
  }

  Container body(Size size, BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.70,
      padding: const EdgeInsets.fromLTRB(
          Sizes.dimen_16, Sizes.dimen_24, Sizes.dimen_16, Sizes.dimen_8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultMargin),
            topRight: Radius.circular(defaultMargin),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masukkan kode yang telah',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  Text(
                    'dikirim ke nomor',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  Text(
                    'handphonemu',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.dimen_8,
            ),
            RichText(
              text: TextSpan(
                  text: "Kami mengirimnya ke nomor ",
                  children: [
                    TextSpan(
                      text: widget.phoneNum,
                      style: blackTextFont.copyWith(
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                  style: lightGreyTextFont.copyWith(
                      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.dimen_24,
            ),

            ///pin form
            Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
                  child: PinCodeTextField(
                    autoFocus: true,
                    textStyle: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_32, fontWeight: FontWeight.w500),
                    appContext: context,
                    pastedTextStyle: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_32, fontWeight: FontWeight.w500),
                    length: 4,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      fieldOuterPadding:
                          EdgeInsets.symmetric(horizontal: Sizes.dimen_10),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(Sizes.dimen_10),
                      fieldHeight: Sizes.dimen_64,
                      fieldWidth: Sizes.dimen_56,
                      activeColor: secondaryColor,
                      selectedColor: secondaryColor,
                      inactiveColor: borderGrey,
                    ),
                    cursorColor: mainColor,
                    animationDuration: Duration(milliseconds: 300),
                    //enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tidak menerima kode OTP?",
                    style: lightGreyTextFont.copyWith(
                        fontSize: Sizes.dimen_12, fontWeight: FontWeight.w400)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        textEditingController.clear();
                      });
                      snackBar("OTP resend!!", mainColor);
                    },
                    child: Text("Kirim ulang",
                        style: lightGreyTextFont.copyWith(
                            color: mainColor,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w600)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
