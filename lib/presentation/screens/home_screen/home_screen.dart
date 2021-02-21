import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/internet_bloc/internet_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/drawer.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/custom_circular_indicator.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/toast_dialog_method/show_toast_alert.dart';

import 'home_screen_body/home_screen_body.dart';
import 'navigation_bar.dart';

class HomeScreen extends StatelessWidget {
int counter=0;

  @override
  Widget build(BuildContext context) {

    // initialize global size for whole app
    bool exit = false;
    StaticData.size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        showCupertinoDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 55,
            scrollable: true,
            title: Text("Alert"),
            content: Text("Are you want to exit"),
            actions: [
              FlatButton(
                  onPressed: () {
                    exit = true;
                    SystemNavigator.pop();
                  },
                  child: Text(
                    "yes",
                  )),
              FlatButton(
                  onPressed: () {
                    exit = false;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "No",
                  )),
            ],
          ),
        );
        return exit;
      },
      child: Scaffold(
        drawer: HomeDrawer(),
      //Drawer
        appBar: AppBar(
          toolbarHeight: StaticData.size.height / 12.5,
          title: Text(StaticData()
              .categoriesNames[context.watch<MoviesBloc>().categoryNumber]),
          actions: [
            IconButton(
              tooltip: "favourite",
              onPressed: () {
                Navigator.pushNamed(context, "/favourites");
              },
              icon: IconShadowWidget(
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                shadowColor: Colors.black12,
              ),
            ),
            IconButton(
              tooltip: "search",
              onPressed: () {
                Navigator.pushNamed(context, "/searchScreen");
              },
              icon: IconShadowWidget(
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                shadowColor: Colors.black12,
              ),
            )
          ],
        ),

        body: StreamBuilder(
          stream: context.watch<InternetBloc>().connectivity.onConnectivityChanged,
           builder: (context, snapshot) {
             print(snapshot);
             if (snapshot.data == ConnectivityResult.none) {
               ToastAlertDialog.showAlert(
                   context,"No internet ");
               return Center(
                 child: Text("no internet Connection"),
               );

             } else {
              return  BlocBuilder<MoviesBloc, MoviesState>(
                   builder: (context, state) {
                   if(counter==0){
                     ToastAlertDialog.showAlert(
                         context,"Internet connected");
                     counter++;
                   }
                     if (state is LoadingState) {
                       return Center(
                         child: CustomCircularIndicator(
                           progress: .32,
                         ),
                       );
                     }
                     else if (state is SuccessState) {

                       return HomeScreenBody();
                     } else {

                       return Center(
                         child: Text("Sorry We faced some errors"),
                       );
                     }
                   });
             }
          },
        ),
        bottomNavigationBar: NavigationBar(),
      ),
    );
  }
}
