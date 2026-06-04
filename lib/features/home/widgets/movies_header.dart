
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text.dart';

class MoviesHeader
extends StatelessWidget {

final String title;

final void Function(String genre)
onSeeMore;

const MoviesHeader({
super.key,
required this.title,
required this.onSeeMore,
});

@override
Widget build(BuildContext context) {

return Padding(
padding:
const EdgeInsets.symmetric(
horizontal: 16,
),

child: Row(
children: [

Text(
title,

style:
AppText.regular.copyWith(
color:
AppColors.white,
),
),

const Spacer(),

InkWell(
onTap: () {

onSeeMore(
title,
);
},

child: Text(
'See More',

style:
AppText.regular.copyWith(
color:
AppColors.yellow,
),
),
),

const SizedBox(
width: 3,
),

const Icon(
Icons.arrow_forward_ios,

color:
AppColors.yellow,

size: 12,
),
],
),
);
}
}

