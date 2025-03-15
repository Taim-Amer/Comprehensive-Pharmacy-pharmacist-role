import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class TAppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'next': TEnglishTexts.next,
      'add': TEnglishTexts.add,
      'addAnotherPhone': TEnglishTexts.addAnotherPhone,
      'tcontinue': TEnglishTexts.tcontinue,
      'errorMessage': TEnglishTexts.errorMessage,
      'loginTitle': TEnglishTexts.loginTitle,
      'loginSubTitle': TEnglishTexts.loginSubTitle,
      'passwordEnter': TEnglishTexts.passwordEnter,
      'forgetPassword': TEnglishTexts.forgetPassword,
      'login': TEnglishTexts.login,
      'signupQuastion': TEnglishTexts.signupQuastion,
      'register': TEnglishTexts.register,
      'phoneNumber': TEnglishTexts.phoneNumber,
      'registerTitle': TEnglishTexts.registerTitle,
      'registerSubTitle': TEnglishTexts.registerSubTitle,
      'userName': TEnglishTexts.userName,
      'emailAddress': TEnglishTexts.emailAddress,
      'password': TEnglishTexts.password,
      'confirmPassword': TEnglishTexts.confirmPassword,
      'location': TEnglishTexts.location,
      'signinQuastion': TEnglishTexts.signinQuastion,
      'otpTitle': TEnglishTexts.otpTitle,
      'otpSubTitle': TEnglishTexts.otpSubTitle,
      'otpQuastion': TEnglishTexts.otpQuastion,
      'resend': TEnglishTexts.resend,
      'verifyCode': TEnglishTexts.verifyCode,
      'forgetPasswordSubTitle': TEnglishTexts.forgetPasswordSubTitle,
      'checkPhone': TEnglishTexts.checkPhone,
      'checkPhoneSubTitle': TEnglishTexts.checkPhoneSubTitle,
      'checkPhoneQuastion': TEnglishTexts.checkPhoneQuastion,
      'setNewPasswordTitle': TEnglishTexts.setNewPasswordTitle,
      'setNewPasswordSubTitle': TEnglishTexts.setNewPasswordSubTitle,
      'updatePassword': TEnglishTexts.updatePassword,
      'resetSuccess': TEnglishTexts.resetSuccess,
      'resetSuccessSubTitle': TEnglishTexts.resetSuccessSubTitle,
      'myOrders': TEnglishTexts.myOrders,
      'previousOrders': TEnglishTexts.previousOrders,
      'emptyOrders': TEnglishTexts.emptyOrders,
      'emptyOrdersSubTitle': TEnglishTexts.emptyOrdersSubTitle,
      'createOrder': TEnglishTexts.createOrder,
      'home': TEnglishTexts.home,
      'languages': TEnglishTexts.languages,
      'privacy': TEnglishTexts.privacy,
      'signOut': TEnglishTexts.signOut,
      'completed': TEnglishTexts.completed,
      'pending': TEnglishTexts.pending,
      'canceled': TEnglishTexts.canceled,
      'rejected': TEnglishTexts.rejected,
      'processing': TEnglishTexts.processing,
      'onTheWay': TEnglishTexts.onTheWay,
      'orderID': TEnglishTexts.orderID,
      'pharmacyName': TEnglishTexts.pharmacyName,
      'orderDate': TEnglishTexts.orderDate,
      'orderDetails': TEnglishTexts.orderDetails,
      'prescriptionPhoto': TEnglishTexts.prescriptionPhoto,
      'homeTitle': TEnglishTexts.homeTitle,
      'homeSubTitle': TEnglishTexts.homeSubTitle,
      'uploadFile': TEnglishTexts.uploadFile,
      'supportedFiles': TEnglishTexts.supportedFiles,
      'browse': TEnglishTexts.browse,
      'writeNote': TEnglishTexts.writeNote,
      'createYourOrder': TEnglishTexts.createYourOrder,
      'searchingTitle': TEnglishTexts.searchingTitle,
      'searchingSubTitle': TEnglishTexts.searchingSubTitle,
      'cancelOrder': TEnglishTexts.cancelOrder,
      'dataEdit': TEnglishTexts.dataEdit,
      'languageSelect': TEnglishTexts.languageSelect,
      'profile': TEnglishTexts.profile,
      'save': TEnglishTexts.save,
      'notificationsEmptyTitle': TEnglishTexts.notificationsEmptyTitle,
      'notificationsEmptySubTitle': TEnglishTexts.notificationsEmptySubTitle,
      'processingTitle': TEnglishTexts.processingTitle,
      'processingSubTitle': TEnglishTexts.processingSubTitle,
      'onWaySubTitle': TEnglishTexts.onWaySubTitle,
      'onWayTitle': TEnglishTexts.onWayTitle,
      'deliveredTitle': TEnglishTexts.deliveredTitle,
      'deliveredSubTitle': TEnglishTexts.deliveredSubTitle,
      'confirmDelivery': TEnglishTexts.confirmDelivery,
      'settings': TEnglishTexts.settings,
      'languageChange': TEnglishTexts.languageChange,
      'arabic': TEnglishTexts.arabic,
      'english': TEnglishTexts.english,
      'privacyPolicy': TEnglishTexts.privacyPolicy,
      'about': TEnglishTexts.about,
      'out': TEnglishTexts.out,
      'accountInfo': TEnglishTexts.accountInfo,
      'close': TEnglishTexts.close,
      'phoneValidation': TEnglishTexts.phoneValidation,
      'emptyValidation': TEnglishTexts.emptyValidation,
      'emailValidation': TEnglishTexts.emailValidation,
      'emailInvalid': TEnglishTexts.emailInvalid,
      'nameUpdatedMessage': TEnglishTexts.nameUpdatedMessage,
      'reminderAddMessage': TEnglishTexts.reminderAddMessage,
      'newDebtMessage': TEnglishTexts.newDebtMessage,
      'newPaymentMessage': TEnglishTexts.newPaymentMessage,
      'newAccountMessage': TEnglishTexts.newAccountMessage,
      'verificationCodeMessage': TEnglishTexts.verificationCodeMessage,
      'newDebtCreateMessage': TEnglishTexts.newDebtCreateMessage,

      'newOrdersEmptyTitle': TEnglishTexts.newOrdersEmptyTitle,
      'newOrdersEmptySubTitle': TEnglishTexts.newOrdersEmptySubTitle,
      'currentOrdersEmptyTitle': TEnglishTexts.currentOrdersEmptyTitle,
      'currentOrdersEmptySubTitle': TEnglishTexts.currentOrdersEmptySubTitle,
      'rejectedOrdersEmptyTitle': TEnglishTexts.rejectedOrdersEmptyTitle,
      'rejectedOrdersEmptySubTitle': TEnglishTexts.rejectedOrdersEmptySubTitle,
      'finishedOrdersEmptyTitle': TEnglishTexts.finishedOrdersEmptyTitle,
      'finishedOrdersEmptySubTitle': TEnglishTexts.finishedOrdersEmptySubTitle,
      'onTheWayOrdersEmptyTitle': TEnglishTexts.onTheWayOrdersEmptyTitle,
      'onTheWayOrdersEmptySubTitle': TEnglishTexts.onTheWayOrdersEmptySubTitle,
      'viewOrder': TEnglishTexts.viewOrders,
      'currentOrder': TEnglishTexts.currentOrders,
      'finishOrder': TEnglishTexts.finishedOrders,
      'newOrder': TEnglishTexts.newOrders,
      'confirmOrder' : TEnglishTexts.confirmOrder,
      'rejectOrder': TEnglishTexts.rejectOrder,
      'ready': TEnglishTexts.readyToReceiveTitle,
      'ready2': TEnglishTexts.readyToReceiveSubTitle,
      'totalCost': TEnglishTexts.totalCost,
    },
    'ar': {
      'next': TArabicTexts.next,
      'add': TArabicTexts.add,
      'addAnotherPhone': TArabicTexts.addAnotherPhone,
      'tcontinue': TArabicTexts.tcontinue,
      'errorMessage': TArabicTexts.errorMessage,
      'notifications': TArabicTexts.notificationsEmptyTitle,
      'settings': TArabicTexts.settings,
      'languageChange': TArabicTexts.languageChange,
      'arabic': TArabicTexts.arabic,
      'english': TArabicTexts.english,
      'privacyPolicy': TArabicTexts.privacyPolicy,
      'about': TArabicTexts.about,
      'out': TArabicTexts.out,
      'accountInfo': TArabicTexts.accountInfo,
      'phoneValidation': TArabicTexts.phoneValidation,
      'emptyValidation': TArabicTexts.emptyValidation,
      'emailValidation': TArabicTexts.emailValidation,
      'emailInvalid': TArabicTexts.emailInvalid,
      'nameUpdatedMessage': TArabicTexts.nameUpdatedMessage,
      'reminderAddMessage': TArabicTexts.reminderAddMessage,
      'newDebtMessage': TArabicTexts.newDebtMessage,
      'newPaymentMessage': TArabicTexts.newPaymentMessage,
      'newAccountMessage': TArabicTexts.newAccountMessage,
      'verificationCodeMessage': TArabicTexts.verificationCodeMessage,
      'newDebtCreateMessage': TArabicTexts.newDebtCreateMessage,
      'loginTitle': TArabicTexts.loginTitle,
      'loginSubTitle': TArabicTexts.loginSubTitle,
      'passwordEnter': TArabicTexts.passwordEnter,
      'forgetPassword': TArabicTexts.forgetPassword,
      'login': TArabicTexts.login,
      'signupQuastion': TArabicTexts.signupQuastion,
      'register': TArabicTexts.register,
      'phoneNumber': TArabicTexts.phoneNumber,
      'registerTitle': TArabicTexts.registerTitle,
      'registerSubTitle': TArabicTexts.registerSubTitle,
      'userName': TArabicTexts.userName,
      'emailAddress': TArabicTexts.emailAddress,
      'password': TArabicTexts.password,
      'confirmPassword': TArabicTexts.confirmPassword,
      'location': TArabicTexts.location,
      'signinQuastion': TArabicTexts.signinQuastion,
      'otpTitle': TArabicTexts.otpTitle,
      'otpSubTitle': TArabicTexts.otpSubTitle,
      'otpQuastion': TArabicTexts.otpQuastion,
      'resend': TArabicTexts.resend,
      'verifyCode': TArabicTexts.verifyCode,
      'forgetPasswordSubTitle': TArabicTexts.forgetPasswordSubTitle,
      'checkPhone': TArabicTexts.checkPhone,
      'checkPhoneSubTitle': TArabicTexts.checkPhoneSubTitle,
      'checkPhoneQuastion': TArabicTexts.checkPhoneQuastion,
      'setNewPasswordTitle': TArabicTexts.setNewPasswordTitle,
      'setNewPasswordSubTitle': TArabicTexts.setNewPasswordSubTitle,
      'updatePassword': TArabicTexts.updatePassword,
      'resetSuccess': TArabicTexts.resetSuccess,
      'resetSuccessSubTitle': TArabicTexts.resetSuccessSubTitle,
      'myOrders': TArabicTexts.myOrders,
      'previousOrders': TArabicTexts.previousOrders,
      'emptyOrders': TArabicTexts.emptyOrders,
      'emptyOrdersSubTitle': TArabicTexts.emptyOrdersSubTitle,
      'createOrder': TArabicTexts.createOrder,
      'home': TArabicTexts.home,
      'languages': TArabicTexts.languages,
      'privacy': TArabicTexts.privacy,
      'signOut': TArabicTexts.signOut,
      'completed': TArabicTexts.completed,
      'pending': TArabicTexts.pending,
      'canceled': TArabicTexts.canceled,
      'rejected': TArabicTexts.rejected,
      'processing': TArabicTexts.processing,
      'onTheWay': TArabicTexts.onTheWay,
      'orderID': TArabicTexts.orderID,
      'pharmacyName': TArabicTexts.pharmacyName,
      'orderDate': TArabicTexts.orderDate,
      'orderDetails': TArabicTexts.orderDetails,
      'prescriptionPhoto': TArabicTexts.prescriptionPhoto,
      'homeTitle': TArabicTexts.homeTitle,
      'homeSubTitle': TArabicTexts.homeSubTitle,
      'uploadFile': TArabicTexts.uploadFile,
      'supportedFiles': TArabicTexts.supportedFiles,
      'browse': TArabicTexts.browse,
      'writeNote': TArabicTexts.writeNote,
      'createYourOrder': TArabicTexts.createYourOrder,
      'searchingTitle': TArabicTexts.searchingTitle,
      'searchingSubTitle': TArabicTexts.searchingSubTitle,
      'cancelOrder': TArabicTexts.cancelOrder,
      'dataEdit': TArabicTexts.dataEdit,
      'languageSelect': TArabicTexts.languageSelect,
      'profile': TArabicTexts.profile,
      'save': TArabicTexts.save,
      'notificationsEmptyTitle': TArabicTexts.notificationsEmptyTitle,
      'notificationsEmptySubTitle': TArabicTexts.notificationsEmptySubTitle,
      'processingTitle': TArabicTexts.processingTitle,
      'processingSubTitle': TArabicTexts.processingSubTitle,
      'onWaySubTitle': TArabicTexts.onWaySubTitle,
      'onWayTitle': TArabicTexts.onWayTitle,
      'deliveredTitle': TArabicTexts.deliveredTitle,
      'deliveredSubTitle': TArabicTexts.deliveredSubTitle,
      'confirmDelivery': TArabicTexts.confirmDelivery,
      // 'settings': TArabicTexts.settings,
      // 'languageChange': TArabicTexts.languageChange,
      // 'privacyPolicy': TArabicTexts.privacyPolicy,
      // 'about': TArabicTexts.about,
      // 'out': TArabicTexts.out,
      // 'accountInfo': TArabicTexts.accountInfo,
      'close': TArabicTexts.close,

      'newOrdersEmptyTitle': TArabicTexts.newOrdersEmptyTitle,
      'newOrdersEmptySubTitle': TArabicTexts.newOrdersEmptySubTitle,
      'currentOrdersEmptyTitle': TArabicTexts.currentOrdersEmptyTitle,
      'currentOrdersEmptySubTitle': TArabicTexts.currentOrdersEmptySubTitle,
      'rejectedOrdersEmptyTitle': TArabicTexts.rejectedOrdersEmptyTitle,
      'rejectedOrdersEmptySubTitle': TArabicTexts.rejectedOrdersEmptySubTitle,
      'finishedOrdersEmptyTitle': TArabicTexts.finishedOrdersEmptyTitle,
      'finishedOrdersEmptySubTitle': TArabicTexts.finishedOrdersEmptySubTitle,
      'onTheWayOrdersEmptyTitle': TArabicTexts.onTheWayOrdersEmptyTitle,
      'onTheWayOrdersEmptySubTitle': TArabicTexts.onTheWayOrdersEmptySubTitle,
      'viewOrder': TArabicTexts.viewOrders,
      'newOrder': TArabicTexts.newOrders,
      'currentOrder': TArabicTexts.currentOrders,
      'finishOrder': TArabicTexts.finishedOrders,
      'confirmOrder' : TArabicTexts.confirmOrder,
      'rejectOrder': TArabicTexts.rejectOrder,
      'ready': TArabicTexts.readyToReceiveTitle,
      'ready2': TArabicTexts.readyToReceiveSubTitle,
      'totalCost': TArabicTexts.totalCost,
    },
  };
}
