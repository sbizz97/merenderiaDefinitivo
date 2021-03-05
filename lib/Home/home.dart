import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:merenderia2/Home/offerte.dart';
import 'package:merenderia2/Login/google_sign_in.dart';
import 'package:merenderia2/Login/login.dart';
import 'package:merenderia2/Menu/menu.dart';
import 'package:merenderia2/Gusti/gusti.dart';
import 'package:merenderia2/Torte/torte.dart';
import 'package:merenderia2/Carrello/carrello.dart';
import 'package:merenderia2/wrapper.dart';

class Home extends StatelessWidget {
/*
  Widget showAccountDrawer(String name, String email){
    if((name == null) && (email == null)){
      return (Text("ababab"));
    }
    else {
      return (UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email), arrowColor: Colors.black, currentAccountPicture: CircleAvatar(backgroundColor: Colors.brown, backgroundImage: NetworkImage('$imageUrl'),),));
    }
  }
*/

  final Authservice _authservice = Authservice();
  final Offerte _offerte = Offerte();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Offerte del giorno"),
          actions: <Widget> [
            IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.amber),
                onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Carrello()));}
            ),
            IconButton(
                icon: Icon(Icons.person, color: Colors.amber),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: DrawerTop(),
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
              ),
              ListTile(title: Text("Crea un ordine"), leading: Icon(Icons.announcement_outlined), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));},),
              ListTile(title: Text("I gusti"), leading: Icon(Icons.icecream), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Gusti()));},),
              ListTile(title: Text("Le torte"), leading: Icon(Icons.cake), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Torte()));},),
              ListTile(title: Text("Carrello"), leading: Icon(Icons.shopping_cart), onTap:(){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Carrello()));} ),
            ],
          ),
        ),
        body: _offerte
    );
  }
  Widget DrawerTop(){
    if((_authservice.email != null) && (_authservice.name != null)){
      return UserAccountsDrawerHeader(accountName: Text(_authservice.name), accountEmail: Text(_authservice.email), arrowColor: Colors.black, currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(_authservice.imageUrl),),);}
    else
      return Text("accedi");
  }

  Widget _buildUserInfo(Authservice bloc) {
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder: (BuildContext context, AsyncSnapshot<GoogleSignInAccount> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Text('No info!!!'),
          );
        }
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Name: '), Text(snapshot.data.displayName.toString())],
            ),
            Row(
              children: <Widget>[Text('Email: '), Text(snapshot.data.email)],
            ),
            Row(
              children: <Widget>[Text('Id: '), Text(snapshot.data.id)],
            ),
            Image.network(
              snapshot.data.photoUrl.toString(),
              width: 200.0,
              height: 200.0,
            ),
          ],
        );
      },
    );
  }

}
