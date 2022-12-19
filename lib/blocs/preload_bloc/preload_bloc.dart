import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_event.dart';
import 'package:test_project_bets/blocs/preload_bloc/preload_state.dart';
import 'package:test_project_bets/services/preload_services/preload_repository.dart';

class PreloadBloc extends Bloc<PreloadEvent, PreloadState> {
  PreloadRepository preloadRepository = PreloadRepository();

  PreloadBloc(this.preloadRepository) : super(LoadingState()) {
    on<GetRedirectLinkEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final String? _redirectUrl = await preloadRepository.getRedirectUrl();
        if (_redirectUrl == 'https://google.com/') {
          emit(GoogleRedirectState());
        }
        if (_redirectUrl == 'https://www.thesportsdb.com/') {
          emit(ThesportsdbRedirectState());
        }
      } catch (_) {
        emit(PreloadErrorState());
      }
    });
  }
}
