part of 'widget.dart';

class HistoryCard extends StatefulWidget {
  final String icon, date, title;
  final double point;
  const HistoryCard({Key? key, required this.icon, required this.date, required this.title, required this.point}) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: Sizes.dimen_12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: Sizes.dimen_48,
                  height: Sizes.dimen_48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.dimen_12),
                    color: mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.dimen_12),
                    child: Image.asset(
                      widget.icon,
                      height: Sizes.dimen_4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: Sizes.dimen_12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                    ),
                    const SizedBox(height: Sizes.dimen_4),
                    Text(
                      widget.date,
                      style: lightGreyTextFont.copyWith(fontSize: Sizes.dimen_12),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  '- ${widget.point.toInt()}pt',
                  style: redTextFont.copyWith(
                      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(height: Sizes.dimen_12,),
            Divider(color: lineColor, thickness: Sizes.dimen_1,)
          ],
        ),
      ),
    );
  }
}
