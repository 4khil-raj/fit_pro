class WorkoutPlanModel {
  final String id;
  final String planName;
  final String description;
  final String bannerImage;
  final String planVideo; // Add this line
  final String workoutKeywords;
  final List<String> goalOrientation;
  final String targetAgeGroup;
  final String trainingType;
  final String location;
  final String level;
  final String estimatedDuration;
  final int restBetweenExercisesSeconds;
  final int averageCaloriesBurnedPerMinute;
  final List<Week> weeks;

  WorkoutPlanModel({
    required this.id,
    required this.planName,
    required this.description,
    required this.bannerImage,
    required this.planVideo, // Add this line
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

  factory WorkoutPlanModel.fromJson(Map<String, dynamic> json) {
    var weeksList = json['weeks'] as List;
    List<Week> weeks = weeksList.map((i) => Week.fromJson(i)).toList();

    return WorkoutPlanModel(
      id: json['_id'],
      planName: json['plan_name'],
      description: json['description'],
      bannerImage: json['banner_image'],
      planVideo: json['plan_video'], // Add this line
      workoutKeywords: json['workout_keywords'],
      goalOrientation: List<String>.from(json['goal_orientation']),
      targetAgeGroup: json['target_age_group'],
      trainingType: json['training_type'],
      location: json['location'],
      level: json['level'],
      estimatedDuration: json['estimated_duration'],
      restBetweenExercisesSeconds: json['rest_between_exercises_seconds'],
      averageCaloriesBurnedPerMinute:
          json['average_calories_burned_per_minute'],
      weeks: weeks,
    );
  }
}

class Week {
  final int week;
  final List<Day> days;

  Week({
    required this.week,
    required this.days,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    var daysList = json['days'] as List;
    List<Day> days = daysList.map((i) => Day.fromJson(i)).toList();

    return Week(
      week: json['week'],
      days: days,
    );
  }
}

class Day {
  final int day;
  final String dayName;
  final String dayBannerImage;
  final String dayOfWeek;
  final String estimatedDuration;
  final List<Category> categories;

  Day({
    required this.day,
    required this.dayName,
    required this.dayBannerImage,
    required this.dayOfWeek,
    required this.estimatedDuration,
    required this.categories,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    var categoriesList = json['categories'] as List;
    List<Category> categories =
        categoriesList.map((i) => Category.fromJson(i)).toList();

    return Day(
      day: json['day'],
      dayName: json['day_name'],
      dayBannerImage: json['day_banner_image'],
      dayOfWeek: json['day_of_week'],
      estimatedDuration: json['estimated_duration'],
      categories: categories,
    );
  }
}

class Category {
  final String subCategory;
  final int circuitRestTime;
  final int circuitReps;
  final List<Exercise> exercises;

  Category({
    required this.subCategory,
    required this.circuitRestTime,
    required this.circuitReps,
    required this.exercises,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var exercisesList = json['exercises'] as List;
    List<Exercise> exercises =
        exercisesList.map((i) => Exercise.fromJson(i)).toList();

    return Category(
      subCategory: json['sub_category'],
      circuitRestTime: json['circuit_rest_time'],
      circuitReps: json['circuit_reps'],
      exercises: exercises,
    );
  }
}

class Exercise {
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
}
