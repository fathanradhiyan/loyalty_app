part of 'pages.dart';

class HistoryRedeemTabScreen extends StatelessWidget {
  const HistoryRedeemTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> _redeemHistory = [
      const HistoryCard(
        icon: 'assets/icons/voucher.png',
        title: 'Voucher 50%',
        date: '29 April 2022',
        point: 1500,
      ),
      const HistoryCard(
        icon: 'assets/icons/voucher.png',
        title: 'Voucher 20%',
        date: '29 Januari 2022',
        point: 500,
      ),
      const HistoryCard(
        icon: 'assets/icons/service.png',
        title: 'Service Rutin Gratis',
        date: '29 April 2022',
        point: 2000,
      ),
      const HistoryCard(
        icon: 'assets/icons/wheel.png',
        title: 'Ganti Ban Gratis',
        date: '29 April 2022',
        point: 1500,
      ),
      const HistoryCard(
        icon: 'assets/icons/voucher.png',
        title: 'Voucher 100%',
        date: '24 Februari 2022',
        point: 1500,
      ),
      const HistoryCard(
        icon: 'assets/icons/voucher.png',
        title: 'Voucher 50%',
        date: '2 April 2022',
        point: 1500,
      ),
    ];

    return ListView(
        children: List.generate(_redeemHistory.length, (index) {
      return _redeemHistory[index];
    }));
  }
}
