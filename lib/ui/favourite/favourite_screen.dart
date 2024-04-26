import 'package:bloc_demo/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:bloc_demo/blocs/favourite_bloc/favourite_event.dart';
import 'package:bloc_demo/blocs/favourite_bloc/favourite_state.dart';
import 'package:bloc_demo/model/favourite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/list_status.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});


  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if(state.favouriteList.any((FavouriteModel data) => data.isDeleting==true)) {
            return GestureDetector(onTap:(){
              context.read<FavouriteBloc>().add(RemoveFavouriteEvent());

            },child: Icon(Icons.delete));
          }else{
            return SizedBox.shrink();
          }
  },
)],),
        body: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            print("rebuild");

            if(state.listStatus==ListStatus.Laoding){
              return Center(child: CircularProgressIndicator());
            }else {
              return ListView.builder(
                  itemCount: state.favouriteList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Checkbox(
                            value: state.favouriteList[index].isDeleting,
                            onChanged: (value) {
                              FavouriteModel item = state.favouriteList[index];

                              context.read<FavouriteBloc>().add(SelectUnselectEvent(
                                  favouriteModel: item));
                            }),
                        Text("${state.favouriteList[index].value} $index",style:state.favouriteList[index].isDeleting ? TextStyle(decoration: TextDecoration.lineThrough) : TextStyle(),),

                        IconButton(onPressed: () {
                          FavouriteModel item = state.favouriteList[index];

                          context.read<FavouriteBloc>().add(AddFavouriteEvent(
                              favouriteModel: item));
                        },
                            icon: state.favouriteList[index].isFavourite
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border))
                      ],
                    );
                  });
            }
          },
        )
    );
  }
}
