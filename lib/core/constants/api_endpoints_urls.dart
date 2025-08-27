class ApiEndpoints {
  ApiEndpoints._();

  //**** AUTHENTICATION *****//
  static const String sendOtp = 'auth/otp/send/phone/';
  static const String verifyOtp = 'auth/otp/verify/phone/';
  static const String register = 'register/';
  static const String refreshToken = 'token/refresh/';
  static const String verifyToken = 'token/access/verify/';
  static const String updateAccount = 'user/update/';
  static const String deleteAccount = 'user/delete/';

  //**** HOME PAGE *****//
  static const String sectors = 'home/sectors';
  static const String recentEaddresses = 'home/public-addresses';
  static const String recentProducts = 'home/products';

  //** Public Addresses */
  static const String publicEaddress = 'public-address/';
  static const String updatePublicEaddressById = 'public-address/';

  //** Verification Requests */
  static const String verificationRequests = 'verification/';

  //** Private Addresses */
  static const String privateEaddress = 'private-address/';

  //** Addresses Book */
  static const String addEadressToBookById = 'repertoire/';
  static const String addEadressToBookByCode = 'repertoire/create-by-code/';
  static const String getUserEaddressBook = 'repertoire/';
  static const String updateEaddressInBook = 'repertoire/';
  static const String removeEaddressFromBook = 'repertoire/';

  //** Favourites */
  static const String addEaddressToFavourites = 'favoris/';
  static const String getUserFavourites = 'favoris/';
  static const String removeEaddressFromFavourites = 'favoris/';

  //** Cities */
  static const String getCities = 'country/';

  //** Products */
  static const String createProducts = 'product/';
  static const String updateProducts = 'product/';
  static const String deleteProducts = 'product/';
  static const String getProducts = 'product/';
  static const String getProductById = 'product/';
}
