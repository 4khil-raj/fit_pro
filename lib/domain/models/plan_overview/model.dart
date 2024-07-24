class PlanOverviewModel {
  final String id;
  final String planName;
  final String description;
  final String bannerImage;
  final String planVideo;
  final String workoutKeywords;
  final List<String> goalOrientation;
  final String targetAgeGroup;
  final String trainingType;
  final String location;
  final String level;
  final String estimatedDuration;
  final int restBetweenExercisesSeconds;
  final double averageCaloriesBurnedPerMinute;
  final List<Week> weeks;

  PlanOverviewModel({
    required this.id,
    required this.planName,
    required this.description,
    required this.bannerImage,
    required this.planVideo,
    required this.workoutKeywords,
    required this.goalOrientation,
    required this.targetAgeGroup,
    required this.trainingType,
    required this.location,
    required this.level,
    required this.estimatedDuration,
    required this.restBetweenExercisesSeconds,
    required this.averageCaloriesBurnedPerMinute,
    required this.weeks,
  });

  factory PlanOverviewModel.fromJson(Map<String, dynamic> json) {
    return PlanOverviewModel(
      id: json['_id'],
      planName: json['plan_name'],
      description: json['description'],
      bannerImage: json['banner_image'],
      planVideo: json['plan_video'],
      workoutKeywords: json['workout_keywords'],
      goalOrientation: List<String>.from(json['goal_orientation']),
      targetAgeGroup: json['target_age_group'],
      trainingType: json['training_type'],
      location: json['location'],
      level: json['level'],
      estimatedDuration: json['estimated_duration'],
      restBetweenExercisesSeconds: json['rest_between_exercises_seconds'],
      averageCaloriesBurnedPerMinute:
          json['average_calories_burned_per_minute'].toDouble(),
      weeks: List<Week>.from(json['weeks'].map((week) => Week.fromJson(week))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'plan_name': planName,
      'description': description,
      'banner_image': bannerImage,
      'plan_video': planVideo,
      'workout_keywords': workoutKeywords,
      'goal_orientation': goalOrientation,
      'target_age_group': targetAgeGroup,
      'training_type': trainingType,
      'location': location,
      'level': level,
      'estimated_duration': estimatedDuration,
      'rest_between_exercises_seconds': restBetweenExercisesSeconds,
      'average_calories_burned_per_minute': averageCaloriesBurnedPerMinute,
      'weeks': weeks.map((week) => week.toJson()).toList(),
    };
  }
}

class Week {
  final String id;
  final int week;
  final List<Day> days;

  Week({
    required this.id,
    required this.week,
    required this.days,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      id: json['_id'],
      week: json['week'],
      days: List<Day>.from(json['days'].map((day) => Day.fromJson(day))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'week': week,
      'days': days.map((day) => day.toJson()).toList(),
    };
  }
}

class Day {
  final String id;
  final int day;
  final String dayName;
  final String dayBannerImage;
  final String introVideo;
  final String dayOfWeek;
  final String estimatedDuration;
  final List<Category> categories;

  Day({
    required this.id,
    required this.day,
    required this.dayName,
    required this.dayBannerImage,
    required this.introVideo,
    required this.dayOfWeek,
    required this.estimatedDuration,
    required this.categories,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      id: json['_id'],
      day: json['day'],
      dayName: json['day_name'],
      dayBannerImage: json['day_banner_image'],
      introVideo: json['intro_video'],
      dayOfWeek: json['day_of_week'],
      estimatedDuration: json['estimated_duration'],
      categories: List<Category>.from(
          json['categories'].map((category) => Category.fromJson(category))),
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
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }
}

class Category {
  final String id;
  final String subCategory;
  final int circuitRestTime;
  final int circuitReps;
  final List<Exercise> exercises;

  Category({
    required this.id,
    required this.subCategory,
    required this.circuitRestTime,
    required this.circuitReps,
    required this.exercises,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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
  final String id;
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
// class PlanOverviewModel {
//   final String id;
//   final String planName;
//   final String description;
//   final String bannerImage;
//   final String planVideo;
//   final String workoutKeywords;
//   final List<String> goalOrientation;
//   final String targetAgeGroup;
//   final String trainingType;
//   final String location;
//   final String level;
//   final String estimatedDuration;
//   final int restBetweenExercisesSeconds;
//   final double averageCaloriesBurnedPerMinute;
//   final List<String> weeks; // Changed to List<String>

//   PlanOverviewModel({
//     required this.id,
//     required this.planName,
//     required this.description,
//     required this.bannerImage,
//     required this.planVideo,
//     required this.workoutKeywords,
//     required this.goalOrientation,
//     required this.targetAgeGroup,
//     required this.trainingType,
//     required this.location,
//     required this.level,
//     required this.estimatedDuration,
//     required this.restBetweenExercisesSeconds,
//     required this.averageCaloriesBurnedPerMinute,
//     required this.weeks,
//   });

//   factory PlanOverviewModel.fromJson(Map<String, dynamic> json) {
//     return PlanOverviewModel(
//       id: json['_id'],
//       planName: json['plan_name'],
//       description: json['description'],
//       bannerImage: json['banner_image'],
//       planVideo: json['plan_video'],
//       workoutKeywords: json['workout_keywords'],
//       goalOrientation: List<String>.from(json['goal_orientation']),
//       targetAgeGroup: json['target_age_group'],
//       trainingType: json['training_type'],
//       location: json['location'],
//       level: json['level'],
//       estimatedDuration: json['estimated_duration'],
//       restBetweenExercisesSeconds: json['rest_between_exercises_seconds'],
//       averageCaloriesBurnedPerMinute:
//           json['average_calories_burned_per_minute'].toDouble(),
//       weeks: List<String>.from(json['weeks']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'plan_name': planName,
//       'description': description,
//       'banner_image': bannerImage,
//       'plan_video': planVideo,
//       'workout_keywords': workoutKeywords,
//       'goal_orientation': goalOrientation,
//       'target_age_group': targetAgeGroup,
//       'training_type': trainingType,
//       'location': location,
//       'level': level,
//       'estimated_duration': estimatedDuration,
//       'rest_between_exercises_seconds': restBetweenExercisesSeconds,
//       'average_calories_burned_per_minute': averageCaloriesBurnedPerMinute,
//       'weeks': weeks,
//     };
//   }
// }
