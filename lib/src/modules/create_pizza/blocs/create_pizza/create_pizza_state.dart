part of 'create_pizza_bloc.dart';

abstract class CreatePizzaState extends Equatable {
  const CreatePizzaState();

  @override
  List<Object> get props => [];
}

class CreatePizzaInitial extends CreatePizzaState {}

class CreatePizzaLoading extends CreatePizzaState {}

class CreatePizzaSuccess extends CreatePizzaState {}

class CreatePizzaFailure extends CreatePizzaState {}
