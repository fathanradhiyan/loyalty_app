part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _brandImages = [
    'assets/images/promo_banner.png',
    'assets/images/promo_banner.png',
    'assets/images/promo_banner.png',
  ];

  final List _voucher = [
    'assets/images/voucher_yellow.png',
    'assets/images/voucher_yellow.png',
  ];

  // num memberPoint = 4000;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    User user = (context.read<UserCubit>().state as UserLoaded).user!;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: Sizes.dimen_18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo ${user.firstName} ${user.lastName}',
                    style: whiteTextFont.copyWith(fontSize: Sizes.dimen_20),
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  Text(
                    'Selamat Datang di Paramita Loyalty',
                    style: whiteTextFont.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                        fontSize: Sizes.dimen_12),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: lineColor,
                backgroundImage: AssetImage(user.profileImg!),
              )
            ],
          ),
        ),
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                child: MemberCard(
                  onClick: () {
                    Get.to(const JoinMember());
                  },
                  isMember: user.isMember!,
                  point: user.memberPoint,
                ),
              ),
              body(size, context)
            ],
          ),
        ),
      ),
    );
  }

  Container body(Size size, BuildContext context) {
    User user = (context.read<UserCubit>().state as UserLoaded).user!;
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.only(top: size.height * 0.35),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultMargin),
            topRight: Radius.circular(defaultMargin),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.dimen_16),
            child: Row(
              children: [
                HomeMainMenu(
                    onClick: () => Get.to(Redeem(
                          memberPoint: user.memberPoint!,
                        )),
                    imgUrl: 'assets/icons/gift.png',
                    title: 'Redeem'),
                const Spacer(),
                HomeMainMenu(
                    onClick: () => Get.to(const Shop()),
                    imgUrl: 'assets/icons/qr_code.png',
                    title: 'Belanja'),
                const Spacer(),
                HomeMainMenu(
                  onClick: () => Get.to(History(
                    memberPoint: user.memberPoint!,
                  )),
                  imgUrl: 'assets/icons/history.png',
                  title: 'Riwayat',
                ),
              ],
            ),
          ),
          SectionWidget(
            sectionTitle: 'Promo',
            itemHeight: Sizes.dimen_120,
            child: Swiper(
              itemCount: _brandImages.length,
              autoplay: true,
              viewportFraction: 0.8,
              scale: 0.9,
              onTap: (index) {},
              itemBuilder: (BuildContext ctx, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_12),
                  child: Image.asset(
                    _brandImages[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: Sizes.dimen_16,
          ),
          SectionWidget(
            sectionTitle: 'E-Voucher',
            color: greyBackground,
            itemHeight: Sizes.dimen_160,
            child: Swiper(
              itemCount: _voucher.length,
              viewportFraction: 0.8,
              scale: 0.5,
              onTap: (index) {},
              itemBuilder: (BuildContext ctx, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_12),
                  child: Image.asset(
                    _voucher[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
