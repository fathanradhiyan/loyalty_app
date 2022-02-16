part of 'widget.dart';

class SectionWidget extends StatefulWidget {
  final String sectionTitle;
  final Widget? child;
  final double? itemHeight;
  final Color? color;
  const SectionWidget({Key? key, required this.sectionTitle, this.itemHeight, this.color, this.child}) : super(key: key);

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.sectionTitle,
                  style: greyTextFont.copyWith(
                      fontWeight: FontWeight.w600, fontSize: Sizes.dimen_16),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      textAlign: TextAlign.end,
                      style: blueTextFont.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: Sizes.dimen_12),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: widget.itemHeight,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
