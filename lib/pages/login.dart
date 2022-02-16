part of 'pages.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();

  bool isPhoneValid = false;

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
          text: 'Lanjutkan',
          onClick: (phoneController.text.isNotEmpty)
              ? () => Get.to(Verification(
                    phoneNum: phoneController.text,
                  ))
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 1000),
                      backgroundColor: Colors.red,
                      content: Text('Isi nomor handphone dengan benar')));
                }),
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
                    'Masukkan nomor',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  Text(
                    'handphonemu untuk',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  Text(
                    'melanjutkan',
                    style: greyTextFont.copyWith(
                        fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.dimen_8,
            ),
            Text(
              'Kami akan mengirimkan kode OTP',
              style: lightGreyTextFont.copyWith(
                  fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: Sizes.dimen_24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nomor HP',
                  style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                inputPhoneBar()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inputPhoneBar() {
    return TextField(
      cursorColor: mainColor,
      style: greyTextFont.copyWith(
          fontSize: Sizes.dimen_16, fontWeight: FontWeight.w500),
      //autofocus: true,
      onChanged: (text) {
        setState(() {
          isPhoneValid = text.isNotEmpty;
        });
      },
      maxLength: 13,
      controller: phoneController,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(Sizes.dimen_12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(Sizes.dimen_12),
        ),
        hintText: "Masukkan nomor HP",
        hintStyle: GoogleFonts.lato(color: lightGrey),
        suffixIcon: (isPhoneValid
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPhoneValid = false;
                    phoneController.clear();
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: borderGrey,
                ))
            : null),
      ),
      keyboardType: TextInputType.number,
      //inputFormatters: [ThousandsFormatter()],
    );
  }
}
