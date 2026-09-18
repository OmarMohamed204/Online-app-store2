import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

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
    Locale('ar'),
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @myProducts.
  ///
  /// In en, this message translates to:
  /// **'My Products'**
  String get myProducts;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @cars.
  ///
  /// In en, this message translates to:
  /// **'Cars'**
  String get cars;

  /// No description provided for @tShirts.
  ///
  /// In en, this message translates to:
  /// **'T-Shirts'**
  String get tShirts;

  /// No description provided for @flowers.
  ///
  /// In en, this message translates to:
  /// **'Flowers'**
  String get flowers;

  /// No description provided for @searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search for a product...'**
  String get searchProduct;

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by Omar Mohamed © 2026'**
  String get developedBy;

  /// No description provided for @favoriteAdded.
  ///
  /// In en, this message translates to:
  /// **'Item added to favorites'**
  String get favoriteAdded;

  /// No description provided for @favoriteRemoved.
  ///
  /// In en, this message translates to:
  /// **'Item removed from favorites'**
  String get favoriteRemoved;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @carAdded.
  ///
  /// In en, this message translates to:
  /// **'Car added to cart ✅'**
  String get carAdded;

  /// No description provided for @tShirtAdded.
  ///
  /// In en, this message translates to:
  /// **'T-Shirt added to cart ✅'**
  String get tShirtAdded;

  /// No description provided for @flowerAdded.
  ///
  /// In en, this message translates to:
  /// **'Flower added to cart ✅'**
  String get flowerAdded;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @changeAppAppearance.
  ///
  /// In en, this message translates to:
  /// **'Change app appearance'**
  String get changeAppAppearance;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @receiveNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive notifications'**
  String get receiveNotifications;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @onlineStore.
  ///
  /// In en, this message translates to:
  /// **'Online Store'**
  String get onlineStore;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @aboutOnlineStore.
  ///
  /// In en, this message translates to:
  /// **'About Online Store'**
  String get aboutOnlineStore;

  /// No description provided for @shopMoreSaveMore.
  ///
  /// In en, this message translates to:
  /// **'Shop More, Save More'**
  String get shopMoreSaveMore;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Online Store 🛍️\n\nOur goal is to make online shopping simple, convenient, and enjoyable. Explore a variety of products in one place, from fashion and clothing to cars and beautiful flowers.\n\nWe are always working to improve your shopping experience and make it easier to discover products you love.'**
  String get aboutDescription;

  /// No description provided for @whatYouCanFind.
  ///
  /// In en, this message translates to:
  /// **'What You Can Find'**
  String get whatYouCanFind;

  /// No description provided for @clothes.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothes;

  /// No description provided for @clothesDescription.
  ///
  /// In en, this message translates to:
  /// **'Stylish clothes and fashion items'**
  String get clothesDescription;

  /// No description provided for @carsDescription.
  ///
  /// In en, this message translates to:
  /// **'Cars and automotive products'**
  String get carsDescription;

  /// No description provided for @flowersDescription.
  ///
  /// In en, this message translates to:
  /// **'Beautiful flowers and gifts'**
  String get flowersDescription;

  /// No description provided for @developedByOmar.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Online Store\nDeveloped by Omar Mohamed'**
  String get developedByOmar;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @getInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get getInTouch;

  /// No description provided for @happyToHear.
  ///
  /// In en, this message translates to:
  /// **'We are happy to hear from you!'**
  String get happyToHear;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No Favorites Yet!! ❤️'**
  String get noFavoritesYet;

  /// No description provided for @totalFavoriteItems.
  ///
  /// In en, this message translates to:
  /// **'Total Favorite Items'**
  String get totalFavoriteItems;

  /// No description provided for @detailsScreen.
  ///
  /// In en, this message translates to:
  /// **'Details Screen'**
  String get detailsScreen;

  /// No description provided for @newItem.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newItem;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details:'**
  String get details;

  /// No description provided for @flowerDetails.
  ///
  /// In en, this message translates to:
  /// **'Sepals: The outer green parts that protect the bud before it opens (Britannica Flower). Petals: The bright, colored parts that attract bees and other pollinators (Britannica Flower). Stamens: The male parts that make pollen (Britannica Flower). Each has a filament and an anther. Carpels (Pistil): The female part in the center (Britannica Flower). It holds the ovules that turn into seeds after fertilization (Britannica Flower).'**
  String get flowerDetails;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// No description provided for @carDetails.
  ///
  /// In en, this message translates to:
  /// **'Global Specifications: Browse extensive make and model databases on the Cars & Automakers Database for engine options and history. Local Car Prices: View official daily updates and local market rates in Egypt through ContactCars. Used Car Listings: Search local used vehicle models and dealer locations via Hatla2ee Egypt. Are you looking for details on a specific car brand or model, or do you need help finding local prices and specs in Egypt?'**
  String get carDetails;

  /// No description provided for @shirtDetails.
  ///
  /// In en, this message translates to:
  /// **'Collar: The band around the neck. Common types include point, spread, button-down, and camp collars. Cuffs: The end of the sleeve, which can be buttoned, snapped, or folded back as French cuffs. Yoke: The panel of fabric across the shoulders that helps the shirt fit smoothly. Placket (Button Stand): The reinforced strip of fabric where the buttons and buttonholes are placed down the front. Hem: The finished bottom edge of the shirt, designed to be tucked in or left untucked.'**
  String get shirtDetails;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No Notifications!!'**
  String get noNotifications;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check Out'**
  String get checkOut;

  /// No description provided for @noItemsAdded.
  ///
  /// In en, this message translates to:
  /// **'No Items Added !!'**
  String get noItemsAdded;

  /// No description provided for @totalAddedItems.
  ///
  /// In en, this message translates to:
  /// **'Total Added Items'**
  String get totalAddedItems;

  /// No description provided for @customerInformation.
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get customerInformation;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @visaMastercard.
  ///
  /// In en, this message translates to:
  /// **'Visa / Mastercard'**
  String get visaMastercard;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @continueToPayment.
  ///
  /// In en, this message translates to:
  /// **'Continue to payment'**
  String get continueToPayment;

  /// No description provided for @completeInformation.
  ///
  /// In en, this message translates to:
  /// **'Please complete all your information'**
  String get completeInformation;

  /// No description provided for @validPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validPhoneNumber;

  /// No description provided for @confirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Message'**
  String get confirmationMessage;

  /// No description provided for @orderConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed!'**
  String get orderConfirmed;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderId;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @orderConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'Your order has been confirmed.\nYou Will receive a confirmation SMS.'**
  String get orderConfirmationText;

  /// No description provided for @pleaseCompleteYou.
  ///
  /// In en, this message translates to:
  /// **'Please complete all you information'**
  String get pleaseCompleteYou;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Username'**
  String get enterUsername;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get enterPassword;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account?'**
  String get haveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;
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
      <String>['ar', 'en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
