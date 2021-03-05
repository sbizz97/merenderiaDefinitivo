import 'package:flutter/material.dart';
import 'package:merenderia2/Home/home.dart';
import 'package:merenderia2/Torte/torte.dart';
import 'package:merenderia2/Gusti/gusti.dart';
import 'package:merenderia2/Menu/menu.dart';

class Carrello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Carrello"),
      actions: <Widget> [
        IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.amber),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Carrello()));}
        ),
        IconButton(
            icon: Icon(Icons.person, color: Colors.amber),
            onPressed: null
        )
      ],
    ),
    drawer: Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: [
          UserAccountsDrawerHeader(accountName: Text("Nome cognome"), accountEmail: Text("email"), arrowColor: Colors.black, currentAccountPicture: CircleAvatar(backgroundColor: Colors.brown, child: Icon(Icons.person, color: Colors.green),),),
        ListTile(title: Text("Home"), leading: Icon(Icons.home), onTap:(){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));} ),
        ListTile(title: Text("Crea un ordine"), leading: Icon(Icons.announcement_outlined), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));},),
          ListTile(title: Text("I gusti"), leading: Icon(Icons.icecream), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Gusti()));},),
          ListTile(title: Text("Le torte"), leading: Icon(Icons.cake), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Torte()));},),
      ],
      ),
    ),
    body: Text("Home")
    );
  }
}
