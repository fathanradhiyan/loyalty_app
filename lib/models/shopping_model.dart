part of 'model.dart';


enum ShoppingType { Service, GantiBan }

class ShoppingModel extends Equatable {
  final int? id;
  final num? nominal;
  final List<ShoppingType>? types;
  final DateTime? dateTime;
  final User? user;
  final String? note;

  ShoppingModel({this.id, this.nominal, this.types = const[], this.dateTime, this.user, this.note});

  @override
  // TODO: implement props
  List<Object?> get props => [id, nominal, types, dateTime, user, note];
}

List<ShoppingModel> mockShopping = [
  ShoppingModel(
    id: 1,
    types: [ShoppingType.Service],
    user: mockUsers,
    dateTime: DateTime.now(),
    note: 'cek',
    nominal: 5000000,
  ),
  ShoppingModel(
    id: 2,
    types: [ShoppingType.GantiBan],
    user: mockUsers,
    dateTime: DateTime.now(),
    note: 'cek2',
    nominal: 4000000,
  ),
];