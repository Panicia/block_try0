class CounterDto {
  CounterDto({this.id = 0, required this.counter});
  int? id;
  int? counter;

  factory CounterDto.fromMap(Map<String, dynamic> json) =>
      CounterDto(
          id: json['id'],
          counter: json['counter']
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'counter': counter,
    };
  }
}