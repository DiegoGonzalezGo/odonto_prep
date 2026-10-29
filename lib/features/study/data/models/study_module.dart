class StudyModule {
  const StudyModule({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
  });

  factory StudyModule.fromJson(Map<String, dynamic> json) {
    return StudyModule(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      order: json['order'] as int,
    );
  }

  final String id;
  final String title;
  final String description;
  final int order;
}
