// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar_recaptcha.src;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class RecaptchaResponseSerializer
// **************************************************************************

abstract class _$RecaptchaResponseSerializer
    implements Serializer<RecaptchaResponse> {
  final _TimestampSerializer timestamp_TimestampSerializer =
      const _TimestampSerializer();
  final _ErrorSerializer errorCodes_ErrorSerializer = const _ErrorSerializer();

  Map toMap(RecaptchaResponse model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.success != null) {
        ret["success"] = model.success;
      }
      if (model.timestamp != null) {
        ret["challenge_ts"] =
            timestamp_TimestampSerializer.serialize(model.timestamp);
      }
      if (model.hostname != null) {
        ret["hostname"] = model.hostname;
      }
      if (model.errorCodes != null) {
        ret["error-codes"] =
            errorCodes_ErrorSerializer.serialize(model.errorCodes);
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  RecaptchaResponse fromMap(Map map,
      {RecaptchaResponse model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! RecaptchaResponse) {
      model = createModel();
    }
    model.success = map["success"];
    model.timestamp =
        timestamp_TimestampSerializer.deserialize(map["challenge_ts"]);
    model.hostname = map["hostname"];
    model.errorCodes =
        errorCodes_ErrorSerializer.deserialize(map["error-codes"]);
    return model;
  }

  String modelString() => "RecaptchaResponse";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class RecaptchaAndroidResponseSerializer
// **************************************************************************

abstract class _$RecaptchaAndroidResponseSerializer
    implements Serializer<RecaptchaAndroidResponse> {
  final _TimestampSerializer timestamp_TimestampSerializer =
      const _TimestampSerializer();
  final _ErrorSerializer errorCodes_ErrorSerializer = const _ErrorSerializer();

  Map toMap(RecaptchaAndroidResponse model,
      {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.success != null) {
        ret["success"] = model.success;
      }
      if (model.timestamp != null) {
        ret["challenge_ts"] =
            timestamp_TimestampSerializer.serialize(model.timestamp);
      }
      if (model.apkPackageName != null) {
        ret["apkPackageName"] = model.apkPackageName;
      }
      if (model.errorCodes != null) {
        ret["error-codes"] =
            errorCodes_ErrorSerializer.serialize(model.errorCodes);
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  RecaptchaAndroidResponse fromMap(Map map,
      {RecaptchaAndroidResponse model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! RecaptchaAndroidResponse) {
      model = createModel();
    }
    model.success = map["success"];
    model.timestamp =
        timestamp_TimestampSerializer.deserialize(map["challenge_ts"]);
    model.apkPackageName = map["apkPackageName"];
    model.errorCodes =
        errorCodes_ErrorSerializer.deserialize(map["error-codes"]);
    return model;
  }

  String modelString() => "RecaptchaAndroidResponse";
}
