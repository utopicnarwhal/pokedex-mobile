import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kPokeAPIUrl = "https://pokeapi.co/api/v2/";

const kBouncingAlwaysScrollableScrollPhysics = BouncingScrollPhysics(
  parent: AlwaysScrollableScrollPhysics(),
);

const kFromSplashsceenTransitionDuration = Duration(milliseconds: 1000);

const Widget kIconArrowForward = const Icon(
  FontAwesomeIcons.angleRight,
  size: 20,
);