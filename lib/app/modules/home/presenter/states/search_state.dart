import 'package:equatable/equatable.dart';
import 'package:git_stalck/app/modules/home/domain/entities/result_item_entity.dart';

abstract class SearchState extends Equatable {}

class SearchInitialState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchFailureState extends SearchState {
  final String message;

  SearchFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchSuccessState extends SearchState {
  final List<ResultItemEntity> resultItem;

  SearchSuccessState({required this.resultItem});

  @override
  List<Object?> get props => [resultItem];
}
