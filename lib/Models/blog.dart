class BlogModel {
  final String id;
  final String description;
  final String blogTitle;
  final String blogThumbnail;
  final String blogDescription;
  final String blogCategorie;
  final String titleHyphens;
  final String blogHyphens;
  final String createdAt;
  final String updatedAt;
  final Author author;

  BlogModel({
    required this.id,
    required this.description,
    required this.blogTitle,
    required this.blogThumbnail,
    required this.blogDescription,
    required this.blogCategorie,
    required this.titleHyphens,
    required this.blogHyphens,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'],
      description: json['description'],
      blogTitle: json['blogTitle'],
      blogThumbnail: json['blogThumbnail'],
      blogDescription: json['blogDescription'],
      blogCategorie: json['blogCategorie'],
      titleHyphens: json['titleHyphens'],
      blogHyphens: json['blogHyphens'],
      createdAt: json['created_at'],
      updatedAt: json['updatedAt'],
      author: Author.fromJson(json['author']),
    );
  }
  String get fullBlogThumbnailUrl =>
      "https://verticalsols-image.s3.ap-south-1.amazonaws.com/$blogThumbnail";
}


class Author {
  final String fullName;
  final String profilePic;
  final String emailAddress;

  Author({
    required this.fullName,
    required this.profilePic,
    required this.emailAddress,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      fullName: json['fullName'],
      profilePic: json['profilePic'],
      emailAddress: json['emailAddress'],
    );
  }
}
