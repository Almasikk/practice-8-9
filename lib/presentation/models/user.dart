class User {
  final int id;
  final String name;
  final String username;
  final String website;
  final String phone;
  final String email; // Add this line
  final String street;
  final String suite;
  final String city;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.website,
    required this.phone,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      website: json['website'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      street: json['address']['street'] ?? '',
      suite: json['address']['suite'] ?? '',
      city: json['address']['city'] ?? '',
    );
  }
}
