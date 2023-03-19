import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/repo_list_bloc_page.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/repo_list_provider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('Repo List by Bloc'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepoListBlocPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text('Repo List by Provider'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepoListProviderPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}