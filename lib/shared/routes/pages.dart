import 'package:get/get.dart';
import 'package:ramflux_app/pages/index.dart';

import 'index.dart';

class RoutePages {
  // Routes
  static List<GetPage> pages = [
    // Main page
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),

    GetPage(
      name: RouteNames.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.welcome,
      page: () => const WelcomePage(),
    ),

    // Auth
    GetPage(
      name: RouteNames.authBackupWallet,
      page: () => const BackupWalletPage(),
    ),
    GetPage(
      name: RouteNames.authMnemonicPhrase,
      page: () => const MnemonicPhrasePage(),
    ),
    GetPage(
      name: RouteNames.authPassword,
      page: () => const PasswordPage(),
    ),
    GetPage(
      name: RouteNames.authVerifyMnemonic,
      page: () => const VerifyMnemonicPage(),
    ),

    // Chats
    GetPage(
      name: RouteNames.chatsConversations,
      page: () => const ConversationsPage(),
    ),
    GetPage(
      name: RouteNames.chatsChatting,
      page: () => const ChattingPage(),
    ),

    // Contacts
    GetPage(
      name: RouteNames.contactsList,
      page: () => const ContactListPage(),
    ),
    GetPage(
      name: RouteNames.contactsDetail,
      page: () => const ContactDetailPage(),
    ),
    GetPage(
      name: RouteNames.contactsFriendRequests,
      page: () => const FriendRequestsPage(),
    ),
    GetPage(
      name: RouteNames.contactsFriendProfile,
      page: () => const FriendProfilePage(),
    ),

    // Commodity
    GetPage(
      name: RouteNames.commodityInviteFriends,
      page: () => const InviteFriendsPage(),
    ),
    GetPage(
      name: RouteNames.commodityCreateCommodity,
      page: () => const CreateCommodityPage(),
    ),
    GetPage(
      name: RouteNames.commodityCharting,
      page: () => const CommodityChartingPage(),
    ),
    GetPage(
      name: RouteNames.commodityDetails,
      page: () => const CommodityDetailsPage(),
    ),
    GetPage(
      name: RouteNames.commodityNewGroup,
      page: () => const NewGroupPage(),
    ),
  ];
}
