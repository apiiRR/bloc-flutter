part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  const RandomState(this.data);

  final DataHomeModel data;

  @override
  List<Object> get props => [data];
}

class RandomInitial extends RandomState {
  const RandomInitial(super.data);
}

class RandomLoading extends RandomState {
  const RandomLoading(super.data);
}

class RandomCompleted extends RandomState {
  const RandomCompleted(super.data);
}

class RandomError extends RandomState {
  const RandomError(super.data, this.error);

  final String error;
}
