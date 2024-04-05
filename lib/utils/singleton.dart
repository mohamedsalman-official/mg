class FlashSingleton {
  Map<String, dynamic>? errorMapValues;
  String? bearerToken;
  String? id;

  static final FlashSingleton _singleton = new FlashSingleton._internal();

  FlashSingleton._internal();

  static FlashSingleton get instance => _singleton;
}
