class ErrorModel {
  final String? type;
  final String? title;
  final int? status;
  final String? detail;
  final String? instance;

  ErrorModel({
    required this.type,
    required this.title,
    required this.status,
    required this.detail,
    required this.instance,
  });
  
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      type: json['type'],
      title: json['title'],
      status: json['status'],
      detail: json['detail'],
      instance: json['instance'],
    );
  }
}
