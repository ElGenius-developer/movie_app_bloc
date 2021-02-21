import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ToastAlertDialog {
  static void showAlert(BuildContext context, String text,{String title,IconData icon,double alignDouble}) {
    BotToast.showNotification(
      align: Alignment(1, alignDouble??-.92),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red.shade900.withAlpha(200),
      borderRadius: 20,
      onTap: BotToast.cleanAll,
      title: (cancelFunc) => Text(
        title??"Connection",
        style: Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
      ),
      contentPadding: EdgeInsets.all(
        10,
      ),
      leading: (cancelFunc) => Icon(
       icon?? Icons.wifi,
        color: Colors.white,
      ),
      subtitle: (cancelFunc) => Text(text,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.white)),
    );
  }
}
