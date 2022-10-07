import 'package:solution_ke/presentation/account_screen/binding/account_binding.dart';
import 'package:solution_ke/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:solution_ke/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:solution_ke/presentation/homepage_screen/binding/homepage_binding.dart';
import 'package:solution_ke/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:solution_ke/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:solution_ke/presentation/login_screen/login_screen.dart';
import 'package:solution_ke/presentation/login_screen/binding/login_binding.dart';
import 'package:solution_ke/presentation/otp_verification_screen/otp_verification_screen.dart';
import 'package:solution_ke/presentation/otp_verification_screen/binding/otp_verification_binding.dart';
import 'package:solution_ke/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:solution_ke/presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import 'package:solution_ke/presentation/onboarding_category_screen/onboarding_category_screen.dart';
import 'package:solution_ke/presentation/onboarding_category_screen/binding/onboarding_category_binding.dart';
import 'package:solution_ke/presentation/onboarding_artists_screen/onboarding_artists_screen.dart';
import 'package:solution_ke/presentation/onboarding_artists_screen/binding/onboarding_artists_binding.dart';
import 'package:solution_ke/presentation/playlist_screen/binding/playlist_binding.dart';
import 'package:solution_ke/presentation/playlist_screen/playlist_screen.dart';
import 'package:solution_ke/presentation/playlists_screen/binding/playlists_binding.dart';
import 'package:solution_ke/presentation/playlists_screen/playlists_screen.dart';
import 'package:solution_ke/presentation/search_screen/binding/search_binding.dart';
import 'package:solution_ke/presentation/search_screen/search_screen.dart';
import 'package:solution_ke/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:solution_ke/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:solution_ke/presentation/homepage_screen/homepage_screen.dart';
import 'package:solution_ke/presentation/album_screen/album_screen.dart';
import 'package:solution_ke/presentation/album_screen/binding/album_binding.dart';
import 'package:solution_ke/presentation/player_screen/player_screen.dart';
import 'package:solution_ke/presentation/player_screen/binding/player_binding.dart';
import 'package:solution_ke/presentation/my_world_screen/my_world_screen.dart';
import 'package:solution_ke/presentation/album_details_screen/album_details_screen.dart';
import 'package:solution_ke/presentation/album_details_screen/binding/album_details_binding.dart';
import 'package:solution_ke/presentation/purchase_screen/purchase_screen.dart';
import 'package:solution_ke/presentation/purchase_screen/binding/purchase_binding.dart';
import 'package:solution_ke/presentation/confirm_purchase_screen/confirm_purchase_screen.dart';
import 'package:solution_ke/presentation/confirm_purchase_screen/binding/confirm_purchase_binding.dart';
import 'package:solution_ke/presentation/account_screen/account_screen.dart';
import 'package:solution_ke/presentation/change_bio_screen/change_bio_screen.dart';
import 'package:solution_ke/presentation/change_bio_screen/binding/change_bio_binding.dart';
import 'package:solution_ke/presentation/purchase_history_screen/purchase_history_screen.dart';
import 'package:solution_ke/presentation/purchase_history_screen/binding/purchase_history_binding.dart';
import 'package:solution_ke/presentation/about_screen/about_screen.dart';
import 'package:solution_ke/presentation/about_screen/binding/about_binding.dart';
import 'package:solution_ke/presentation/songs_screen/binding/songs_binding.dart';
import 'package:solution_ke/presentation/songs_screen/songs_screen.dart';
import 'package:solution_ke/presentation/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:solution_ke/presentation/terms_conditions_screen/binding/terms_conditions_binding.dart';
import 'package:solution_ke/presentation/success_screen/success_screen.dart';
import 'package:solution_ke/presentation/success_screen/binding/success_binding.dart';
import 'package:get/get.dart';
import 'package:solution_ke/routes/middleware/authenticated_guard.dart';

class AppRoutes {
  static String dashboardScreen = '/dashboard_screen';

  static String playlistsScreen = '/playlists_screen';

  static String onboardingScreen = '/onboarding_screen';

  static String loginScreen = "/login_screen";

  static String otpVerificationScreen = '/otp_verification_screen';

  static String onboardingTwoScreen = '/onboarding_two_screen';

  static String onboardingCategoryScreen = '/onboarding_category_screen';

  static String onboardingArtistsScreen = '/onboarding_artists_screen';

  static String signUpScreen = '/sign_up_screen';

  static String homepageScreen = '/homepage_screen';

  static String albumScreen = '/album_screen';

  static String playerScreen = '/player_screen';

  static String myWorldScreen = '/my_world_screen';

  static String albumDetailsScreen = '/album_details_screen';

  static String purchaseScreen = '/purchase_screen';

  static String confirmPurchaseScreen = '/confirm_purchase_screen';

  static String accountScreen = '/account_screen';

  static String changeBioScreen = '/change_bio_screen';

  static String purchaseHistoryScreen = '/purchase_history_screen';

  static String aboutScreen = '/about_screen';

  static String termsConditionsScreen = '/terms_conditions_screen';

  static String successScreen = '/success_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String searchScreen = '/search_screen';

  static String songsScreen = '/songs_screen';

  static String playlistScreen = '/playlist_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      bindings: [
        OtpVerificationBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingCategoryScreen,
      page: () => OnboardingCategoryScreen(),
      bindings: [
        OnboardingCategoryBinding(),
      ],
    ),
    GetPage(
      name: onboardingArtistsScreen,
      page: () => OnboardingArtistsScreen(),
      bindings: [
        OnboardingArtistsBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: playlistsScreen,
      page: () => PlaylistsScreen(),
      bindings: [
        PlaylistsBinding(),
      ],
    ),
    GetPage(
      name: playlistScreen,
      page: () => PlaylistScreen(),
      bindings: [
        PlaylistBinding(),
      ],
    ),
    GetPage(
      name: songsScreen,
      page: () => SongsScreen(),
      bindings: [
        SongsBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: homepageScreen,
      page: () => HomepageScreen(),
      bindings: [
        HomepageBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: albumScreen,
      page: () => AlbumScreen(),
      bindings: [
        AlbumBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: playerScreen,
      page: () => PlayerScreen(),
      bindings: [
        PlayerBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: myWorldScreen,
      page: () => MyWorldScreen(),
      // bindings: [
      //   MyWorldBinding(),
      // ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: albumDetailsScreen,
      page: () => AlbumDetailsScreen(),
      bindings: [
        AlbumDetailsBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: purchaseScreen,
      page: () => PurchaseScreen(),
      bindings: [
        PurchaseBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: confirmPurchaseScreen,
      page: () => ConfirmPurchaseScreen(),
      bindings: [
        ConfirmPurchaseBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: accountScreen,
      page: () => AccountScreen(),
      bindings: [
        AccountBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: changeBioScreen,
      page: () => ChangeBioScreen(),
      bindings: [
        ChangeBioBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: purchaseHistoryScreen,
      page: () => PurchaseHistoryScreen(),
      bindings: [
        PurchaseHistoryBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: aboutScreen,
      page: () => AboutScreen(),
      bindings: [
        AboutBinding(),
      ],
    ),
    GetPage(
      name: termsConditionsScreen,
      page: () => TermsConditionsScreen(),
      bindings: [
        TermsConditionsBinding(),
      ],
    ),
    GetPage(
      name: successScreen,
      page: () => SuccessScreen(),
      bindings: [
        SuccessBinding(),
      ],
      middlewares: [
        AuthenticatedGuard(),
      ],
    ),
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => DashboardScreen(),
      bindings: [DashboardBinding()],
      middlewares: [
        AuthenticatedGuard(),
      ],
    )
  ];
}
