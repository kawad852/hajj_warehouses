import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @conWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get conWithGoogle;

  /// No description provided for @conWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get conWithApple;

  /// No description provided for @conWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Continue with Phone'**
  String get conWithPhone;

  /// No description provided for @regTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Nudoo!'**
  String get regTitle;

  /// No description provided for @regBody.
  ///
  /// In en, this message translates to:
  /// **'Organize your tasks, boost your productivity, and get things done effortlessly.\nSign up now to start managing your tasks like a pro!'**
  String get regBody;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'Oops, Something went wrong !'**
  String get generalError;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Error'**
  String get networkError;

  /// No description provided for @generalErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get generalErrorTitle;

  /// No description provided for @generalErrorBody.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again later or contact support.'**
  String get generalErrorBody;

  /// No description provided for @connectionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get connectionErrorTitle;

  /// No description provided for @connectionErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Unable to reach the server. Please check your internet connection and try again.'**
  String get connectionErrorBody;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @serverErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Unavailable'**
  String get serverErrorTitle;

  /// No description provided for @serverErrorBody.
  ///
  /// In en, this message translates to:
  /// **'We\'re currently having trouble retrieving data from the server. Please try again later.'**
  String get serverErrorBody;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @authFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get authFailed;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @addToBasket.
  ///
  /// In en, this message translates to:
  /// **'Add to basket'**
  String get addToBasket;

  /// No description provided for @locationServiceDisabledMsg.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled in your device'**
  String get locationServiceDisabledMsg;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @basketEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Basket is Empty'**
  String get basketEmptyTitle;

  /// No description provided for @basketEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Start adding items to your basket by exploring our collection. Once you find something you like, simply tap \'Add to Basket\' to begin your shopping journey. Happy shopping!'**
  String get basketEmptyBody;

  /// No description provided for @contShipping.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get contShipping;

  /// No description provided for @cont.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cont;

  /// No description provided for @deliveryInfo.
  ///
  /// In en, this message translates to:
  /// **'Delivery arrives in 30-40 minutes.'**
  String get deliveryInfo;

  /// No description provided for @shoppingBasket.
  ///
  /// In en, this message translates to:
  /// **'Shopping Basket'**
  String get shoppingBasket;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @basket.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get basket;

  /// No description provided for @mealAdded.
  ///
  /// In en, this message translates to:
  /// **'Meal Added'**
  String get mealAdded;

  /// No description provided for @itemNotAvailableMsg.
  ///
  /// In en, this message translates to:
  /// **'Item no longer available'**
  String get itemNotAvailableMsg;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @itemDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get itemDeleteTitle;

  /// No description provided for @itemBasketDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the item from basket ?'**
  String get itemBasketDeleteBody;

  /// No description provided for @addedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Added Successfully'**
  String get addedSuccessfully;

  /// No description provided for @successfullyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Successfully Updated'**
  String get successfullyUpdated;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Addresses'**
  String get deliveryAddress;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact info'**
  String get contactInfo;

  /// No description provided for @house.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get house;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Flat'**
  String get apartment;

  /// No description provided for @office.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get office;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @streetName.
  ///
  /// In en, this message translates to:
  /// **'Street name'**
  String get streetName;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @floorNo.
  ///
  /// In en, this message translates to:
  /// **'Floor No.'**
  String get floorNo;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company name'**
  String get companyName;

  /// No description provided for @buildingNo.
  ///
  /// In en, this message translates to:
  /// **'Building No.'**
  String get buildingNo;

  /// No description provided for @additionalDirections.
  ///
  /// In en, this message translates to:
  /// **'Additional directions'**
  String get additionalDirections;

  /// No description provided for @apartmentNo.
  ///
  /// In en, this message translates to:
  /// **'Apartment No.'**
  String get apartmentNo;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @countrySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for the country name or dial code...'**
  String get countrySearchHint;

  /// No description provided for @locationAccess.
  ///
  /// In en, this message translates to:
  /// **'Location Access'**
  String get locationAccess;

  /// No description provided for @locationAccessBody.
  ///
  /// In en, this message translates to:
  /// **'Allow location access so that we can display the stores closest to you'**
  String get locationAccessBody;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @deleteAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddressTitle;

  /// No description provided for @deleteAddressBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the address ?'**
  String get deleteAddressBody;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @addressesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Addresses Added Yet'**
  String get addressesEmptyTitle;

  /// No description provided for @addressesEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any delivery addresses yet. Tap the button below to add a new address.'**
  String get addressesEmptyBody;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deliveryAddresses.
  ///
  /// In en, this message translates to:
  /// **'Delivery Addresses'**
  String get deliveryAddresses;

  /// No description provided for @placesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a place..'**
  String get placesSearchHint;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account ?\nAll of your data will be erased.'**
  String get deleteAccountBody;

  /// No description provided for @deleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted successfully.'**
  String get deleteAccountSuccess;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @promoCodeInfo.
  ///
  /// In en, this message translates to:
  /// **'Please enter your promo code to get discount'**
  String get promoCodeInfo;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @promoCode.
  ///
  /// In en, this message translates to:
  /// **'Promo Code'**
  String get promoCode;

  /// No description provided for @applyPromoCode.
  ///
  /// In en, this message translates to:
  /// **'Apply Promo Code'**
  String get applyPromoCode;

  /// No description provided for @expiredPromoCodeMsg.
  ///
  /// In en, this message translates to:
  /// **'Promo code expired. Stay tuned for fresh offers coming soon!'**
  String get expiredPromoCodeMsg;

  /// No description provided for @invalidPromoCodeMsg.
  ///
  /// In en, this message translates to:
  /// **'Hm, seems like something\'s off with that code. Double-check for typos and try again.'**
  String get invalidPromoCodeMsg;

  /// No description provided for @successPromoCodeMsg.
  ///
  /// In en, this message translates to:
  /// **'Congrats! Your promo code is applied. Enjoy your savings!'**
  String get successPromoCodeMsg;

  /// No description provided for @enterPromoCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Promo Code'**
  String get enterPromoCode;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @orderSummery.
  ///
  /// In en, this message translates to:
  /// **'Order Summery'**
  String get orderSummery;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @orderTotal.
  ///
  /// In en, this message translates to:
  /// **'Order Total'**
  String get orderTotal;

  /// No description provided for @basketTotal.
  ///
  /// In en, this message translates to:
  /// **'Basket Total'**
  String get basketTotal;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @reviewQuestion.
  ///
  /// In en, this message translates to:
  /// **'How was your order from {appName} ?'**
  String reviewQuestion(Object appName);

  /// No description provided for @reviewSubmittedMsg.
  ///
  /// In en, this message translates to:
  /// **'Your review has been submitted successfully'**
  String get reviewSubmittedMsg;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'iBear'**
  String get appName;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @pickUp.
  ///
  /// In en, this message translates to:
  /// **'Pick Up'**
  String get pickUp;

  /// No description provided for @minOrderMsg.
  ///
  /// In en, this message translates to:
  /// **'Minimum basket total must be more than {value}'**
  String minOrderMsg(Object value);

  /// No description provided for @storeClosedMsg.
  ///
  /// In en, this message translates to:
  /// **'We are currently closed. Please check back during our operating hours from {start} to {end}.'**
  String storeClosedMsg(Object end, Object start);

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @emptyNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get emptyNotificationsTitle;

  /// No description provided for @emptyNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'We haven\'t sent any notifications yet, but stay tuned!'**
  String get emptyNotificationsBody;

  /// No description provided for @emptyOrdersTitle.
  ///
  /// In en, this message translates to:
  /// **'No Orders Yet!'**
  String get emptyOrdersTitle;

  /// No description provided for @emptyOrdersBody.
  ///
  /// In en, this message translates to:
  /// **'Browse our selection and place your first order.'**
  String get emptyOrdersBody;

  /// No description provided for @statusPlaced.
  ///
  /// In en, this message translates to:
  /// **'Placed'**
  String get statusPlaced;

  /// No description provided for @statusPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get statusPreparing;

  /// No description provided for @statusOutForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out For Delivery'**
  String get statusOutForDelivery;

  /// No description provided for @statusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// No description provided for @statusCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get statusCanceled;

  /// No description provided for @statusRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get statusRefunded;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @readyForPickup.
  ///
  /// In en, this message translates to:
  /// **'Ready For Pickup'**
  String get readyForPickup;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get orderDetails;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order status'**
  String get orderStatus;

  /// No description provided for @outOfStockTitle.
  ///
  /// In en, this message translates to:
  /// **'Out Of Stock'**
  String get outOfStockTitle;

  /// No description provided for @outOfStockBody.
  ///
  /// In en, this message translates to:
  /// **'This item is no longer available. Please remove it from your basket or check back later.'**
  String get outOfStockBody;

  /// No description provided for @stockAvailabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Limited Stock Available'**
  String get stockAvailabilityTitle;

  /// No description provided for @stockAvailabilitySubTitle.
  ///
  /// In en, this message translates to:
  /// **'There are only {stockQuantity} left in stock. Please update your basket to proceed.'**
  String stockAvailabilitySubTitle(Object stockQuantity);

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @whatAreYouLookingForHint.
  ///
  /// In en, this message translates to:
  /// **'What are you looking for?'**
  String get whatAreYouLookingForHint;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
