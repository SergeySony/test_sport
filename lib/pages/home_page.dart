import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_bloc.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_bloc.dart';
import 'package:test_project_bets/pages/preload_page.dart';
import 'package:test_project_bets/res/app_colors.dart';
import 'package:test_project_bets/services/preload_services/preload_repository.dart';
import 'package:test_project_bets/services/sport_list_services/sportlist_repository.dart';

class HomePage extends StatelessWidget {
  final preloadRepository = PreloadRepository();
  final sportListRepository = SportListRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreloadBloc>(
          create: (BuildContext context) => PreloadBloc(preloadRepository),
        ),
        BlocProvider<SportListBloc>(
          create: (BuildContext context) => SportListBloc(sportListRepository),
        )
      ],
      child: Scaffold(
        backgroundColor: AppColors.main_dark_backround,
        body: PreloadPage(),
      ),
    );
  }
}
