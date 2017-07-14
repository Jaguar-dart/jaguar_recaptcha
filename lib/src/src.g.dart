// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar_recaptcha.src;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class RecaptchaResponseSerializer
// **************************************************************************

abstract class _$RecaptchaResponseSerializer
    implements Serializer<RecaptchaResponse> {
  final _TimestampSerializer timestamp_TimestampSerializer =
      const _TimestampSerializer(#timestamp);
  final _ErrorSerializer errorCodes_ErrorSerializer =
      const _ErrorSerializer(#errorCodes);

  Map toMap(RecaptchaResponse model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.success != null) {
        ret["success"] = model.success;
      }
      if (model.timestamp != null) {
        ret["timestamp"] =
            timestamp_TimestampSerializer.serialize(model.timestamp);
      }
      if (model.hostname != null) {
        ret["hostname"] = model.hostname;
      }
      if (model.errorCodes != null) {
        ret["errorCodes"] =
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
        timestamp_TimestampSerializer.deserialize(map["timestamp"]);
    model.hostname = map["hostname"];
    model.errorCodes =
        errorCodes_ErrorSerializer.deserialize(map["errorCodes"]);
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
      const _TimestampSerializer(#timestamp);
  final _ErrorSerializer errorCodes_ErrorSerializer =
      const _ErrorSerializer(#errorCodes);

  Map toMap(RecaptchaAndroidResponse model,
      {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.success != null) {
        ret["success"] = model.success;
      }
      if (model.timestamp != null) {
        ret["timestamp"] =
            timestamp_TimestampSerializer.serialize(model.timestamp);
      }
      if (model.apkPackageName != null) {
        ret["apkPackageName"] = model.apkPackageName;
      }
      if (model.errorCodes != null) {
        ret["errorCodes"] =
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
        timestamp_TimestampSerializer.deserialize(map["timestamp"]);
    model.apkPackageName = map["apkPackageName"];
    model.errorCodes =
        errorCodes_ErrorSerializer.deserialize(map["errorCodes"]);
    return model;
  }

  String modelString() => "RecaptchaAndroidResponse";
}
