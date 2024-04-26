import 'package:equatable/equatable.dart';
abstract class PostEvent extends Equatable {

}

class FetchPostEvents extends PostEvent{

  @override
  List<Object?> get props => [];

}

class SearchPostEvent extends PostEvent{
  String? id;
  SearchPostEvent({this.id});

  @override
  List<Object?> get props => [id];

}