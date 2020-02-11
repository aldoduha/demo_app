import 'dart:convert';
import 'dart:io';

import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/common/network/base_network_client.dart';
import 'package:demo_app/common/models/data_context.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class NetworkClientImpl implements BaseNetworkClient<DataContext> {
  final http.Client _client;

  NetworkClientImpl.init(this._client);

  @override
  Future<DataContext> delete(String url, ResponseHandler responseHandler, {Map<String, String> headers}) async {
    final request = () async => _client.delete(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers));

    return _handleResponse(responseHandler,
        request: request, url: url, httpResponse: await request());
  }

  @override
  Future<DataContext> get(url, ResponseHandler responseHandler, {Map<String, String> headers}) async {
    final uri = Uri.encodeFull(url);
    final request =
        () async => _client.get(uri, headers: await _addServiceHeaders(headers));

    return _handleResponse(
      responseHandler,
      request: request,
      url: url,
      httpResponse: await request(),
    );
  }

  @override
  Future<DataContext> post(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding}) async {
    final request = () async => _client.post(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers),
        body: body,
        encoding: encoding);
    return _handleResponse(
      responseHandler,
      request: request,
      url: url,
      httpResponse: await request(),
      requestBody: body,
    );
  }

  @override
  Future<DataContext> put(String url, ResponseHandler responseHandler, {Map<String, String> headers, body, Encoding encoding}) async {
    final request = () async => _client.put(Uri.encodeFull(url),
        headers: await _addServiceHeaders(headers),
        body: body,
        encoding: encoding);

    return _handleResponse(
      responseHandler,
      request: request,
      url: url,
      httpResponse: await request(),
      requestBody: body,
    );
  }

  DataContext _handleResponse(ResponseHandler responseHandler,
      {@required http.Response httpResponse,
      @required request,
      String url,
      requestBody}) {
    print('Execute Response Data OMDB');
    return responseHandler.doTransform(json.decode(httpResponse.body));
  }

  Future<Map<String, String>> _addServiceHeaders(
      Map<String, String> headers) async {
//    final String token = await _getAuthorizationToken();
    final String token = '';
    final Map<String, String> resultHeaders = Map();
    if (token != null) {
      resultHeaders[HttpHeaders.authorizationHeader] = token;
    }
    if (headers != null) {
      resultHeaders.addAll(headers);
    }
    return resultHeaders;
  }
}
