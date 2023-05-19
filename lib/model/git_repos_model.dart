class GitRepo {
  final String name;
  final String link;

  GitRepo({
    required this.name,
    required this.link,
  });

  factory GitRepo.fromJson(Map<String, dynamic> json) {
    return GitRepo(
      name: json['full_name'],
      link: json['html_url'],
    );
  }
}
