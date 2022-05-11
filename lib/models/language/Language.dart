class Language {
  /// the country code (IT,AF..)
  String? _code;

  /// the locale (en, es, da)
  String? _locale;

  /// the full name of language (English, Danish..)
  String? _language;

  /// map of keys used based on industry type (service worker, route etc)
  Map<String, String>? _dictionary;

  Language({
    required String? code,
    required String? locale,
    required String? language,
    required Map<String, String>? dictionary,
  })  : _code = code,
        _locale = locale,
        _language = language,
        _dictionary = dictionary;

  String? get code => _code;

  Map<String, String>? get dictionary => _dictionary;

  String? get language => _language;

  String? get locale => _locale;
}
