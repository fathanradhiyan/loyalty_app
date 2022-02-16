part of 'model.dart';

class User extends Equatable {
  final int? id;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final bool? isMember;
  final String? address;
  final double? memberPoint;
  final String? profileImg;

  User(
      {this.id,
      this.phoneNumber,
      this.address,
      this.firstName,
      this.lastName,
      this.isMember,
      this.memberPoint,
      this.profileImg});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        phoneNumber,
        address,
        firstName,
        lastName,
        isMember,
        memberPoint,
        profileImg
      ];
}

User mockUsers = User(
    id: 1,
    phoneNumber: '081234567890',
    address: 'New World',
    firstName: 'Akagami',
    lastName: 'Shanks',
    isMember: true,
    memberPoint: 20,
    profileImg: 'assets/images/shanks.jpeg');
