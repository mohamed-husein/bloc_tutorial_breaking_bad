class ApiPaths {
  static const String baseUrl = 'https://www.breakingbadapi.com/api/';
  static const String charactersPath = 'characters';
  static String charactersDetailsPath(charId) => 'characters/$charId';
}
