class UserFetchModel {
  final int status;
  final String message;
  final User? user; // Nullable
  final String statusCode;

  UserFetchModel({
    required this.status,
    required this.message,
    this.user, // Nullable
    required this.statusCode,
  });

  factory UserFetchModel.fromJson(Map<String, dynamic> json) {
    return UserFetchModel(
      status: json['status'] ?? 0, // Default value if null
      message: json['message'] ?? '', // Default value if null
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : null, // Handle null user
      statusCode: json['status_code'] ?? '', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user?.toJson(), // Handle null user
      'status_code': statusCode,
    };
  }
}

class User {
  final String id;
  final String name;
  final String? profilePic;
  final String email;
  final bool isVerified;
  final String role;
  final int age;
  final String gender;
  final Height height;
  final Weight weight;
  final String goal;
  final String experience;
  final String workoutType;
  final int workoutFrequency;

  User({
    required this.id,
    required this.name,
    this.profilePic, // Nullable profilePic
    required this.email,
    required this.isVerified,
    required this.role,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.goal,
    required this.experience,
    required this.workoutType,
    required this.workoutFrequency,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '', // Default value if null
      name: json['name'] ?? '', // Default value if null
      profilePic: json['profilePic'], // Nullable profilePic
      email: json['email'] ?? '', // Default value if null
      isVerified: json['isVerified'] ?? false, // Default value if null
      role: json['role'] ?? '', // Default value if null
      age: json['age'] ?? 0, // Default value if null
      gender: json['gender'] ?? '', // Default value if null
      height:
          Height.fromJson(json['height'] ?? {}), // Handle null height object
      weight:
          Weight.fromJson(json['weight'] ?? {}), // Handle null weight object
      goal: json['goal'] ?? '', // Default value if null
      experience: json['experience'] ?? '', // Default value if null
      workoutType: json['workoutType'] ?? '', // Default value if null
      workoutFrequency: json['workoutFrequency'] ?? 0, // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'profilePic': profilePic,
      'email': email,
      'isVerified': isVerified,
      'role': role,
      'age': age,
      'gender': gender,
      'height': height.toJson(),
      'weight': weight.toJson(),
      'goal': goal,
      'experience': experience,
      'workoutType': workoutType,
      'workoutFrequency': workoutFrequency,
    };
  }
}

class Height {
  final double value;
  final String unit;

  Height({
    required this.value,
    required this.unit,
  });

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      value: json['value']?.toDouble() ?? 0.0, // Default value if null
      unit: json['unit'] ?? '', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }
}

class Weight {
  final double value;
  final String unit;

  Weight({
    required this.value,
    required this.unit,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      value: json['value']?.toDouble() ?? 0.0, // Default value if null
      unit: json['unit'] ?? '', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }
}
