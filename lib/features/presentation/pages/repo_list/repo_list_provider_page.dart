import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/presentation/main/main.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_bloc.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/provider/repo_list2_state.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/provider/repo_list_viewmodel.dart';
import 'package:provider/provider.dart';

class RepoListProviderPage extends StatefulWidget {
  const RepoListProviderPage({super.key});

  @override
  _RepoListProviderPageState createState() => _RepoListProviderPageState();
}

class _RepoListProviderPageState extends State<RepoListProviderPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final RepoListViewModel vm = RepoListViewModel(dependencies.fetchRepoListUseCase);
    final vm = Provider.of<RepoListViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(title: Text("Provider")),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      //context.read<RepoListBloc>().add(FetchRepoListEvent());
                      vm.fetchRepoList();
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              ElevatedButton(
                child: Text('Search'),
                onPressed: () {
                  vm.fetchRepoList();
                },
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  var state = vm.repoListLoadedState;
                  if (state.loading == true) {
                    return Text("Loading...");
                  }
                  if (state.errorMsg != null) {
                    return Text('Error: ${state.errorMsg ?? ''}');
                  }
                  if (state.repos != null) {
                    return RepoList2Widget(repos: state.repos!,);
                  }
                  return Text("Click Search To Start");
                }),
              ),
            ])));
  }
}

class RepoList2Widget extends StatelessWidget {
  final List<Repo> repos;

  const RepoList2Widget({required this.repos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.repos.length,
      itemBuilder: (context, index) {
        final movie = this.repos[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(movie.poster)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(movie.title),
        );
      },
    );
  }
}
