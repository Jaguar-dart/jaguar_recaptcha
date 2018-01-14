part of jaguar_recaptcha.src;

final JsonRepo _repo = new JsonRepo(serializers: [
  RecaptchaResponse.serializer,
  RecaptchaAndroidResponse.serializer
]);

@GenSerializer(fields: const {
  'timestamp': const EnDecode(
      alias: 'challenge_ts', processor: const _TimestampSerializer()),
  'errorCodes':
      const EnDecode(alias: 'error-codes', processor: const _ErrorSerializer()),
})
class RecaptchaResponseSerializer extends Serializer<RecaptchaResponse>
    with _$RecaptchaResponseSerializer {
  @override
  RecaptchaResponse createModel() => new RecaptchaResponse();
}

@GenSerializer(fields: const {
  'timestamp': const EnDecode(
      alias: 'challenge_ts', processor: const _TimestampSerializer()),
  'errorCodes':
      const EnDecode(alias: 'error-codes', processor: const _ErrorSerializer()),
})
class RecaptchaAndroidResponseSerializer
    extends Serializer<RecaptchaAndroidResponse>
    with _$RecaptchaAndroidResponseSerializer {
  @override
  RecaptchaAndroidResponse createModel() => new RecaptchaAndroidResponse();
}

class _TimestampSerializer implements FieldProcessor<DateTime, String> {
  const _TimestampSerializer();

  @override
  String serialize(DateTime value) {
    if (value == null) return null;
    return formatDate(
        value, [yyyy, '-', mm, '-', dd, 'T', HH, ':', nn, ':', ss, z]);
  }

  @override
  DateTime deserialize(String value) {
    if (value == null) return null;
    return DateTime.parse(value);
  }
}

class _ErrorSerializer
    implements FieldProcessor<List<RecaptchaError>, List<int>> {
  const _ErrorSerializer();

  @override
  List<int> serialize(List<RecaptchaError> value) {
    if (value == null) return null;
    return value.map((RecaptchaError v) => v.id).toList();
  }

  @override
  List<RecaptchaError> deserialize(List<int> value) {
    if (value == null) return null;
    return value.map((int v) => RecaptchaError.values[v]).toList();
  }
}
