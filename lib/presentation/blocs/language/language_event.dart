class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent{
  final String language;

  ChangeLanguageEvent(this.language);
}