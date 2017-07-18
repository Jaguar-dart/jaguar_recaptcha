// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library jaguar_recaptcha.src;

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:jaguar/jaguar.dart';
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

  Future<RecaptchaResponse> verify(String response, {String remoteIp}) async {
    final body = <String, String>{
      'secret': secret,
      'response': response,
    };
    if (remoteIp is String) body['remoteip'] = remoteIp;
    return await client.postForm(url, body: body, type: RecaptchaResponse);
  }
}

/// Verifies that requests are actually submitted by a human
class RecaptchaInterceptor extends Interceptor {
  /// reCAPTCHA secret
  final String secret;

  const RecaptchaInterceptor(this.secret);

  @override
  Future<Null> pre(Context ctx) async {
    if (ctx.req.headers['jaguar-recaptcha'] == null) {
      throw new UnAuthorizedError();
    }

    final String captchaResp = ctx.req.headers.value('jaguar-recaptcha');

    final verifier = new RecaptchaVerifier(new Client(), secret);

    final RecaptchaResponse val = await verifier.verify(captchaResp);
    if (!val.success) {
      throw new UnAuthorizedError();
    }
  }
}
