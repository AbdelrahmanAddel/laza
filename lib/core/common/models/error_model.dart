class ErrorModel {
  final String? message;
  final int? statusCode;
  final Map<String, List<String>>? errors;
  final String? type;
  final String? title;
  final String? detail;
  final String? instance;
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('errors')) {
      final errors = (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List).map((error) => error.toString()).toList(),
        ),
      );

      return ErrorModel(
        message: json['message'],
        statusCode: json['statusCode'],
        errors: errors,
      );
    }
    return ErrorModel(
      type: json['type'],
      title: json['title'],
      detail: json['detail'],
      instance: json['instance'],
    );
  }
  String getReadableMessage() {
    if (errors != null && errors!.isNotEmpty) {
      final allErrors = errors!.entries
          .map((e) => '${e.key}: ${e.value.join(", ")}')
          .join(" | ");
      return allErrors;
    }
    return message ?? detail ?? title ?? "Unknown error occurred";
  }

  ErrorModel({
    this.message,
    this.statusCode,
    this.errors,
    this.type,
    this.title,
    this.detail,
    this.instance,
  });
}
