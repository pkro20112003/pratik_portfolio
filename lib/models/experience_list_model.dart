class ExperienceListModel {
  final String duration;
  final String company;
  final String description;
  final bool isLink;
  ExperienceListModel({
    required this.duration,
    required this.company,
    required this.description,
    this.isLink = false,
  });
}
