import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/custom_circular_indicator.dart';

import '../../../logic/blocs/search_bloc/search_bloc.dart';
import 'search_movies_card.dart';

class SearchScreen extends StatelessWidget {
  final inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(10),
    hintText: "Search for movie",
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red[900],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
Future <bool> handelPop(BuildContext context) async{
  SearchBloc.controller.clear();
  context.read<SearchBloc>().add(
      InitialSearchEvent()); //to remove results after back to homeScreen
  // Navigator.pop(context);
  return true;
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /*
      * check for something first and if true will pop else will ignore popping
      * that is so helpful if we need to ask user if really want close the app
      * */
      onWillPop:() => handelPop(context),
      child: Scaffold(

          body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: StaticData.size.height / 8,
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.red[600],
                    ),
                    onPressed: () {
                      handelPop(context);
                      Navigator.of(context).pop();
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * .65,
                  height: 35,
                  child: TextField(
                      controller: SearchBloc.controller,
                      cursorColor: Colors.red[900],
                      decoration: inputDecoration,
                      onChanged: (query) {
                        if (query.isNotEmpty)
                          context.read<SearchBloc>()
                            ..add(FetchSearchResults(query: query));
                      }),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.red[600],
                  ),
                  onPressed: () {
                    SearchBloc.controller.clear();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) => SearchBloc.controller.text,
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Container();
                } else if (state is SearchLoading) {
                  return Expanded(
                      child:
                          Center(child: CustomCircularIndicator(progress: .25)));
                } else if (state is SearchSuccess) {
                  return SearchMoviesCard(
                    length: state.movies.results.length,
                    searchMovies: state.movies,
                  );
                } else {
                  return Center(
                    child: Text("cannot find movie"),
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
