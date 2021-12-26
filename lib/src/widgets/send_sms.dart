// ignore_for_file: import_of_legacy_library_into_null_safe, override_on_non_overriding_member, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sendsms/sendsms.dart';

class SendSms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.green,
        child: Text("Enviar SMS"),
        onPressed: () async {
          String phoneNumber = "+573137421964";
          String phoneNumber2 = "+573117286992";
          String phoneNumber3 = "+573104695891";
          String phoneNumber4 = "+573113521384";
          String phoneNumber5 = "+573148942838";
          String message = "Su pedido se encuentra listo";

          await Sendsms.onGetPermission();

          if (await Sendsms.hasPermission()) {
            await Sendsms.onSendSMS(phoneNumber, message);
            await Sendsms.onSendSMS(phoneNumber2, message);
            await Sendsms.onSendSMS(phoneNumber3, message);
            await Sendsms.onSendSMS(phoneNumber4, message);
            await Sendsms.onSendSMS(phoneNumber5, message);
          }
        },
      ),
    );
  }
}
