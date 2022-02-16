part of 'service.dart';

class ShoppingServices {
  static Future<ApiReturnValue> getShopping() async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockShopping);
  }

  static Future<ApiReturnValue> submitShopping() async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockShopping);
  }
}