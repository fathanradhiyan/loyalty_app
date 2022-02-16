part of 'pages.dart';

class History extends StatefulWidget {
  final num memberPoint;
  const History({Key? key, required this.memberPoint}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin{

  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: CustomAppBar('Riwayat'),
      body: Stack(
        children: [
          Padding(
            padding:
            const EdgeInsets.fromLTRB(Sizes.dimen_16, 0, Sizes.dimen_16, 0),
            child: RedeemCard(point: widget.memberPoint,),
          ),
          body(size, context)
        ],
      ),
    );
  }

  Container body(Size size, BuildContext context) {
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
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_12),
              color: lineColor
            ),
            child: TabBar(
              padding: const EdgeInsets.all(Sizes.dimen_4),
              unselectedLabelColor: lightGrey,
              indicator: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(Sizes.dimen_8),
              ),
              controller: _controller,
              tabs: [
                Tab(
                  child: Text('Redeem', style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: Sizes.dimen_14),),
                ),
                Tab(
                  child: Text('Belanja', style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: Sizes.dimen_14),),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.56,
            child: TabBarView(
              controller: _controller,
              children: const [
                HistoryRedeemTabScreen(),
                Center(child: Text('Riwayat Belanja'),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
