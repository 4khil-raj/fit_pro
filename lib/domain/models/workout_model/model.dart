// class WorkoutFetchModel {
//   int status;
//   String message;
//   String statusCode;
//   List<WorkoutFetch> workout;

//   WorkoutFetchModel({
//     required this.status,
//     required this.message,
//     required this.statusCode,
//     required this.workout,
//   });

//   factory WorkoutFetchModel.fromJson(Map<String, dynamic> json) {
//     return WorkoutFetchModel(
//       status: json['status'],
//       message: json['message'],
//       statusCode: json['status_code'],
//       workout: List<WorkoutFetch>.from(
//           json['workout'].map((x) => WorkoutFetch.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'status_code': statusCode,
//       'workout': List<dynamic>.from(workout.map((x) => x.toJson())),
//     };
//   }
// }

// class WorkoutFetch {
//   String workoutName;
//   String description;
//   String bannerImage;
//   String workoutVideo;
//   String workoutKeywords;
//   String goalOrientation;
//   String targetAgeGroup;
//   String trainingType;
//   String location;
//   String level;
//   String estimatedDuration;
//   int restBetweenExercisesSeconds;
//   int averageCaloriesBurnedPerMinute;
//   List<CategoryWorkoutFetch> categories;

//   WorkoutFetch({
//     required this.workoutName,
//     required this.description,
//     required this.bannerImage,
//     required this.workoutVideo,
//     required this.workoutKeywords,
//     required this.goalOrientation,
//     required this.targetAgeGroup,
//     required this.trainingType,
//     required this.location,
//     required this.level,
//     required this.estimatedDuration,
//     required this.restBetweenExercisesSeconds,
//     required this.averageCaloriesBurnedPerMinute,
//     required this.categories,
//   });

//   factory WorkoutFetch.fromJson(Map<String, dynamic> json) {
//     return WorkoutFetch(
//       workoutName: json['workout_name'],
//       description: json['description'],
//       bannerImage: json['banner_image'],
//       workoutVideo: json['workout_video'],
//       workoutKeywords: json['workout_keywords'],
//       goalOrientation: json['goal_orientation'],
//       targetAgeGroup: json['target_age_group'],
//       trainingType: json['training_type'],
//       location: json['location'],
//       level: json['level'],
//       estimatedDuration: json['estimated_duration'],
//       restBetweenExercisesSeconds: json['rest_between_exercises_seconds'],
//       averageCaloriesBurnedPerMinute:
//           json['average_calories_burned_per_minute'],
//       categories: List<CategoryWorkoutFetch>.from(
//           json['categories'].map((x) => CategoryWorkoutFetch.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'workout_name': workoutName,
//       'description': description,
//       'banner_image': bannerImage,
//       'workout_video': workoutVideo,
//       'workout_keywords': workoutKeywords,
//       'goal_orientation': goalOrientation,
//       'target_age_group': targetAgeGroup,
//       'training_type': trainingType,
//       'location': location,
//       'level': level,
//       'estimated_duration': estimatedDuration,
//       'rest_between_exercises_seconds': restBetweenExercisesSeconds,
//       'average_calories_burned_per_minute': averageCaloriesBurnedPerMinute,
//       'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
//     };
//   }
// }

// class CategoryWorkoutFetch {
//   String subCategory;
//   int? circuitRestTime;
//   int? circuitReps;
//   List<ExerciseWokoutFetch> exercises;

//   CategoryWorkoutFetch({
//     required this.subCategory,
//     this.circuitRestTime,
//     this.circuitReps,
//     required this.exercises,
//   });

//   factory CategoryWorkoutFetch.fromJson(Map<String, dynamic> json) {
//     return CategoryWorkoutFetch(
//       subCategory: json['sub_category'],
//       circuitRestTime: json['circuit_rest_time'],
//       circuitReps: json['circuit_reps'],
//       exercises: List<ExerciseWokoutFetch>.from(
//           json['exercises'].map((x) => ExerciseWokoutFetch.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'sub_category': subCategory,
//       'circuit_rest_time': circuitRestTime,
//       'circuit_reps': circuitReps,
//       'exercises': List<dynamic>.from(exercises.map((x) => x.toJson())),
//     };
//   }
// }

// class ExerciseWokoutFetch {
//   String name;
//   int exerciseNumber;
//   String exerciseType;
//   String? timeBased;
//   String weighted;
//   int sets;
//   List<int>? reps;
//   String? setTime;
//   List<String> supersetNames;
//   int restTime;
//   String videoUrl;
//   String imageUrl;

//   ExerciseWokoutFetch({
//     required this.name,
//     required this.exerciseNumber,
//     required this.exerciseType,
//     this.timeBased,
//     required this.weighted,
//     required this.sets,
//     this.reps,
//     this.setTime,
//     required this.supersetNames,
//     required this.restTime,
//     required this.videoUrl,
//     required this.imageUrl,
//   });

//   factory ExerciseWokoutFetch.fromJson(Map<String, dynamic> json) {
//     return ExerciseWokoutFetch(
//       name: json['name'],
//       exerciseNumber: json['exercise_number'],
//       exerciseType: json['exercise_type'],
//       timeBased: json['time_based'],
//       weighted: json['weighted'],
//       sets: json['sets'],
//       reps: json['reps'] != null ? List<int>.from(json['reps']) : null,
//       setTime: json['set_time'],
//       supersetNames: List<String>.from(json['superset_names']),
//       restTime: json['rest_time'],
//       videoUrl: json['video_url'],
//       imageUrl: json['image_url'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'exercise_number': exerciseNumber,
//       'exercise_type': exerciseType,
//       'time_based': timeBased,
//       'weighted': weighted,
//       'sets': sets,
//       'reps': reps,
//       'set_time': setTime,
//       'superset_names': List<dynamic>.from(supersetNames.map((x) => x)),
//       'rest_time': restTime,
//       'video_url': videoUrl,
//       'image_url': imageUrl,
//     };
//   }
// }

class WorkoutFetchModel {
  final String id;
  final String workoutName;
  final String description;
  final String bannerImage;
  final String workoutVideo;
  final String workoutKeywords;
  final String goalOrientation;
  final String targetAgeGroup;
  final String trainingType;
  final String location;
  final String level;
  final String estimatedDuration;
  final int restBetweenExercisesSeconds;
  final int averageCaloriesBurnedPerMinute;
  final List<String> categories;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  WorkoutFetchModel({
    required this.id,
    required this.workoutName,
    required this.description,
    required this.bannerImage,
    required this.workoutVideo,
    required this.workoutKeywords,
    required this.goalOrientation,
    required this.targetAgeGroup,
    required this.trainingType,
    required this.location,
    required this.level,
    required this.estimatedDuration,
    required this.restBetweenExercisesSeconds,
    required this.averageCaloriesBurnedPerMinute,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory WorkoutFetchModel.fromJson(Map<String, dynamic> json) {
    return WorkoutFetchModel(
      id: json['_id'] as String,
      workoutName: json['workout_name'] as String,
      description: json['description'] as String,
      bannerImage: json['banner_image'] as String,
      workoutVideo: json['workout_video'] as String,
      workoutKeywords: json['workout_keywords'] as String,
      goalOrientation: json['goal_orientation'] as String,
      targetAgeGroup: json['target_age_group'] as String,
      trainingType: json['training_type'] as String,
      location: json['location'] as String,
      level: json['level'] as String,
      estimatedDuration: json['estimated_duration'] as String,
      restBetweenExercisesSeconds: json['rest_between_exercises_seconds'] ?? 0,
      averageCaloriesBurnedPerMinute:
          json['average_calories_burned_per_minute'] ?? 0,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'workout_name': workoutName,
      'description': description,
      'banner_image': bannerImage,
      'workout_video': workoutVideo,
      'workout_keywords': workoutKeywords,
      'goal_orientation': goalOrientation,
      'target_age_group': targetAgeGroup,
      'training_type': trainingType,
      'location': location,
      'level': level,
      'estimated_duration': estimatedDuration,
      'rest_between_exercises_seconds': restBetweenExercisesSeconds,
      'average_calories_burned_per_minute': averageCaloriesBurnedPerMinute,
      'categories': categories,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
