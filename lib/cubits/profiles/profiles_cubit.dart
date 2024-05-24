import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app2/models/profile.dart';
import 'package:notes_app2/utils/constants.dart';

part 'profiles_state.dart';

class ProfilesCubit extends Cubit<ProfilesState> {
  ProfilesCubit() : super(ProfilesInitial());

  /// Map of app users cache in memory with profile_id as the key
  final Map<String, Profile?> _profiles = {};

  Future<void> getProfile(String userId) async {
    if (_profiles[userId] != null) {
      return;
    }

    final data = await supabase
        .from('profiles')
        .select()
        .match({'id': userId}).single();

    if (data == null) {
      return;
    }
    _profiles[userId] = Profile.fromMap(data);

    emit(ProfilesLoaded(profiles: _profiles));
  }
}
