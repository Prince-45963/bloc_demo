import 'package:bloc_demo/blocs/post_bloc/post_blocs.dart';
import 'package:bloc_demo/blocs/post_bloc/post_events.dart';
import 'package:bloc_demo/blocs/post_bloc/post_state.dart';
import 'package:bloc_demo/model/post_model.dart';
import 'package:bloc_demo/utils/list_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPostEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Expanded(flex:1,child: TextFormField(onChanged: (value){
            context.read<PostBloc>().add(SearchPostEvent(id: value));
          },decoration: InputDecoration(hintText: "Search with Id"),)),
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if(state.status==ListStatus.Laoding){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(state.message!.isNotEmpty){
                return Expanded(
                  child: Center(
                    child: Text(state.message!),
                  ),
                );
              }
              else {
                return Expanded(
                  flex: 9,
                  child: ListView.builder(itemCount:(state.tempPostList!=null && state.tempPostList!.isNotEmpty) ?  state.tempPostList?.length : state.postList?.length,
                      itemBuilder: (context, index) {
                    PostModel item = (state.tempPostList!=null && state.tempPostList!.isNotEmpty) ?  state.tempPostList![index] : state.postList![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Id: ${item.id.toString()}"),
                                Text("Title: ${item.title.toString()}"),
                                Text("Body: ${item.body.toString()}")
                            
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
