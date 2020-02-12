import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/presentation/bloc/omdb_movie_bloc.dart';
import 'package:demo_app/util/progress_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Color> _cardThemeColor = [Colors.orange, Colors.lightGreen];

Color _color(int index) {
  if (index % 2 == 0) {
    return _cardThemeColor[0];
  } else
    return _cardThemeColor[1];
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();

    /// TODO : take out default value search for recommendation content
    BlocProvider.of<OMDBMovieBloc>(context)
        .add(OMDBMovieSearchEvent(searchContent: 'Love'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OMDBMovieBloc, OMDBMovieState>(
        listener: (context, state) {
      print('execute listener');
    }, builder: (context, state) {
      if (state is OMDBMovieDataState) {
        return _listViewMovie(state.omdbMovieList);
      }
      return ProgressBarIndicator();
    });
  }

  Widget _listViewMovie(List<OMDBMovieShortInfoEntity> omdbMovieList) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: omdbMovieList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 200,
                    width: double.maxFinite,
                    child: _MoviesCard(
                      index: index,
                      omdbMovie: omdbMovieList[index],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _MoviesCard extends StatelessWidget {
  final OMDBMovieShortInfoEntity omdbMovie;
  final int index;

  const _MoviesCard({Key key, this.index, this.omdbMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: _color(index)),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            _showMoviePoster(),
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _showMovieTitleAndDescription(),
                      _buttonAddFavorite(index),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  MaterialButton _buttonAddFavorite(int index) {
    return RaisedButton(
      onPressed: () {},
      child: Text('Add to Favorite'),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      highlightElevation: 1,
      elevation: 6,
      splashColor: _color(index),
    );
  }

  Widget _showMoviePoster() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500],
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Image.network(omdbMovie.poster, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _showMovieTitleAndDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          omdbMovie.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.only(right: 0),
          child: Container(
            height: 6.0,
            width: 5.0,
            color: Colors.black12,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            Text(
              'Year :',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 6),
            Text(
              omdbMovie.year,
              style: TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
