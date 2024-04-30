import 'package:bloc/bloc.dart';
import 'package:bloc_demo/blocs/post_bloc/post_events.dart';
import 'package:bloc_demo/blocs/post_bloc/post_state.dart';
import 'package:bloc_demo/utils/list_status.dart';

import '../../model/post_model.dart';
import '../../repository/post_repository.dart';
class PostBloc extends Bloc<PostEvent,PostState>{

PostRepository? postRepository;
List<PostModel>? tempPostList;

  PostBloc({this.postRepository,this.tempPostList}):super(PostState()){
    on<FetchPostEvents>(_fetchPost);
    on<SearchPostEvent>(searchPostList);

  }

  Future<void> _fetchPost(FetchPostEvents event, Emitter<PostState> emit) async{
   await postRepository?.getPostList().then((value){
     emit(state.copyWith(postList: value,status: ListStatus.Success,message: ""));

   }).onError((error, stackTrace){
     emit(state.copyWith(status: ListStatus.Failed,message: error.toString()));

   });


  }

  void searchPostList(SearchPostEvent event, Emitter<PostState> emit){
    tempPostList = state.postList?.where((element)
    {
     if(element.id.toString() == event.id){
       return true;
     }else{
       return false;
     }
    }).toList();

    if(event.id== null || event.id!.isEmpty){

      emit(state.copyWith(status: ListStatus.Success,message: "",tempPostList: []));

    }else {
      if(tempPostList==null || tempPostList!.isEmpty){
        emit(state.copyWith(status: ListStatus.Failed, message: "No data found"));
      }else {
        emit(state.copyWith(
            tempPostList: tempPostList,
            status: ListStatus.Success,
            message: ""));
      }
    }
  }

}