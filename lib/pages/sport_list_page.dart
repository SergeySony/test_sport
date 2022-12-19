import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_bloc.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_event.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_state.dart';
import 'package:test_project_bets/res/app_colors.dart';
import 'package:test_project_bets/res/app_text_style.dart';
import 'package:test_project_bets/widgets/cells/sport_cell.dart';
import 'package:test_project_bets/widgets/preload_widget.dart';

class SportListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SportListBloc preloadBloc = context.read<SportListBloc>();
    preloadBloc.add(SportLoadEvent());
    return BlocBuilder<SportListBloc, SportState>(
      builder: (context, state) {

        if (state is SportLoadingState) {
          return PreloadWidget();
        }
        if (state is SportLoadedState) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                height: 110.0,
                width: double.infinity,
                color: AppColors.app_bar_backround,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/main_icon.png',height: 47, width: 47)
                  ],
                )
              ),
              Expanded(child: ListView.builder(
                padding: const EdgeInsets.only(top: 0.0),
                itemCount: state.loadedSports.length,
                itemBuilder: (context, index) {
                  return SportCell(cellData: state.loadedSports[index]);
                },
              )),
            ],
          );
        }
        if (state is SportErrorState) {
          return Center(
            child: Text('Error loading users',
              style: AppTextStyle.regular18,
            ),
          );
        }
        return Text('Error return',style: AppTextStyle.regular18);
      },
    );
  }
}
