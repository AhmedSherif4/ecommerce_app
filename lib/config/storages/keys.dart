class AppKeys {
  static const keyDark = 'isDark';
  static const completeProfile = 'completeProfile';
  static const keyLocale = 'locale';
  static const String onBoardingViewed = 'onBoardingViewed';
  static const String showcaseViewed = 'showcaseViewed';

  static const String accessToken = 'accessToken';

  static const String userData = 'userData';

  static const String contactUs = 'contactUs';

  static const String iosDeviceID = 'iosDeviceID';

  static const String termsAndConditions = 'termsAndConditions';

  static String quranPageKey(String pageNumber) => 'quran_page_key$pageNumber';

  static String subjectsKey({
    required int stageId,
    required int classRoomId,
    required int termId,
    required int pathId,
  }) =>
      'child_subjects_key_for_stage_id_${stageId}_classRoomId_${classRoomId}_termId$termId';

  static String childSubscriptionSubjectsKey({
    required int stageId,
    required int classRoomId,
    required int termId,
    required int childId,
  }) =>
      'child_Subscription_for_${childId}_${stageId}_classRoomId_${classRoomId}_termId$termId';

  static String childSubscriptionsStagesKey({required int childId}) =>
      'child_subscriptions_stages_for_$childId';

  static String childSubscriptionsClassRoomsKey({
    required int stageId,
    required int childId,
  }) =>
      'child_subscriptions_classrooms_key_for_${childId}_for_stage_id_$stageId';

  static String childSubscriptionsTermsKey({
    required int stageId,
    required int classRoomId,
    required int childId,
  }) =>
      'child_subscriptions_terms_key_for_${childId}_for_stage_id_${stageId}_classRoomId_$classRoomId';

  static String levelsKey(int subjectID) => 'levels_key_per_subject_$subjectID';

  static String lessonsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_key';

  static String lessonsByUnitsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_by_units_key';

  static String collectionKey(int levelID) =>
      'level_id_${levelID}_collection_key';

  static String examsKey(int subjectId) =>
      'subject_id_${subjectId}_lessons_key';

  static String getExpirationKey(String labelKey) =>
      '$labelKey'
      '_expiration';
}
