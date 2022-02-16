part of 'widget.dart';

class RedeemCard extends StatefulWidget {
  final num point;
  const RedeemCard({Key? key, required this.point}) : super(key: key);

  @override
  _RedeemCardState createState() => _RedeemCardState();
}

class _RedeemCardState extends State<RedeemCard> {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_12),
          color: secondaryColor,
        ),
        height: Sizes.dimen_100,
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  Sizes.dimen_16, Sizes.dimen_2, Sizes.dimen_16, Sizes.dimen_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balanced Point',
                    style: greyTextFont.copyWith(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat().format(widget.point),
                        style: blueTextFont.copyWith(fontSize: 32),
                      ),
                      Image.asset('assets/images/membership_chip.png', height: Sizes.dimen_32,)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

