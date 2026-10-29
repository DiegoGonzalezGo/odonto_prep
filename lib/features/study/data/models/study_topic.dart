class StudyTopic {
  const StudyTopic({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.order,
  });

  factory StudyTopic.fromJson(Map<String, dynamic> json) {
    return StudyTopic(
      id: json['id'] as String,
      moduleId: json['moduleId'] as String,
      title: json['title'] as String,
      order: json['order'] as int,
    );
  }

  final String id;
  final String moduleId;
  final String title;
  final int order;
}
