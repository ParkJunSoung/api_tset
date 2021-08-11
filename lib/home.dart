import 'package:api_test/home_view_model.dart';
import 'package:api_test/widget/image_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<HomeViewModel>().fetch();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final isLoading = viewModel.isLoading;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API test'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.fetch(query: _textController.text);
                },
                child: Text('검색'),
              )
            ],
          ),
          Expanded(
            child: isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.items.length,
              itemBuilder: (_, index) {
                return ImageItem(viewModel.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}