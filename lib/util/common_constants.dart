abstract class CommonConstants {

  static const String FILTER_BY_SEARCH = 'bySearch';
  static const String FILTER_BY_TITLE = 'byTitle';

  /// http method
  static const String HTTP_METHOD_GET = "GET";
  static const String HTTP_METHOD_POST = "POST";
  static const String HTTP_METHOD_PUT = "PUT";
  static const String HTTP_METHOD_DELETE = "DELETE";
  static const String HTTP_METHOD_PATH = "PATCH";

  /// http header
  static const String HTTP_HEADER_CONTENT_TYPE_KEY = 'content-type';
  static const String HTTP_HEADER_JSON = "application/json";
  static const String HTTP_HEADER_FORM_ENCODED = "application/x-www-form-urlencoded";

  /// list API
  static const String MAIN_DOMAIN_BUCKET_MOVIE = 'www.omdbapi.com';
  static const String MAIN_DOMAIN_CACHE_MOVIE = 'https://demo-video-ws-chfmsoli4q-ew.a.run.app';
  static const String API_SEARCH_MOVIE = 'http://www.omdbapi.com/?apikey=b4fd0ced&s=Falling';
  static const String API_ADD_FAVORITE_MOVIE = '';

}