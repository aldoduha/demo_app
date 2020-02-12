import 'dart:ui';

import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/presentation/bloc/omdb_movie_bloc.dart';
import 'package:demo_app/util/progress_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<OMDBMovieShortInfoEntity> _omdbMovieList;

  String imageURL;


  @override
  void initState() {
    super.initState();

    /// TODO : take out default value search for recommendation content
    BlocProvider
        .of<OMDBMovieBloc>(context)
        .add(OMDBMovieSearchEvent(searchContent: 'Love'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OMDBMovieBloc, OMDBMovieState>(
        listener: (context, state) {
          print('execute listener');
        },
        builder: (context, state) {
          if (state is OMDBMovieDataState) {
            _omdbMovieList = state.omdbMovieList;
            List<Widget> movieList = _moviesCard(_omdbMovieList);

            return _buildCard(movieList);
          }
          return ProgressBarIndicator();
        }
    );
  }

  Widget _setBackground() {
    if(imageURL == null) {

      /// TODO : remove default image and handle when the imageURL is null
      imageURL = 'https://m.media-amazon.com/images/M/MV5BOTc1ODY5MTQ1Nl5BMl5BanBnXkFtZTgwMDM5ODI1NjE@._V1_SX300.jpg';
    }
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: NetworkImage(imageURL),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> movieList) {
    return Scaffold(

      body: Stack(
        children: <Widget>[

          _setBackground(),

          Center(
            child: Container(
              child: CarouselSlider(
                onPageChanged: (index) {
                  setState(() {
                    imageURL = _omdbMovieList[index].poster;
                  });
                },
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                height: 400.0,
                items: movieList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _moviesCard(List<OMDBMovieShortInfoEntity> omdbMovieList) {
    return omdbMovieList.map((movie) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              decoration: BoxDecoration(color: Colors.white30.withOpacity(0.2)),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image(
                  image: NetworkImage(movie.poster),
                ),
              )
          );
        },
      );
    }).toList();
  }

}

