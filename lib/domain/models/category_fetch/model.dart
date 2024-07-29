class CategoryFetchModel {
  final String id;
  final String subCategory;
  final int circuitRestTime;
  final int circuitReps;
  final List<CategoryExercisesClass> exercises;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  CategoryFetchModel({
    required this.id,
    required this.subCategory,
    required this.circuitRestTime,
    required this.circuitReps,
    required this.exercises,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory CategoryFetchModel.fromJson(Map<String, dynamic> json) {
    return CategoryFetchModel(
      id: json['_id'],
      subCategory: json['sub_category'],
      circuitRestTime: json['circuit_rest_time'],
      circuitReps: json['circuit_reps'],
      exercises: (json['exercises'] as List)
          .map((e) => CategoryExercisesClass.fromJson(e))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sub_category': subCategory,
      'circuit_rest_time': circuitRestTime,
      'circuit_reps': circuitReps,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class CategoryExercisesClass {
  final String id;
  final String name;
  final int exerciseNumber;
  final String exerciseType;
  final bool timeBased;
  final bool weighted;
  final int sets;
  final List<int> reps;
  final String setTime;
  final List<String> supersetNames;
  final int restTime;
  final String videoUrl;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  CategoryExercisesClass({
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
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory CategoryExercisesClass.fromJson(Map<String, dynamic> json) {
    return CategoryExercisesClass(
      id: json['_id'],
      name: json['name'],
      exerciseNumber: json['exercise_number'],
      exerciseType: json['exercise_type'],
      timeBased: json['time_based'] == 'true',
      weighted: json['weighted'] == 'false',
      sets: json['sets'],
      reps: List<int>.from(json['reps']),
      setTime: json['set_time'],
      supersetNames: List<String>.from(json['superset_names']),
      restTime: json['rest_time'],
      videoUrl: json['video_url'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'exercise_number': exerciseNumber,
      'exercise_type': exerciseType,
      'time_based': timeBased.toString(),
      'weighted': weighted.toString(),
      'sets': sets,
      'reps': reps,
      'set_time': setTime,
      'superset_names': supersetNames,
      'rest_time': restTime,
      'video_url': videoUrl,
      'image_url': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
