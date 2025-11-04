import 'package:bloc/bloc.dart';
import 'package:help_mee/domain/repositories/user_profile_repo.dart';
import 'package:meta/meta.dart';

part 'update_disease_event.dart';
part 'update_disease_state.dart';

class UpdateDiseaseBloc extends Bloc<UpdateDiseaseEvent, UpdateDiseaseState> {
  final UserProfileRepo userProfileRepo;
  UpdateDiseaseBloc(this.userProfileRepo) : super(UpdateDiseaseInitialState()) {
    on<UpdateDiseaseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
