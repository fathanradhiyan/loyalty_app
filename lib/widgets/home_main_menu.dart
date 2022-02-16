part of 'widget.dart';

class HomeMainMenu extends StatefulWidget {
  final String imgUrl;
  final String title;
  final GestureTapCallback? onClick;

  const HomeMainMenu({Key? key, required this.imgUrl, required this.title, this.onClick})
      : super(key: key);

  @override
  State<HomeMainMenu> createState() => _HomeMainMenuState();
}

class _HomeMainMenuState extends State<HomeMainMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
          width: Sizes.dimen_100,
          height: Sizes.dimen_96,
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(Sizes.dimen_12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  secondaryColor,
                  BlendMode.srcATop,
                ),
                child: Image(
                  height: Sizes.dimen_30,
                  image: AssetImage(widget.imgUrl),
                ),
              ),
              const SizedBox(
                height: Sizes.dimen_10,
              ),
              Text(widget.title,
                  textAlign: TextAlign.center,
                  style: whiteTextFont.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 12)),
            ],
          )),
    );
  }
}
