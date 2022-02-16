part of 'widget.dart';

class BottomButton extends StatefulWidget {
  final String text;
  final bool? loading;
  final GestureTapCallback? onClick;
  const BottomButton({Key? key, required this.text, this.loading = false, this.onClick}) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.loading!;
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: SizedBox(
            width: double.infinity,
            height: Sizes.dimen_48,
            child: ElevatedButton(
              onPressed: widget.onClick,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return secondaryColor;
                }),
              ),
              child: isLoading? loadingIndicator : Text(
                widget.text,
                style: greyTextFont.copyWith(fontSize: Sizes.dimen_14),
              ),
            ),
          ),
        ),
      );
  }
}
