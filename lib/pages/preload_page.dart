import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_bloc.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_event.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_state.dart';
import 'package:test_project_bets/pages/sport_list_page.dart';
import 'package:test_project_bets/pages/web_view_page.dart';
import 'package:test_project_bets/widgets/preload_widget.dart';

class PreloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PreloadBloc preloadBloc = context.read<PreloadBloc>();
    preloadBloc.add(GetRedirectLinkEvent());
    return BlocBuilder<PreloadBloc, PreloadState>(
      builder: (context, state) {
        if (state is GoogleRedirectState) {
          return SportListPage();
        }
        if (state is ThesportsdbRedirectState) {
          return WebViewPage(initialUrl: 'https://www.thesportsdb.com/');
        }
        if (state is LoadingState) {
          return PreloadWidget();
        }
        if (state is PreloadErrorState) {
          return const Center(
            child: Text('Error loading games'),
          );
        }
        return const Text('Error return');
      },
    );
  }
}
