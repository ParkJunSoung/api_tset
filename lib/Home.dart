import 'package:api_test/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
@override
  void initState() {
  Provider.of<PixInfo>(context, listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var list = context.read<PixInfo>();
    return SingleChildScrollView(
      child: Material(
        child: Column(
          children: [
            TextField(
              controller: list.controller,
              onChanged: (text) {
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(40)),
                labelText: '검색',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext content, int index) {
                return Column(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        '${list.result!.hits![index].largeImageURL}',
                        width: 250,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    Text('${list.result!.hits![index].tags}')
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
