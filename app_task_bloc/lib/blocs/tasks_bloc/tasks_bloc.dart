import 'dart:async';

import 'package:app_task_bloc/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  //ici à chaue event, on indique au bloc ce qu'il doit faire
  TasksBloc() : super(const TasksState()) {
    //decrivont la logique de chaque event
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

//prend en entrée un state et emet une nvel liste de tasks
  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.taskModel),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    //on prend en entrée le state et la task
    final state = this.state;
    final task = event.taskModel;

    //on MAJ la list des tasks en supprimant l'ancienne task
    List<TaskModel> pendingTasks = state.pendingTasks;
    List<TaskModel> completedTasks = state.completedTasks;
    // List<TaskModel> favoriteTasks = state.favoriteTasks;

    //on ajoute la meme task avec la valeur MAJ
    //si la valeur etaient false, alors on met true
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTasks.insert(0, task.copyWith(isDone: false)),
            pendingTasks = List.from(pendingTasks)
              ..remove(task.copyWith(isDone: false)),
          };

    //enfin on emet la nvel liste
    emit(TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.taskModel),
      ),
    );
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.taskModel),
        completedTasks: List.from(state.completedTasks),
        favoriteTasks: List.from(state.favoriteTasks),
        removedTasks: List.from(state.removedTasks)
          ..add(event.taskModel.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
