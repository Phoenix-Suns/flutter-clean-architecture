import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nghia_flutter_clean/features/presentation/main/configure_dependencies.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/bloc/repo_list_bloc.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/home_page.dart';
import 'package:nghia_flutter_clean/features/presentation/pages/repo_list/provider/repo_list_viewmodel.dart';
import 'package:provider/provider.dart';

//late final ConfigureDependenciesManual dependencies;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  //await dependencies.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RepoListViewModel(getIt())),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RepoListBloc(getIt()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
