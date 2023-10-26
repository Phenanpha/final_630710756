import 'dart:convert';
import 'dart:js_interop';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:final_630710756/models/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<TodoItem>? _itemList;
  String? _error;

  void getTodos() async {
    try {
      setState(() {
        _error = null;
      });

      // await Future.delayed(const Duration(seconds: 3), () {});

      final response =
      await _dio.get(
          'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=%E0%B8%BABangkok');
      debugPrint(response.data.toString());
      // parse
      Map list = jsonDecode(response.data.toString());
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_error != null) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_error!),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              getTodos();
            },
            child: const Text('RETRY'),
          )
        ],
      );
    } else if (_itemList == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = ListView.builder(

          itemCount: _itemList!.length,
          itemBuilder: (context, index) {
            var todoItem = _itemList![index];
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(children: [Text(todoItem.title)]),
                      Column(children: [Column(children:
                      [Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.pink.shade100),
                            padding: const EdgeInsets.all(3.0),
                            child: Text(todoItem.city.toString(),
                                style: TextStyle(fontSize: 40.0,
                                    fontWeight: FontWeight.normal))),
                      )
                      ],),
                        Column(children: [Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.lightBlue.shade100),
                              padding: const EdgeInsets.all(3.0),
                              child: Text(todoItem.country.toString(),
                                  style: TextStyle(fontSize: 20.0,
                                      fontWeight: FontWeight.normal))),
                        )
                        ],)
                      ],)
                    ],
                    )

                )
            );
          });
    }

    return Scaffold(body: body);
  }
}