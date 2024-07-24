class PlanOverviewWeekModel {
  final String id; // Corresponds to _id in the response
  final int day;
  final String dayName;
  final String dayBannerImage;
  final String introVideo;
  final String dayOfWeek;
  final String estimatedDuration;
  final String categoryId; // Added categoryId field

  PlanOverviewWeekModel({
    required this.id,
    required this.day,
    required this.dayName,
    required this.dayBannerImage,
    required this.introVideo,
    required this.dayOfWeek,
    required this.estimatedDuration,
    required this.categoryId, // Initialize categoryId
  });

  factory PlanOverviewWeekModel.fromJson(Map<String, dynamic> json) {
    return PlanOverviewWeekModel(
      id: json['_id'],
      day: json['day'],
      dayName: json['day_name'],
      dayBannerImage: json['day_banner_image'],
      introVideo: json['intro_video'],
      dayOfWeek: json['day_of_week'],
      estimatedDuration: json['estimated_duration'],
      categoryId:
          json['category_id'], // Ensure this matches the field name in JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'day': day,
      'day_name': dayName,
      'day_banner_image': dayBannerImage,
      'intro_video': introVideo,
      'day_of_week': dayOfWeek,
      'estimated_duration': estimatedDuration,
      'category_id': categoryId, // Ensure this matches the field name in JSON
    };
  }
}

class CategoryWeek {
  final String id; // Corresponds to _id in the response
  final String subCategory;
  final int circuitRestTime;
  final int circuitReps;
  final List<Exercise> exercises;

  CategoryWeek({
    required this.id,
    required this.subCategory,
    required this.circuitRestTime,
    required this.circuitReps,
    required this.exercises,
  });

  factory CategoryWeek.fromJson(Map<String, dynamic> json) {
    return CategoryWeek(
      id: json['_id'],
      subCategory: json['sub_category'],
      circuitRestTime: json['circuit_rest_time'],
      circuitReps: json['circuit_reps'],
      exercises: List<Exercise>.from(
          json['exercises'].map((exercise) => Exercise.fromJson(exercise))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sub_category': subCategory,
      'circuit_rest_time': circuitRestTime,
      'circuit_reps': circuitReps,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

class Exercise {
  final String id; // Corresponds to _id in the response
  final String name;
  final int exerciseNumber;
  final String exerciseType;
  final String timeBased;
  final String weighted;
  final int sets;
  final List<int> reps;
  final String setTime;
  final List<String> supersetNames;
  final int restTime;
  final String videoUrl;
  final String imageUrl;

  Exercise({
    required this.id,
    required this.name,
    required this.exerciseNumber,
    required this.exerciseType,
    required this.timeBased,
    required this.weighted,
    required this.sets,
    required this.reps,
    required this.setTime,
    required this.supersetNames,
    required this.restTime,
    required this.videoUrl,
    required this.imageUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['_id'],
      name: json['name'],
      exerciseNumber: json['exercise_number'],
      exerciseType: json['exercise_type'],
      timeBased: json['time_based'],
      weighted: json['weighted'],
      sets: json['sets'],
      reps: List<int>.from(json['reps']),
      setTime: json['set_time'],
      supersetNames: List<String>.from(json['superset_names']),
      restTime: json['rest_time'],
      videoUrl: json['video_url'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'exercise_number': exerciseNumber,
      'exercise_type': exerciseType,
      'time_based': timeBased,
      'weighted': weighted,
      'sets': sets,
      'reps': reps,
      'set_time': setTime,
      'superset_names': supersetNames,
      'rest_time': restTime,
      'video_url': videoUrl,
      'image_url': imageUrl,
    };
  }
}
