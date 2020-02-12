import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/presentation/bloc/omdb_movie_bloc.dart';
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

  @override
  void initState() {
    super.initState();

    /// TODO : take out default value search for recommendation content
    BlocProvider
        .of<OMDBMovieBloc>(context)
        .add(OMDBMovieSearchEvent(searchContent: 'Falling'));
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
          return _buildProgressBar();
        }
    );
  }

  Widget _buildCard(List<Widget> movieList) {
    return Center(
      child: Container(
        child: CarouselSlider(
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          height: 300.0,
          items: movieList,
        ),
      ),
    );
  }

  List<Widget> _moviesCard(List<OMDBMovieShortInfoEntity> omdbMovieList) {
    return omdbMovieList.map((movie) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: Image(image: NetworkImage(movie.poster),)
          );
        },
      );
    }).toList();
  }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

}

