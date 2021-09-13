class Lessons {
  final String name;
  final double letterValue;
  final double creditValue;

  Lessons(
      {required this.name,
      required this.letterValue,
      required this.creditValue});
  @override
  String toString() {
    return "$name $letterValue $creditValue";
  }
}
