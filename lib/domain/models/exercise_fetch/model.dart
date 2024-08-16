class ExerciseFetchModel {
  final int status;
  final String message;
  final List<ExerciseSubClass> exercises;
  final List<ExerciseSubClass> superset;
  final List<ExerciseSubClass> circuit;
  final String statusCode;

  ExerciseFetchModel({
    required this.status,
    required this.message,
    required this.exercises,
    required this.superset,
    required this.circuit,
    required this.statusCode,
  });

  factory ExerciseFetchModel.fromJson(Map<String, dynamic> json) {
    return ExerciseFetchModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      exercises: json['exercises'] != null
          ? List<ExerciseSubClass>.from(json['exercises']
              .map((exercise) => ExerciseSubClass.fromJson(exercise)))
          : [],
      superset: json['superset'] != null
          ? List<ExerciseSubClass>.from(json['superset']
              .map((exercise) => ExerciseSubClass.fromJson(exercise)))
          : [],
      circuit: json['circuit'] != null
          ? List<ExerciseSubClass>.from(json['circuit']
              .map((exercise) => ExerciseSubClass.fromJson(exercise)))
          : [],
      statusCode: json['status_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
      'superset': superset.map((exercise) => exercise.toJson()).toList(),
      'circuit': circuit.map((exercise) => exercise.toJson()).toList(),
      'status_code': statusCode,
    };
  }
}

class ExerciseSubClass {
  final String id;
  final String name;
  final int exerciseNumber;
  final String exerciseType;
  final String? timeBased;
  final String weighted;
  final int sets;
  final List<int> reps;
  final String? setTime;
  final List<String> supersetNames;
  final int restTime;
  final String videoUrl;
  final String imageUrl;

  ExerciseSubClass({
    required this.id,
    required this.name,
    required this.exerciseNumber,
    required this.exerciseType,
    this.timeBased,
    required this.weighted,
    required this.sets,
    required this.reps,
    this.setTime,
    required this.supersetNames,
    required this.restTime,
    required this.videoUrl,
    required this.imageUrl,
  });

  factory ExerciseSubClass.fromJson(Map<String, dynamic> json) {
    return ExerciseSubClass(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      exerciseNumber: json['exercise_number'] ?? 0, // Handling null
      exerciseType: json['exercise_type'] ?? '',
      timeBased: json['time_based'],
      weighted: json['weighted'] ?? '',
      sets: json['sets'] ?? 0, // Handling null
      reps: json['reps'] != null
          ? List<int>.from(json['reps'])
          : [], // Handling null
      setTime: json['set_time'],
      supersetNames: json['superset_names'] != null
          ? List<String>.from(json['superset_names'])
          : [], // Handling null
      restTime: json['rest_time'] ?? 0, // Handling null
      videoUrl: json['video_url'] ?? '',
      imageUrl: json['image_url'] ?? '',
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
