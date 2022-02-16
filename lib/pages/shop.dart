part of 'pages.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController nominalController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<String>? shoppingType;
  String? selectedType;

  bool isNominalValid = false;
  bool isNoteValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shoppingType = ['Service', 'Ganti Ban'];
    selectedType = shoppingType![0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar('Belanja'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Sizes.dimen_16, Sizes.dimen_24, Sizes.dimen_16, Sizes.dimen_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nominal',
                  style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                inputNominalBar()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jenis',
                  style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Sizes.dimen_16),
                  height: Sizes.dimen_48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                    border: Border.all(color: borderGrey),
                  ),
                  child: DropdownButton(
                    value: selectedType!,
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: Text(
                      'Pilih jenis pembelian',
                      style: lightGreyTextFont.copyWith(
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.normal),
                    ),
                    items: shoppingType!
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: greyTextFont.copyWith(
                                  fontSize: Sizes.dimen_14,
                                  fontWeight: FontWeight.w500),
                            )))
                        .toList(),
                    onChanged: (dynamic item) {
                      setState(() {
                        selectedType = item;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keterangan',
                  style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                inputNoteBar(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomButton(
        text: 'Simpan',
        onClick: () => Get.to(ShopConfirmation(price: NumberFormat().parse(nominalController.text),)),
      ),
    );
  }

  Widget inputNominalBar() {
    return TextField(
      cursorColor: mainColor,
      style: greyTextFont.copyWith(
          fontSize: Sizes.dimen_16, fontWeight: FontWeight.w500),
      //autofocus: true,
      onChanged: (text) {
        setState(() {
          isNominalValid = text.isNotEmpty;
        });
      },
      maxLength: 25,
      controller: nominalController,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
        ),
        prefixText: 'Rp ',
        prefixStyle: greyTextFont.copyWith(
            fontSize: Sizes.dimen_16, fontWeight: FontWeight.w500),
        hintText: "Masukkan Nominal",
        hintStyle: GoogleFonts.lato(color: lightGrey),
        suffixIcon: (isNominalValid
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isNominalValid = false;
                    nominalController.clear();
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: borderGrey,
                ))
            : null),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [ThousandsFormatter()],
    );
  }

  Widget inputNoteBar() {
    return TextField(
      cursorColor: mainColor,
      style: greyTextFont.copyWith(
          fontSize: Sizes.dimen_16, fontWeight: FontWeight.w500),
      //autofocus: true,
      onChanged: (text) {
        setState(() {
          isNoteValid = text.isNotEmpty;
        });
      },
      maxLength: 300,
      maxLines: 5,
      controller: noteController,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderGrey, width: Sizes.dimen_1),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Keterangan... ",
        hintStyle: GoogleFonts.lato(color: lightGrey),
        suffixIcon: (isNoteValid
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isNoteValid = false;
                    noteController.clear();
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: borderGrey,
                ))
            : null),
      ),
      keyboardType: TextInputType.text,
      //inputFormatters: NumberFormat,
      // <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
      // ],
    );
  }
}
