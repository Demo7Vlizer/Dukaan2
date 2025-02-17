// AppRoutes defines all the navigation paths in the app
// 'abstract' means this class can't be instantiated (created as an object)
abstract class AppRoutes {
  // Splash screen shown when app starts
  static const splash = '/splash';
  
  // Main home screen of the app
  static const home = '/home';
  
  // Screen for managing store settings and configurations
  static const manageStore = '/manage-store';
  
  // Screen for entering additional store/user information
  static const additionalInfo = '/additional-info';
  
  // Screen for handling payments and transactions
  static const payments = '/payments';
  
  // Screen showing product catalogue/inventory
  static const catalogue = '/catalogue';
  
  // Screen for premium/paid features
  static const premium = '/premium';
  
  // Screen showing details of a specific order
  static const orderDetails = '/order-details';
} 