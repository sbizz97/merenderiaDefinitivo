import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merenderia2/Menu/menu.dart';
import 'package:merenderia2/Gusti/gusti.dart';
import 'package:merenderia2/Torte/torte.dart';
import 'package:merenderia2/Carrello/carrello.dart';
import 'package:merenderia2/Home/home.dart';
import 'package:merenderia2/Login/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Authservice _authservice = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.amber),
              onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Carrello()));}
          ),
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
              ListTile(title: Text("Home"), leading: Icon(Icons.announcement_outlined), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));},),
              ListTile(title: Text("Crea un ordine"), leading: Icon(Icons.announcement_outlined), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));},),
              ListTile(title: Text("I gusti"), leading: Icon(Icons.icecream), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Gusti()));},),
              ListTile(title: Text("Le torte"), leading: Icon(Icons.cake), onTap: (){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Torte()));},),
              ListTile(title: Text("Carrello"), leading: Icon(Icons.shopping_cart), onTap:(){Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => Carrello()));} ),
            ],
          ),
        ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _signInButtonLocal(context),
              SizedBox(height: 100),
              _signInButtonGoogle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonLocal(context){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/img_login.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with email',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButtonGoogle() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
          dynamic result =  await _authservice.signInWithGoogle();
          if (result == null){
            print("errore di sign in");
          } else {
            print("sign in avvenuto");
            print(result);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget DrawerTop(){
    if((_authservice.email != null) && (_authservice.name != null)){
      return UserAccountsDrawerHeader(accountName: Text(_authservice.name), accountEmail: Text(_authservice.email), arrowColor: Colors.black, currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(_authservice.imageUrl),),);}
    else
      return Text("accedi");
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Log-in'),

      content: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Inserire nickname';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Inserisci nickname",
                    border: OutlineInputBorder()
                ),
                onChanged: (value){

                },
              ),
              SizedBox(height: 40.0),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Inserire password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Inserisci password",
                    border: OutlineInputBorder()
                ),
                onChanged: (value){

                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black
                    ),
                    child: Text("ABABAB"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: const Text('Log in'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.black),
                      onPressed: null,
                      child: Text("Log-in")
                  ),
                  FlatButton(
                      onPressed: (){
                        showDialog(
                          context: context,
                          //builder: (BuildContext context) => _buildPopUpReg(context),
                        );
                      },
                      child: Text("Registrati")
                  )
                ],
              )
            ],
          ),
      ),
    );
  }

  /*
  Widget _buildPopUpReg(BuildContext context){
    return AlertDialog(
      title: const Text('Registrati'),
      content: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text("Inserisci email"),
            TextFormField(
              onChanged: (value){

              },
            ),
            SizedBox(height: 10.0),
            Text("Inserisci nickname"),
            TextFormField(
              onChanged: (value){

              },
            ),
            SizedBox(height: 10.0),
            Text("Inserisci password"),
            TextFormField(
              obscureText: true,
              onChanged: (value){

              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Log in'),
        ),
        FlatButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupReg(context),
              );
            },
            child: Text("Registrati")
        )
      ],
    );
  }

   */
}