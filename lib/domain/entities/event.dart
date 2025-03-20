
class Event {
  final String eventName;
  final String description;
  final String date;

  const Event({
    required this.eventName,
    required this.description,
    required this.date,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Event &&
        other.eventName == eventName &&
        other.description == description &&
        other.date == date;
  }

  @override
  int get hashCode => eventName.hashCode ^ description.hashCode ^ date.hashCode;
}
