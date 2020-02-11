import 'dart:convert';

import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/common/network/network_client_impl.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(NetworkClientImpl)
@injectable
abstract class BaseNetworkClient<T> {
  Future<T> get(String url, ResponseHandler responseHandler, {Map<String, String> headers});

  Future<T> post(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding});

  Future<T> put(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding});

  Future<T> delete(String url, ResponseHandler responseHandler, {Map<String, String> headers});
}
