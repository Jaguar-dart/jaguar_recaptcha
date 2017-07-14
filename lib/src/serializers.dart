part of jaguar_recaptcha.src;

@DefineFieldProcessor()
class _TimestampSerializer implements FieldProcessor<DateTime, String> {
  final Symbol field;

  const _TimestampSerializer(this.field);

  @override
  String serialize(DateTime value) {
    final formatter = new DateFormat("yyyy-MM-ddTHH:mm:ssZZ");
    return formatter.format(value);
  }

  @override
  DateTime deserialize(String value) => DateTime.parse(value);
}

@DefineFieldProcessor()
class _ErrorSerializer
    implements FieldProcessor<List<RecaptchaError>, List<int>> {
  final Symbol field;

  const _ErrorSerializer(this.field);

  @override
  List<int> serialize(List<RecaptchaError> value) =>
      value.map((RecaptchaError v) => v.id).toList();

  @override
  List<RecaptchaError> deserialize(List<int> value) =>
      value.map((int v) => RecaptchaError.values[v]).toList();
}

final JsonRepo _repo = new JsonRepo(serializers: [
  RecaptchaResponse.serializer,
  RecaptchaAndroidResponse.serializer
]);

@GenSerializer()
@_TimestampSerializer(#timestamp)
@_ErrorSerializer(#errorCodes)
class RecaptchaResponseSerializer extends Serializer<RecaptchaResponse>
    with _$RecaptchaResponseSerializer {
  @override
  RecaptchaResponse createModel() => new RecaptchaResponse();
}

@GenSerializer()
@_TimestampSerializer(#timestamp)
@_ErrorSerializer(#errorCodes)
class RecaptchaAndroidResponseSerializer
    extends Serializer<RecaptchaAndroidResponse>
    with _$RecaptchaAndroidResponseSerializer {
  @override
  RecaptchaAndroidResponse createModel() => new RecaptchaAndroidResponse();
}