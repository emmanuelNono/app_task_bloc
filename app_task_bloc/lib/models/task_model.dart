import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: title ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  String toString() =>
      'TaskModel(id: $id,title: $title,description: $description, isDone: $isDone, isDeleted: $isDeleted)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isDone == isDone &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode  ^ description.hashCode^ isDone.hashCode ^ isDeleted.hashCode;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isDone,
        isDeleted,
      ];
}
