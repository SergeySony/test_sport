import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_event.dart';
import 'package:test_project_bets/blocs/sport_list_bloc/sport_list_state.dart';
import 'package:test_project_bets/models/sport_info.dart';
import 'package:test_project_bets/services/sport_list_services/sportlist_repository.dart';

class SportListBloc extends Bloc<SportEvent, SportState> {
  SportListRepository userRepository = SportListRepository();

  SportListBloc(this.userRepository) : super(SportEmptyState()) {
    on<SportLoadEvent>((event, emit) async {
      emit(SportLoadingState());
      try {
        final List<SportInfo> _gamesList = await userRepository.getAllSports();
        emit(SportLoadedState(loadedSports: _gamesList));
      } catch (_) {
        emit(SportErrorState());
      }
    });
  }
}
