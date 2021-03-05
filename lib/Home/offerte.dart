
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merenderia2/Home/card.dart';
import 'card.dart';
class Offerte extends StatelessWidget {

  final OfferteCard _offerteCard = OfferteCard();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          _offerteCard
      ],
    );
  }
}
