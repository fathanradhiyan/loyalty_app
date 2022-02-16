part of 'widget.dart';

class ExpansionListWidget extends StatefulWidget {
  final String? imgUrl;
  bool? expanded;
  final String? rate;
  final List<String>? benefits;

  ExpansionListWidget(
      {Key? key, this.imgUrl, this.expanded, this.rate, this.benefits})
      : super(key: key);

  @override
  State<ExpansionListWidget> createState() => _ExpansionListWidgetState();
}

class _ExpansionListWidgetState extends State<ExpansionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(Sizes.dimen_16, Sizes.dimen_16, Sizes.dimen_16, 0),
      margin: const EdgeInsets.only(bottom: Sizes.dimen_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          border: Border.all(color: borderGrey),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.imgUrl!,
                height: Sizes.dimen_32,
              ),
              Text(
                widget.rate!,
                style: greyTextFont.copyWith(
                    fontSize: Sizes.dimen_14, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: Sizes.dimen_10),
            child: Divider(
              color: borderGrey,
              thickness: Sizes.dimen_1,
            ),
          ),
          ExpansionPanelList(
            animationDuration: const Duration(milliseconds: 1000),
            elevation: 0,
            expandedHeaderPadding:
                const EdgeInsets.symmetric(vertical: Sizes.dimen_1),
            children: [
              ExpansionPanel(
                //backgroundColor: Colors.blue,
                body: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: widget.benefits!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0, 0, Sizes.dimen_16, Sizes.dimen_10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/green_check.png',
                              height: 13,
                              width: 13,
                            ),
                            const SizedBox(
                              width: Sizes.dimen_10,
                            ),
                            Text(
                              widget.benefits![index],
                              style: greyTextFont.copyWith(
                                  fontSize: Sizes.dimen_12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    }),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Keuntungan',
                        style: greyTextFont.copyWith(
                          fontSize: Sizes.dimen_14,
                        )),
                  );
                },
                isExpanded: widget.expanded!,
              )
            ],
            expansionCallback: (int item, bool status) {
              setState(() {
                widget.expanded = !widget.expanded!;
              });
            },
          ),
        ],
      ),
    );
  }
}
