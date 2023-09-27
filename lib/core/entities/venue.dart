class Venue {
  final String? name;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? phone;
  final String? website;

  Venue({
    this.name,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.phone,
    this.website,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      phone: json['phone'],
      website: json['website'],
    );
  }
}
