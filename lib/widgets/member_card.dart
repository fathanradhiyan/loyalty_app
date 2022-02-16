part of 'widget.dart';

class MemberCard extends StatefulWidget {
  final bool isMember;
  final num? point;
  final GestureTapCallback? onClick;

  const MemberCard({Key? key, required this.isMember, this.point, this.onClick})
      : super(key: key);

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var click = widget.onClick;
    User user = (context.read<UserCubit>().state as UserLoaded).user!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_12),
          color: secondaryColor,
        ),
        height: Sizes.dimen_150,
        child: Column(
          children: [
            Material(
              color: Colors.white.withOpacity(0.25),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Sizes.dimen_16),
                topRight: Radius.circular(Sizes.dimen_16),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(Sizes.dimen_16,
                    Sizes.dimen_10, Sizes.dimen_16, Sizes.dimen_10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      width: size.width * 0.25,
                      image: const AssetImage('assets/images/logo.png'),
                    ),
                    Text(
                      user.isMember != true ? 'Guest' : 'Membership',
                      style: greyTextFont.copyWith(fontSize: Sizes.dimen_12),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  Sizes.dimen_16, Sizes.dimen_2, Sizes.dimen_16, Sizes.dimen_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Point',
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
                      user.isMember != true
                          ? InkWell(
                              onTap: click,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.dimen_16),
                                    color: mainColor),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      Sizes.dimen_14,
                                      Sizes.dimen_8,
                                      Sizes.dimen_14,
                                      Sizes.dimen_8),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Join Member',
                                        style: whiteTextFont.copyWith(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(
                                        width: Sizes.dimen_12,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: Sizes.dimen_14,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Image.asset(
                              user.memberPoint! < 500
                                  ? 'assets/images/silver_member_chip.png'
                                  : user.memberPoint! < 1000
                                      ? 'assets/images/membership_chip.png'
                                      : 'assets/images/platinum_member_chip.png',
                              height: Sizes.dimen_32,
                            )
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
