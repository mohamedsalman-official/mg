class FlashSingleton {
  Map<String, dynamic>? errorMapValues;
  String? bearerToken;
  int? id;

  static final FlashSingleton _singleton = new FlashSingleton._internal();

  FlashSingleton._internal();

  static FlashSingleton get instance => _singleton;
}
