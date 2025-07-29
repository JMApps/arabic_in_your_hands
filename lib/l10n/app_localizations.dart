import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @tableNameFirstVolChapters.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_first_chapters_ru'**
  String get tableNameFirstVolChapters;

  /// No description provided for @tableNameFirstVolSubChapters.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_first_sub_chapters_ru'**
  String get tableNameFirstVolSubChapters;

  /// No description provided for @tableNameFirstVolContents.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_first_contents_ru'**
  String get tableNameFirstVolContents;

  /// No description provided for @tableNameSecondVolChapters.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_second_chapters_ru'**
  String get tableNameSecondVolChapters;

  /// No description provided for @tableNameSecondVolSubChapters.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_second_sub_chapters_ru'**
  String get tableNameSecondVolSubChapters;

  /// No description provided for @tableNameSecondVolContents.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_second_contents_ru'**
  String get tableNameSecondVolContents;

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Арабский перед тобой'**
  String get appName;

  /// No description provided for @firstVolume.
  ///
  /// In ru, this message translates to:
  /// **'Том 1'**
  String get firstVolume;

  /// No description provided for @secondVolume.
  ///
  /// In ru, this message translates to:
  /// **'Том 2'**
  String get secondVolume;

  /// No description provided for @dictionary.
  ///
  /// In ru, this message translates to:
  /// **'Словарь'**
  String get dictionary;

  /// No description provided for @dictionaryBaranov.
  ///
  /// In ru, this message translates to:
  /// **'Словарь Баранова'**
  String get dictionaryBaranov;

  /// No description provided for @words.
  ///
  /// In ru, this message translates to:
  /// **'Слова'**
  String get words;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @share.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get share;

  /// No description provided for @sharePicture.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться картинкой'**
  String get sharePicture;

  /// No description provided for @androidVersion.
  ///
  /// In ru, this message translates to:
  /// **'Версия Android'**
  String get androidVersion;

  /// No description provided for @iosVersion.
  ///
  /// In ru, this message translates to:
  /// **'Версия iOS'**
  String get iosVersion;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @change.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get change;

  /// No description provided for @copy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано'**
  String get copied;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @priority.
  ///
  /// In ru, this message translates to:
  /// **'Приоритет'**
  String get priority;

  /// No description provided for @categories.
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get categories;

  /// No description provided for @searchCategories.
  ///
  /// In ru, this message translates to:
  /// **'Поиск категорий...'**
  String get searchCategories;

  /// No description provided for @addFirstCategory.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте первую категорию'**
  String get addFirstCategory;

  /// No description provided for @addCategory.
  ///
  /// In ru, this message translates to:
  /// **'Добавить коллекцию'**
  String get addCategory;

  /// No description provided for @categoryIsNotAdded.
  ///
  /// In ru, this message translates to:
  /// **'Вы не добавили ни одной категории'**
  String get categoryIsNotAdded;

  /// No description provided for @searchCategoryIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'По вашему запросу категорий не найдено'**
  String get searchCategoryIsEmpty;

  /// No description provided for @enterNameCategory.
  ///
  /// In ru, this message translates to:
  /// **'Введите название категории'**
  String get enterNameCategory;

  /// No description provided for @categoryAdded.
  ///
  /// In ru, this message translates to:
  /// **'Категория добавлена'**
  String get categoryAdded;

  /// No description provided for @changeCategory.
  ///
  /// In ru, this message translates to:
  /// **'Изменить категорию'**
  String get changeCategory;

  /// No description provided for @categoryChanged.
  ///
  /// In ru, this message translates to:
  /// **'Категория изменена'**
  String get categoryChanged;

  /// No description provided for @deleteCategory.
  ///
  /// In ru, this message translates to:
  /// **'Удалить категорию'**
  String get deleteCategory;

  /// No description provided for @deleteCategoryMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить данную категорию вместе с её содержимым?'**
  String get deleteCategoryMessage;

  /// No description provided for @categoryDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Категория удалена'**
  String get categoryDeleted;

  /// No description provided for @deleteAllCategories.
  ///
  /// In ru, this message translates to:
  /// **'Удалить все категории'**
  String get deleteAllCategories;

  /// No description provided for @deleteAllCategoriesMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить все категории вместе с их содержимым?'**
  String get deleteAllCategoriesMessage;

  /// No description provided for @categoriesDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Категории удалены'**
  String get categoriesDeleted;

  /// No description provided for @searchWords.
  ///
  /// In ru, this message translates to:
  /// **'Поиск слов...'**
  String get searchWords;

  /// No description provided for @addFirstWord.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте первое слово'**
  String get addFirstWord;

  /// No description provided for @addWord.
  ///
  /// In ru, this message translates to:
  /// **'Добавить слово'**
  String get addWord;

  /// No description provided for @enterWord.
  ///
  /// In ru, this message translates to:
  /// **'Введите слово'**
  String get enterWord;

  /// No description provided for @addWordTranslate.
  ///
  /// In ru, this message translates to:
  /// **'Добавить перевод'**
  String get addWordTranslate;

  /// No description provided for @enterWordTranslate.
  ///
  /// In ru, this message translates to:
  /// **'Введите перевод'**
  String get enterWordTranslate;

  /// No description provided for @wordAdded.
  ///
  /// In ru, this message translates to:
  /// **'Слово добавлено'**
  String get wordAdded;

  /// No description provided for @wordAddedToCollection.
  ///
  /// In ru, this message translates to:
  /// **'Слово добавлено в коллекцию'**
  String get wordAddedToCollection;

  /// No description provided for @changeWord.
  ///
  /// In ru, this message translates to:
  /// **'Изменить слово'**
  String get changeWord;

  /// No description provided for @wordChanged.
  ///
  /// In ru, this message translates to:
  /// **'Слово изменено'**
  String get wordChanged;

  /// No description provided for @deleteWord.
  ///
  /// In ru, this message translates to:
  /// **'Удалить слово'**
  String get deleteWord;

  /// No description provided for @deleteWordMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить данное слово?'**
  String get deleteWordMessage;

  /// No description provided for @wordDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Слово удалено'**
  String get wordDeleted;

  /// No description provided for @deleteAllWords.
  ///
  /// In ru, this message translates to:
  /// **'Удалить все слова'**
  String get deleteAllWords;

  /// No description provided for @deleteAllCategoryWordsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить все слова из данной категории?'**
  String get deleteAllCategoryWordsMessage;

  /// No description provided for @deleteAllCollectionWordsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить все слова из данной коллекции?'**
  String get deleteAllCollectionWordsMessage;

  /// No description provided for @wordsDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Слова удалены'**
  String get wordsDeleted;

  /// No description provided for @addFirstCollection.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте первую коллекцию'**
  String get addFirstCollection;

  /// No description provided for @collectionIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'В колекции нет слов'**
  String get collectionIsEmpty;

  /// No description provided for @collectionIsEmptyFlipe.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы воспользоваться режимом карточек, вы должны добавить слова в текущую коллекцию'**
  String get collectionIsEmptyFlipe;

  /// No description provided for @addCollection.
  ///
  /// In ru, this message translates to:
  /// **'Добавить коллекцию'**
  String get addCollection;

  /// No description provided for @enterNameCollection.
  ///
  /// In ru, this message translates to:
  /// **'Введите название коллекции'**
  String get enterNameCollection;

  /// No description provided for @collectionAdded.
  ///
  /// In ru, this message translates to:
  /// **'Коллекция добавлена'**
  String get collectionAdded;

  /// No description provided for @changeCollection.
  ///
  /// In ru, this message translates to:
  /// **'Изменить коллекцию'**
  String get changeCollection;

  /// No description provided for @collectionChanged.
  ///
  /// In ru, this message translates to:
  /// **'Коллекция изменена'**
  String get collectionChanged;

  /// No description provided for @deleteCollection.
  ///
  /// In ru, this message translates to:
  /// **'Удалить коллекцию'**
  String get deleteCollection;

  /// No description provided for @deleteCollectionMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите данную коллекцию вместе с её содержимым?'**
  String get deleteCollectionMessage;

  /// No description provided for @collectionDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Коллекция удалена'**
  String get collectionDeleted;

  /// No description provided for @deleteAllCollections.
  ///
  /// In ru, this message translates to:
  /// **'Удалить все коллекции'**
  String get deleteAllCollections;

  /// No description provided for @deleteAllCollectionsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить все коллекции вместе с их содержимым?'**
  String get deleteAllCollectionsMessage;

  /// No description provided for @collectionsDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Коллекции удалены'**
  String get collectionsDeleted;

  /// No description provided for @flipCardMode.
  ///
  /// In ru, this message translates to:
  /// **'Режим карточек'**
  String get flipCardMode;

  /// No description provided for @wordsFlipEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы воспользоваться режимом карточек, вы должны добавить слова в текущую категорию'**
  String get wordsFlipEmptyMessage;

  /// No description provided for @visibleMode.
  ///
  /// In ru, this message translates to:
  /// **'Режим отображения'**
  String get visibleMode;

  /// No description provided for @arabicText.
  ///
  /// In ru, this message translates to:
  /// **'Арабский текст'**
  String get arabicText;

  /// No description provided for @translationText.
  ///
  /// In ru, this message translates to:
  /// **'Текст перевода'**
  String get translationText;

  /// No description provided for @arabicFont.
  ///
  /// In ru, this message translates to:
  /// **'Шрифт арабского текста'**
  String get arabicFont;

  /// No description provided for @translationFont.
  ///
  /// In ru, this message translates to:
  /// **'Шрифт текста перевода'**
  String get translationFont;

  /// No description provided for @textAlign.
  ///
  /// In ru, this message translates to:
  /// **'Расположение текста'**
  String get textAlign;

  /// No description provided for @arabicTextSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер арабского текста'**
  String get arabicTextSize;

  /// No description provided for @translationTextSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер текста перевода'**
  String get translationTextSize;

  /// No description provided for @adaptiveTheme.
  ///
  /// In ru, this message translates to:
  /// **'Адаптивная тема'**
  String get adaptiveTheme;

  /// No description provided for @userTheme.
  ///
  /// In ru, this message translates to:
  /// **'Пользовательская тема'**
  String get userTheme;

  /// No description provided for @displayIsAlways.
  ///
  /// In ru, this message translates to:
  /// **'Не отключать дисплей'**
  String get displayIsAlways;

  /// No description provided for @saveLastBottomNavIndex.
  ///
  /// In ru, this message translates to:
  /// **'Открывать приложение со словаря'**
  String get saveLastBottomNavIndex;

  /// No description provided for @playSpeed.
  ///
  /// In ru, this message translates to:
  /// **'Скорость воспроизведения'**
  String get playSpeed;

  /// No description provided for @oneRepet.
  ///
  /// In ru, this message translates to:
  /// **'Повтор трека'**
  String get oneRepet;

  /// No description provided for @allRepet.
  ///
  /// In ru, this message translates to:
  /// **'Повтор всех треков'**
  String get allRepet;

  /// No description provided for @startSearch.
  ///
  /// In ru, this message translates to:
  /// **'Начните поиск...'**
  String get startSearch;

  /// No description provided for @searchResultIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'По вашему запросу ничего не найдено'**
  String get searchResultIsEmpty;

  /// No description provided for @mathesFound.
  ///
  /// In ru, this message translates to:
  /// **'Найдено совпадений: '**
  String get mathesFound;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
