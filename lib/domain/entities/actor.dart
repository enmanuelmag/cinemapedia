class Actor {
  final int id;
  final String name;
  final String? character;
  final String profilePath;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    this.character,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'],
    );
  }
}