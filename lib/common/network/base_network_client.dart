import 'dart:convert';

import 'package:demo_app/common/models/data_context.dart';
import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/common/network/network_client_impl.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(NetworkClientImpl)
@injectable
abstract class BaseNetworkClient {
  Future<DataContext> get(String url, ResponseHandler responseHandler, {Map<String, String> headers});

  Future<DataContext> post(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding});

  Future<DataContext> put(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding});

  Future<DataContext> delete(String url, ResponseHandler responseHandler, {Map<String, String> headers});
}
