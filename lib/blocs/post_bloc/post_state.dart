import 'package:equatable/equatable.dart';

import '../../model/post_model.dart';
import '../../utils/list_status.dart';
class PostState extends Equatable {

  List<PostModel>? postList;
  List<PostModel>? tempPostList;

  ListStatus? status;
  String? message;
  String? searchMessage = '';

  PostState({this.postList,this.status = ListStatus.Laoding,this.message,this.searchMessage = '',this.tempPostList});

  PostState copyWith({List<PostModel>? postList, ListStatus? status, String? message,List<PostModel>? tempPostList}){
    return PostState(postList: postList ?? this.postList,status: status ?? this.status,message:message ?? this.message,searchMessage: searchMessage ?? this.searchMessage,tempPostList: tempPostList ?? this.tempPostList );

  }


  @override
  List<Object?> get props => [postList,status,message,searchMessage,tempPostList];
}



