import 'package:equatable/equatable.dart';
import 'package:bloc_flutter/models/album_list.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumsState {} // init album state

class AlbumsLoading extends AlbumsState {} // // load album state

class AlbumsLoaded extends AlbumsState {
  final List<Album> albums;

  const AlbumsLoaded({required this.albums});

  @override
  List<Object> get props => [];
}

class AlbumsListError extends AlbumsState {
  final error;

  const AlbumsListError({this.error});

  @override
  List<Object> get props => [];
}
