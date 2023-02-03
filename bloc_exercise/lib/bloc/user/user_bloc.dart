import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    on<AddUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        state.allUsers.add(event.newUser);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });
  }
}
