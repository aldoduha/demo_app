
import 'package:demo_app/util/text_form_field_custom.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SafeArea(
        child: TextFormFieldCustom(
          icon: IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              /// TODO : call function search when icon pressed
            },
          ),
        ),
      ),
    );
  }

}
