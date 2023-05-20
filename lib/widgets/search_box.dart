import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../models/costume.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Costume> _searchResult = [];
  List<Costume> costumeList = Costume.costumeList;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildUsersList() {
    return new ListView.builder(
      itemCount: costumeList.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            title: new Text(costumeList[index].costumeName),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return new ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, i) {
        return new Card(
          child: new ListTile(
            title: new Text(
                _searchResult[i].costumeName),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Container(
            color: Theme.of(context).primaryColor, child: _buildSearchBox()),
        new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? _buildSearchResults()
                : _buildUsersList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      resizeToAvoidBottomInset: true,
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    costumeList.forEach((userDetail) {
      if (userDetail.costumeName.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }
}