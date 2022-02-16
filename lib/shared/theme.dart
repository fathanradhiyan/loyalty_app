part of 'shared.dart';

const double defaultMargin = 24;
// Color accentColor2 = Color(0xFFF87000);
Color mainColor = Color(0xFF1A2C6A);
Color accentColor1 = Color(0xFFBBE2F3);
Color darkGrey = Color(0xFF333333);
Color lightGrey = Color(0xFF888888);
Color borderGrey = Color(0xFFDDDDDD);
Color greyBackground = Color(0xFFF3F5FF);
Color redColor = Color(0xFFF43434);
Color lineColor = Color(0xFFF4F4F4);
Color secondaryColor = Color(0xFFFBD623);
Color successColor = Color(0xFF00CA71);
Color statusOkColor = Color(0xFF1c8014);

Color colors1 = Color(0xFF107ADE);
Color colors2 = Color(0xFFBBE2F3);
Color colors3 = Color(0xFF1D31B4);
Color colors4 = Color(0xFF18315A);

TextStyle blueTextFont = GoogleFonts.montserrat()
    .copyWith(color: mainColor, fontWeight: FontWeight.w700);
TextStyle lightGreyTextFont = GoogleFonts.montserrat()
    .copyWith(color: lightGrey, fontWeight: FontWeight.normal);
TextStyle blackTextFont = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.normal);
TextStyle whiteTextFont = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w600);
TextStyle greyTextFont = GoogleFonts.montserrat()
    .copyWith(color: darkGrey, fontWeight: FontWeight.w600);
TextStyle redTextFont = GoogleFonts.montserrat()
    .copyWith(color: redColor, fontWeight: FontWeight.normal);

TextStyle whiteNumberFont =
GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle blackNumberFont =
GoogleFonts.openSans().copyWith(color: Colors.black);

TextStyle blackMenuFont = GoogleFonts.muli().copyWith(color: Colors.black);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

Map<int, Color> color =
{
  50:const Color.fromRGBO(136,14,79, .1),
  100:const Color.fromRGBO(136,14,79, .2),
  200:const Color.fromRGBO(136,14,79, .3),
  300:const Color.fromRGBO(136,14,79, .4),
  400:const Color.fromRGBO(136,14,79, .5),
  500:const Color.fromRGBO(136,14,79, .6),
  600:const Color.fromRGBO(136,14,79, .7),
  700:const Color.fromRGBO(136,14,79, .8),
  800:const Color.fromRGBO(136,14,79, .9),
  900:const Color.fromRGBO(136,14,79, 1),
};
