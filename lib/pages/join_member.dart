part of 'pages.dart';

class JoinMember extends StatefulWidget {
  const JoinMember({Key? key}) : super(key: key);

  @override
  State<JoinMember> createState() => _JoinMemberState();
}

class _JoinMemberState extends State<JoinMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar('Join Member'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              Sizes.dimen_16, Sizes.dimen_24, Sizes.dimen_16, Sizes.dimen_24),
          child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_16),
                      ),
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: membership.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ExpansionListWidget(
                              imgUrl: membership[index].memberLogo,
                              rate: membership[index].rating,
                              benefits: membership[index].benefits,
                              expanded: membership[index].isExpanded,
                            );
                          })),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Sizes.dimen_12),
                    child: Text(
                      'Syarat & Ketentuan',
                      style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                    ),
                  ),
                  ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: List.generate(termCondition.length, (index) {
                      return Text(
                        '  - ${termCondition[index]}',
                        style: greyTextFont.copyWith(
                            fontSize: Sizes.dimen_14,
                            fontWeight: FontWeight.w400),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: Sizes.dimen_80,
                  )
                ],
              )),
        ),
      ),
      bottomSheet: const BottomButton(text: 'Join Member',),
    );
  }
}
