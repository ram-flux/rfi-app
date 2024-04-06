import '../locale_keys.dart';

Map<String, String> zh_CN = {
  // common
  LocaleKeys.commonBottomCancel: '取消',
  LocaleKeys.commonBottomConfirm: '确认',
  LocaleKeys.commonMessageInvalid: '无效的@param',
  LocaleKeys.commonSearch: '搜索',
  LocaleKeys.commonActionNotShown: '不显示',
  LocaleKeys.commonActionMute: '静音',
  LocaleKeys.commonActionDelete: '删除',
  LocaleKeys.commonActionArchive: '归档',
  LocaleKeys.commonActionAddMenu: '菜单',
  LocaleKeys.commonActionPin: '置顶',
  LocaleKeys.commonActionUnpin: '取消置顶',
  LocaleKeys.commonActionDeleteConfirm: '确认删除',
  LocaleKeys.commonActionNotShownConfirm: '确认不显示',
  LocaleKeys.commonActionCancel: '取消',

  // Main
  LocaleKeys.tabBarRf: 'RF',
  LocaleKeys.tabBarContacts: '联系人',
  LocaleKeys.tabBarFavorites: '收藏夹',
  LocaleKeys.tabBarSettings: '设置',

  // welcome
  LocaleKeys.welcomeTitle: '开启 Web3 大门',
  LocaleKeys.welcomeSubtitle: '我们遵循所有数据权利归属自己所有，所以我们使用钱包机制创建独立的账户',
  LocaleKeys.welcomeCreateAccount: '创建账号',
  LocaleKeys.welcomeRecoverAccount: '恢复账号',

  // auth/password
  LocaleKeys.authPasswordAppBarTitle: '创建验证密码',
  LocaleKeys.authPasswordTitle: '输入密码',
  LocaleKeys.authPasswordHintText: '安全操作验证密码',
  LocaleKeys.authPasswordButtonText: '确认',
  LocaleKeys.authPasswordText: '验证密码',

  // auth/backup_wallet
  LocaleKeys.authBackupWalletAppBarTitle: '备份钱包',
  LocaleKeys.authBackupWalletHintText: '请谨记以下安全要点',
  LocaleKeys.authBackupWalletButtonText: '我知道了',
  LocaleKeys.authBackupWalletTip1: '任何人，只要持有私钥、助记词，即可将资产转走',
  LocaleKeys.authBackupWalletTip2: '钱包密码仅用于私钥的加密和解密，密码只存储在手机上，请做好密码备份',
  LocaleKeys.authBackupWalletTip3: '请勿对私钥、助记词做截图备份，避免被恶意软件截图',
  LocaleKeys.authBackupWalletTip4: '请正确抄写并保存在安全的地方，勿进行网络传输或存储',

  // auth/mnemonic_phrase
  LocaleKeys.authMnemonicPhraseAppBarTitle: '备份助记词',
  LocaleKeys.authMnemonicPhraseHintText: '请根据以下顺序，记录您的私钥助记词',
  LocaleKeys.authMnemonicPhraseButtonText: '继续',

  // auth/verify_mnemonic
  LocaleKeys.authVerifyMnemonicAppBarTitle: '验证私钥助记词',
  LocaleKeys.authVerifyMnemonicHintText: '请根据你记下的私钥助记词，按顺序输入 \n验证你备份的私钥助记词无误',
  LocaleKeys.authVerifyMnemonicInputHintText: '请输入私钥助记词',
  LocaleKeys.authVerifyMnemonicTipsText:
      '助记词12,18,24等不同随机组成,请根据自己的单词填写，单个空格为一个',
  LocaleKeys.authVerifyMnemonicButtonText: '完成验证',
  LocaleKeys.authVerifyMnemonicBottomSheetTitle: '+密码',
  LocaleKeys.authVerifyMnemonicBottomSheetSubtitle: '为您的帐户安全+密码生成私钥!',
  LocaleKeys.authVerifyMnemonicBottomSheetPassword: '密码',
  LocaleKeys.authVerifyMnemonicBottomSheetPasswordAgain: '确认密码',
  LocaleKeys.authVerifyMnemonicBottomSheetButtonText: '确认生成密钥',
  LocaleKeys.authVerifyMnemonicBottomSheetPasswordRequired: '密码不能为空',
  LocaleKeys.authVerifyMnemonicBottomSheetPasswordAgainRequired: '确认密码不能为空',
  LocaleKeys.authVerifyMnemonicBottomSheetPasswordNotMatch: '两次密码不一致',

  // chats/conversations
  LocaleKeys.chatsConversationsEmptyPlaceholder: '让我们开始聊天吧!',
  LocaleKeys.chatsConversationsAddFriend: '添加好友',
  LocaleKeys.chatsConversationsNewCommunity: '新建社区',
  LocaleKeys.chatsConversationsJoinCommunity: '加入社区',

  // chats/chatting
  LocaleKeys.chatsChattingMessageInputPlaceholder: '发送给@{name}',
  LocaleKeys.chatsChattingVoiceRecordCancelText: '松开取消',
  LocaleKeys.chatsChattingVoiceRecordText: '按住说话',
  LocaleKeys.chatsChattingVoiceRecordStopText: '松开发送语音',

  // contacts/list
  LocaleKeys.contactsListAppBarTitle: '联系人',
  LocaleKeys.contactsNewFriend: '新的朋友',
  LocaleKeys.contactsCommunity: '社区',
  LocaleKeys.contactsBot: '精灵',
  LocaleKeys.contactsListEmptyPlaceholder: '开始添加第一个联系人吧!',

  // commodity/invite_friends
  LocaleKeys.commodityInviteFriendsAppBarTitle: '邀请好友加入社区',

  // commodity/create_commodity
  LocaleKeys.commodityCreateCommodityAppBarTitle: '创建社区',
  LocaleKeys.commodityCreateCommodityNameFieldLabel: '名称',
  LocaleKeys.commodityCreateCommodityNameFieldHint: '请输入社区名称',
  LocaleKeys.commodityCreateCommodityNameFieldError: '社区名称不能为空',
  LocaleKeys.commodityCreateCommodityListTitle: '{number} 个成员',

  // commodity/charting

  // commodity/details
  LocaleKeys.commodityDetailsAppBarTitle: '成员（@count）',
  LocaleKeys.commodityDetailsCommodityName: '社区名称',
  LocaleKeys.commodityDetailsCommodityAccount: '社区账号',
  LocaleKeys.commodityDetailsViewChatContent: '查看聊天内容',
  LocaleKeys.commodityDetailsMessageMute: '消息免打扰',
  LocaleKeys.commodityDetailsSaveToContacts: '保存到通讯录',
  LocaleKeys.commodityDetailsPinCommodity: '置顶社区',
  LocaleKeys.commodityDetailsCreateGroup: '新建小组',
  LocaleKeys.commodityDetailsExitCommodity: '退出社区',
  LocaleKeys.commodityDetailsDismissCommodity: '解散社区',
};
