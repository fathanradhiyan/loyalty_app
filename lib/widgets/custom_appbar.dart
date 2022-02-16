part of 'widget.dart';

AppBar CustomAppBar(String title) {
  return AppBar(
    backgroundColor: mainColor,
    elevation: 0,
    title: Text(
      title,
      style: whiteTextFont.copyWith(
          fontSize: 20, fontWeight: FontWeight.normal),
    ),
    centerTitle: true,
  );
}
