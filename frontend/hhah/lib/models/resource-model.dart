class ResourceModel {
  final String title;
  final String type;
  final String category;
  final String link;

  ResourceModel({
    required this.title,
    required this.type,
    required this.category,
    required this.link,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
      title: json['title'],
      type: json['type'],
      category: json['category'],
      link: json['link'],
    );
  }
}
