import 'package:bloc_first/bloc/list_bloc/list_bloc.dart';
import 'package:bloc_first/bloc/list_bloc/list_events.dart';
import 'package:bloc_first/bloc/list_bloc/list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => ListBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
        List<Map<String, dynamic>> mapData = state.mData;
        return ListView.builder(
            itemCount: mapData.length,
            itemBuilder: (_, index) {
              Map<String, dynamic> eachMap = mapData[index];
              return ListTile(
                onTap: () {
                  BlocProvider.of<ListBloc>(context).add(UpdateMapEvent(
                      updateMap: {"title": "Update Hello", "desc": "world"},
                      index: index));
                },
                trailing: IconButton(
                    onPressed: () {
                      context
                          .read<ListBloc>()
                          .add(DeleteMapEvent(index: index));
                    },
                    icon: const Icon(Icons.delete)),
                // leading: IconButton(
                //     onPressed: () {
                //       BlocProvider.of<ListBloc>(context).add(UpdateMapEvent(
                //           updateMap: {"title": "Update Hello", "desc": "world"},
                //           index: index));
                //     },
                //     icon: const Icon(Icons.edit)),
                title: Text("${eachMap['title']} ${index + 1}"),
                subtitle: Text(eachMap['desc']),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListBloc>()
              .add(AddMapEvent(newMap: {"title": "Hello", "desc": "World"}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
