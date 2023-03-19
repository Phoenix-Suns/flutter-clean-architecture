import 'package:equatable/equatable.dart';

abstract class RepoListEvent extends Equatable {
  const RepoListEvent();

  @override
  List<Object?> get props => [];
}

class FetchRepoListEvent extends RepoListEvent {}
