part of 'service.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String phoneNum, String pin) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockUsers);
  }
}