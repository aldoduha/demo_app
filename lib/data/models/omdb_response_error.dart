import 'package:demo_app/common/models/data_context.dart';

class OMDBResponseError extends DataContext {
  static const String FIELD_RESPONSE = 'Response';
  static const String FIELD_ERROR = 'Error';

  final String responseFlag;
  final String errorMessage;

  OMDBResponseError({this.responseFlag, this.errorMessage});

  OMDBResponseError.fromJson(Map<String, dynamic> json)
      : responseFlag = json[FIELD_RESPONSE],
        errorMessage = json[FIELD_ERROR];

}