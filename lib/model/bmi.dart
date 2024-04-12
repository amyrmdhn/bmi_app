class Bmi {
  final int isFemale;
  final int height;
  final int weight;
  final int age;
  final double bmi;
  final double bmiPrime;
  final double ponderalIndex;
  final String bmiCategories;
  final String bmiPrimeCategories;
  final String ponderalIndexCategories;
  final String bmiRange;
  final String ponderalIndexRange;

  Bmi({
    required this.isFemale,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmiCategories,
    required this.bmi,
    required this.bmiPrime,
    required this.ponderalIndex,
    required this.bmiPrimeCategories,
    required this.ponderalIndexCategories,
    required this.bmiRange,
    required this.ponderalIndexRange,
  });

  factory Bmi.fromJson(Map<String, dynamic> json) => Bmi(
        isFemale: json["isFemale"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        bmi: json["bmi"]?.toDouble(),
        bmiPrime: json["bmi_prime"]?.toDouble(),
        ponderalIndex: json["ponderal_index"]?.toDouble(),
        bmiCategories: json["bmi_categories"],
        bmiPrimeCategories: json["bmi_prime_categories"],
        ponderalIndexCategories: json["ponderal_index_categories"],
        bmiRange: json["bmi_range"],
        ponderalIndexRange: json["ponderal_index_range"],
      );

  Bmi copyWith({
    int? isFemale,
    int? height,
    int? weight,
    int? age,
    double? bmi,
    double? bmiPrime,
    double? ponderalIndex,
    String? bmiCategories,
    String? bmiPrimeCategories,
    String? ponderalIndexCategories,
    String? bmiRange,
    String? ponderalIndexRange,
  }) {
    return Bmi(
      isFemale: isFemale ?? this.isFemale,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
      bmiPrime: bmiPrime ?? this.bmiPrime,
      ponderalIndex: ponderalIndex ?? this.ponderalIndex,
      bmiCategories: bmiCategories ?? this.bmiCategories,
      bmiPrimeCategories: bmiPrimeCategories ?? this.bmiPrimeCategories,
      ponderalIndexCategories:
          ponderalIndexCategories ?? this.ponderalIndexCategories,
      bmiRange: bmiRange ?? this.bmiRange,
      ponderalIndexRange: ponderalIndexRange ?? this.ponderalIndexRange,
    );
  }
}
