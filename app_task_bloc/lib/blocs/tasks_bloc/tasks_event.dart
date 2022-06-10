part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

//ici on ajoute un nvel event, qui prend en entrée un elt de type TaskModel

class AddTask extends TasksEvent {
  final TaskModel taskModel;

  const AddTask({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}

class UpdateTask extends TasksEvent {
  final TaskModel taskModel;

  const UpdateTask({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}

class DeleteTask extends TasksEvent {
  final TaskModel taskModel;

  const DeleteTask({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}

class RemoveTask extends TasksEvent {
  final TaskModel taskModel;

  const RemoveTask({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}
