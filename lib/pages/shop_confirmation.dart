part of 'pages.dart';

class ShopConfirmation extends StatefulWidget {
  final num? price;
  const ShopConfirmation({Key? key, this.price}) : super(key: key);

  @override
  _ShopConfirmationState createState() => _ShopConfirmationState();
}

class _ShopConfirmationState extends State<ShopConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Konfirmasi Belanja',),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(Sizes.dimen_16, Sizes.dimen_24, Sizes.dimen_16, Sizes.dimen_24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ringkasan Belanja', style: greyTextFont.copyWith(fontSize: Sizes.dimen_16),),
            const SizedBox(height: Sizes.dimen_16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Harga', style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400),),
                Text(NumberFormat.currency(
                    symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                    .format(widget.price), style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400),),
              ],
            ),
            const SizedBox(height: Sizes.dimen_16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Voucher', style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400),),
                Text(NumberFormat.currency(
                    symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                    .format(widget.price), style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400),),
              ],
            ),
            const SizedBox(height: Sizes.dimen_24,),
            Divider(color: borderGrey, thickness: Sizes.dimen_1,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Pembayaran', style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),),
                  Text(NumberFormat.currency(
                      symbol: 'Rp ', decimalDigits: 0, locale: 'id-ID')
                      .format(widget.price), style: blueTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            Divider(color: borderGrey, thickness: Sizes.dimen_1,),
            Padding(
              padding: const EdgeInsets.only(top: Sizes.dimen_24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kamu mendapatkan point', style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.normal),),
                  Text('+100', style: blueTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            const SizedBox(height: Sizes.dimen_40,),
            Container(
              padding: const EdgeInsets.fromLTRB(Sizes.dimen_60, Sizes.dimen_12, Sizes.dimen_60, Sizes.dimen_12,),
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: BorderRadius.circular(Sizes.dimen_10)
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent

                    children: <TextSpan>[
                      TextSpan(text: 'Kode Transaksi ', style: greyTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
                      TextSpan(text: 'PB93272042', style: greyTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                )
                //Text('Test', style: greyTextFont.copyWith(fontSize: Sizes.dimen_14, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
      bottomSheet: const BottomButton(text: 'Proses',),
    );
  }
}
