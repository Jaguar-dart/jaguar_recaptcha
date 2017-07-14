// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library jaguar_recaptcha.src;

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:jaguar_client/jaguar_client.dart';
import 'package:jaguar_serializer/serializer.dart';

part 'src.g.dart';

part 'response_models.dart';
part 'serializers.dart';

class RecaptchaVerifier {
  /// reCAPTCHA secret
  final String secret;

  final SerializedJsonClient client;

  RecaptchaVerifier(Client client, this.secret)
      : client = new JsonClient(client, repo: _repo).serialized();

  static const String url = 'https://www.google.com/recaptcha/api/siteverify';

  Future verify(String response, {String remoteIp}) async {
    final body = <String, String>{
      'secret': secret,
      'response': response,
    };
    if (remoteIp is String) body['remoteip'] = remoteIp;
    await client.postForm(url, body: body);
  }
}
