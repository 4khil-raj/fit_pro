class FetchBookModel {
  final int status;
  final String message;
  final List<Bookmark> bookmarks;
  final String statusCode;

  FetchBookModel({
    required this.status,
    required this.message,
    required this.bookmarks,
    required this.statusCode,
  });

  factory FetchBookModel.fromJson(Map<String, dynamic> json) {
    return FetchBookModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      bookmarks: json['bookmarks'] != null
          ? List<Bookmark>.from(
              json['bookmarks'].map((x) => Bookmark.fromJson(x)))
          : [],
      statusCode: json['status_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'bookmarks': bookmarks.map((x) => x.toJson()).toList(),
      'status_code': statusCode,
    };
  }
}

class Bookmark {
  final String id;
  final int day;
  final String dayName;
  final String dayBannerImage;
  final String dayOfWeek;
  final String estimatedDuration;
  final List<String> categories;
  final String createdAt;
  final String updatedAt;
  final int version;
  final String introVideo;

  Bookmark({
    required this.id,
    required this.day,
    required this.dayName,
    required this.dayBannerImage,
    required this.dayOfWeek,
    required this.estimatedDuration,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.introVideo,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id: json['_id'] ?? '',
      day: json['day'] ?? 0,
      dayName: json['day_name'] ?? '',
      dayBannerImage: json['day_banner_image'] ?? '',
      dayOfWeek: json['day_of_week'] ?? '',
      estimatedDuration: json['estimated_duration'] ?? '',
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      version: json['__v'] ?? 0,
      introVideo: json['intro_video'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'day_name': dayName,
      'day_banner_image': dayBannerImage,
      'day_of_week': dayOfWeek,
      'estimated_duration': estimatedDuration,
      'categories': categories,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
      'intro_video': introVideo,
    };
  }
}
