import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nghia_flutter_clean/features/data/models/repo.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_bloc.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_event.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_state.dart';

class RepoListBlocPage extends StatefulWidget {
  const RepoListBlocPage({super.key});

  @override
  _RepoListBlocPageState createState() => _RepoListBlocPageState();
}

class _RepoListBlocPageState extends State<RepoListBlocPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Bloc")),
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
                      context.read<RepoListBloc>().add(FetchRepoListEvent());
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
                  context.read<RepoListBloc>().add(FetchRepoListEvent());
                },
              ),
              Expanded(
                child: BlocBuilder<RepoListBloc, RepoListState>(
                  builder: (context, state) {
                    if (state is RepoListLoadedState) {
                      // === Handle State Return
                      if (state.loading == true) {
                        return Text("Loading...");
                      }
                      if (state.errorMsg != null) {
                        return Text('Error: ${state.errorMsg ?? ''}');
                      }
                      if (state.repos != null) {
                        return RepoListWidget(
                          repos: state.repos!,
                        );
                      }
                    }
                    return Text("Click Search To Start");
                  },
                ),
              )
            ])));
  }
}

class RepoListWidget extends StatelessWidget {
  final List<Repo> repos;

  const RepoListWidget({required this.repos});

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
