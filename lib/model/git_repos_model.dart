class GitRepo {
  final int id;
  final String name;
  final String link;

  GitRepo({
    required this.id,
    required this.name,
    required this.link,
  });

  factory GitRepo.fromJson(Map<String, dynamic> json) {
    return GitRepo(
      id: json['id'],
      name: json['full_name'],
      link: json['html_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': name,
      'html_url': link,
    };
  }
}
