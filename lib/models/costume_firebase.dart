class Costume2 {
  final String costumeId;
  final String costumeName;
  final String gender;
  final String imageURL;
  final String decription;
  final String url;
  final String story;

  Costume2(
      {required this.costumeId,
        required this.gender,
        required this.costumeName,
        required this.imageURL,
        required this.decription,
        required this.url,
        required this.story
      });
  factory Costume2.fromMap(Map<dynamic, dynamic> map) {
    return Costume2(
      costumeId: map["uid"] ?? '',
      gender: map["Gender"] ?? '',
      costumeName: map["name"] ?? '',
      imageURL: map["imageUrl"] ?? '',
      decription: map["Description"] ?? '',
      url: map["url"] ?? '',
      story: map["Story"] ?? '',
    );
  }
}
