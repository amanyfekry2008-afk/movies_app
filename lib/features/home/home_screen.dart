
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/home/cubit/home_cubit.dart';
import 'package:movies_app/features/home/cubit/home_state.dart';
import 'package:movies_app/features/home/widgets/banner_section.dart';
import 'package:movies_app/features/home/widgets/movies_category_section.dart';

class HomeScreen extends StatefulWidget {

final void Function(String genre)
onSeeMore;

const HomeScreen({
super.key,
required this.onSeeMore,
});

@override
State<HomeScreen> createState() =>
_HomeScreenState();
}

class _HomeScreenState
extends State<HomeScreen> {

final List<String> genres = [

'Action',

'Drama',

'Comedy',

'Sci-Fi',

'Horror',
];

late String randomGenre;

@override
void initState() {
super.initState();

genres.shuffle(
Random(),
);

randomGenre =
genres.first;
}

@override
Widget build(BuildContext context) {

return BlocProvider(
create: (context) =>
HomeCubit()
..getMovies(),

child: Scaffold(
backgroundColor:
AppColors.black,

body: SafeArea(
child:
BlocBuilder<
HomeCubit,
HomeState>(
builder:
(context, state) {

if (state
is HomeLoading) {

return const Center(
child:
CircularProgressIndicator(),
);
}

if (state
is HomeError) {

return Center(
child: Text(
state.errorMessage,

style:
const TextStyle(
color:
Colors.white,
),
),
);
}

if (state
is HomeSuccess) {

return ListView(
children: [

BannerSection(
movies:
state.bannerMovies,
),

const SizedBox(
height: 32,
),

MoviesCategorySection(
title:
randomGenre,

movies:
randomGenre ==
'Action'
? state.actionMovies
    : randomGenre ==
'Drama'
? state.dramaMovies
    : randomGenre ==
'Comedy'
? state.comedyMovies
    : state.sciFiMovies,

onSeeMore:
widget.onSeeMore,
),

const SizedBox(
height: 32,
),
],
);
}

return const SizedBox();
},
),
),
),
);
}
}

