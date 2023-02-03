part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class AddUserEvent extends UserEvent {
  const AddUserEvent(this.newUser);

  final User newUser;
}
