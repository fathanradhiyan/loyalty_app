part of 'model.dart';

class Membership {
  final String? rating;
  final String? memberLogo;
  bool? isExpanded;
  final List<String>? benefits;

  Membership(
      {this.rating, this.memberLogo, this.isExpanded = false, this.benefits});
}

List<Membership> membership = [
  Membership(
      rating: '0-500 point',
      memberLogo: 'assets/images/silver_member_chip.png',
      benefits: [
        'Benefit 1 Macho',
        'Benefit 2 Keche',
        'Benefit 3 Gokil',
      ]),
  Membership(
      rating: '500-1000 point',
      memberLogo: 'assets/images/membership_chip.png',
      benefits: [
        'Benefit 1',
        'Benefit 2',
        'Benefit 3',
      ]),
  Membership(
      rating: '> 1000 point',
      memberLogo: 'assets/images/platinum_member_chip.png',
      benefits: [
        'Benefit 1',
        'Benefit 2',
        'Benefit 3',
      ]),
];

List<String> termCondition = [
  'Iman kepada Allah',
  'Iman kepada Malaikat',
  'Iman kepada Kitab',
  'Iman kepada Nabi & Rasul',
  'Iman kepada Hari Kiamat',
  'Iman kepada Qada & Qadar',
];
