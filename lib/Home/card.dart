import 'package:flutter/material.dart';

class OfferteCard extends StatelessWidget {

  Color getColorLabel(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }

  Color getColorBG(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          width: double.maxFinite,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Offerta"),
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(getColorLabel),
                        backgroundColor: MaterialStateProperty.resolveWith(getColorBG)
                      ),
                        onPressed: (){print("cliccato");},
                        child: Text("Aggiungi al carrello")
                    ),
                    const SizedBox(width: 20)
                  ],
                ),
              ],
            ),
          ),
        );
  }

}
