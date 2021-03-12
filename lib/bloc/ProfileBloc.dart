import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_profile_page/data/DataRepository.dart';
import 'package:get_profile_page/data/model/Profile.dart';
import 'package:meta/meta.dart';

part 'ProfileEvent.dart';
part 'ProfileState.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataRepository _profileRepo;
  ProfileBloc(this._profileRepo) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
      ProfileEvent event,
      ) async* {
    try {
      if (event is GetUser) {
        yield (ProfileLoading());
        final profile = await _profileRepo.fetchUser(event.userName);
        yield (ProfileLoaded(profile));
      }
    } on UserNotFoundException {
      yield (ProfileError('This User was Not Found!'));
    }
  }
}