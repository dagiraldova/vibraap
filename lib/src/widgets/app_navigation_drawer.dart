import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(

        color: Colors.grey.shade900 ,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
           // AppButton(color: Colors.grey.shade900, onPressed: (){Navigator.pushNamed(context, '/order');}, name: "Pedidos")
          buildMenuItem(text: "Home", icon: Icons.home_outlined, iconColor: Colors.orange.shade300 , onTap:(){Navigator.pushNamed(context, '/order');}),
          buildMenuItem(text: "Pedidos", icon: Icons.location_on, iconColor: Colors.orange.shade300, onTap:(){Navigator.pushNamed(context, '/order');}),
           buildMenuItem(text: "Productos", icon: Icons.shop, iconColor: Colors.orange.shade300, onTap:(){Navigator.pushNamed(context, '/productos');}),
          ],
        ),
        ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap
  }){
    final color  = Colors.grey.shade50;
    final hoverColor = Colors.orange.shade300;

    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text, style: TextStyle(color: color)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      hoverColor: hoverColor,
      onTap: onTap,
    );

  }


}
