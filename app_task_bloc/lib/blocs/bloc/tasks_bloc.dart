import 'dart:async';

import 'package:app_task_bloc/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  //ici à chaue event, on indique au bloc ce qu'il doit faire
  TasksBloc() : super(const TasksState()) {
    //decrivont la logique de chaque event
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

//prend en entrée un state et emet une nvel liste de tasks
  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..add(event.taskModel),
      ),
    );
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    //on prend en entrée le state et la task
    final state = this.state;
    final task = event.taskModel;
    final int index = state.allTasks.indexOf(task);

    //on MAJ la list des tasks en supprimant l'ancienne task
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);

    //on ajoute la meme task avec la valeur MAJ
    //si la valeur etaient false, alors on met true
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    //enfin on emet la nvel liste
    emit(TasksState(allTasks: allTasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(allTasks: List.from(state.allTasks)..remove(event.taskModel)),
    );
  }
}
