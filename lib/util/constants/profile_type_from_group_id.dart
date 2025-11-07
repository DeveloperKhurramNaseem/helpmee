import 'dart:developer';

enum ProfileType { personal, sos, pet }

ProfileType getProfileType(int groupId) {
  log('Group Id : $groupId');
  return switch (groupId) {
    9 => ProfileType.personal,
    8 => ProfileType.sos,
    7 => ProfileType.pet,
    10 => ProfileType.personal,
    2 => ProfileType.personal,
    3 => ProfileType.personal,
    _ => ProfileType.personal,
  };
}
