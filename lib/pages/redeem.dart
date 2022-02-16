part of 'pages.dart';

class Redeem extends StatefulWidget {
  final num memberPoint;
  const Redeem({Key? key, required this.memberPoint}) : super(key: key);

  @override
  _RedeemState createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: CustomAppBar('Redeem'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Sizes.dimen_16, 0, Sizes.dimen_16, 0),
            child: RedeemCard(point: widget.memberPoint,),
          ),
          body(size, context)
        ],
      ),
    );
  }

  Container body(Size size, BuildContext context) {
    List<dynamic> _redeemVoucher = [
      voucherRedeem('assets/images/voucher_1.png'),
      voucherRedeem('assets/images/voucher_2.png'),
      voucherRedeem('assets/images/voucher_3.png'),
      voucherRedeem('assets/images/voucher_2.png'),
      voucherRedeem('assets/images/voucher_1.png'),
    ];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: size.height * 0.20),
      padding: const EdgeInsets.all(Sizes.dimen_16),
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
            Text(
              'E-Voucher',
              style: greyTextFont.copyWith(
                  fontWeight: FontWeight.w600, fontSize: Sizes.dimen_16),
            ),
            const SizedBox(
              height: Sizes.dimen_12,
            ),
            ListView(
                shrinkWrap: true,
                primary: false,
                children: List.generate(_redeemVoucher.length, (index) {
                  return _redeemVoucher[index];
                })),
          ],
        ),
      ),
    );
  }

  Widget voucherRedeem(String value) {
    return Image.asset(value, fit: BoxFit.cover,);
  }
}
