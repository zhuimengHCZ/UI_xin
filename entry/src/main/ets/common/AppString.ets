/**
 * Common constants for all features.
 */
export const Status_Bar_Height:string = 'statusBarHeight';
export const USER_INFO_KEY:string = 'user_info_key';
export class AppString {
  static readonly APP_KEY = "app_key";
  static readonly TOKEN_KEY = "token_key";
  static readonly USER_LOGIN = "user_login";
  static readonly HOME_TABS: ResourceStr[] = [$r('app.string.table_ui'), $r('app.string.table_example'), "我的"];
  static readonly HOME_ICON_TABS: Resource[] = [$r('app.media.ic_ui'), $r('app.media.ic_example'), $r('app.media.ic_mine')];
  static readonly HOME_ICON_SEL_TABS: Resource[] = [$r('app.media.ic_sel_ui'), $r('app.media.ic_sel_example'), $r('app.media.ic_sel_mine')];
  static readonly Example_Video_TABS: ResourceStr[] = ["首页", "发现", "热门"];
  static readonly Example_Video_ICON_TABS: Resource[] = [$r('app.media.ic_home'), $r("app.media.ic_find"), $r("app.media.ic_hot")];
  static readonly Example_Video_ICON_SEL_TABS: Resource[] = [$r('app.media.ic_sel_home'), $r("app.media.ic_sel_find"), $r("app.media.ic_sel_hot")];
  static readonly Find_TABS: string[] = ["关注", "分类", "主题"];
  static readonly Hot_TABS: string[] = ["周排行", "月排行", "总排行"];
  static readonly Hot_rankType: string[] = ["weekly", "monthly", "historical"];
  static readonly Example_Article_TABS: ResourceStr[] = ["首页", "其他"];
  static readonly Example_Article_ICON_TABS: Resource[] = [$r('app.media.ic_home'), $r("app.media.ic_hot")];
  static readonly Example_Article_ICON_SEL_TABS: Resource[] = [$r('app.media.ic_sel_home'), $r("app.media.ic_sel_hot")];
  static readonly Example_Chat_TABS: ResourceStr[] = ['微信','通讯录','发现','我'];
  static readonly Example_Chat_ICON_TABS: Resource[] = [$r('app.media.wechat_normal'),$r('app.media.contacts_normal'),$r('app.media.find_normal'),$r('app.media.me_normal')];
  static readonly Example_Chat_ICON_SEL_TABS: Resource[] = [$r('app.media.wechat_selected'),$r('app.media.contacts_selected'),$r('app.media.find_selected'),$r('app.media.me_selected')];
  static readonly sexType=['男', '女']
  static readonly phoneType=['相机', '相册']

  static readonly SEARCH_PLACEHOLDER: string = 'Search...';
  /**
   * 设备UUID
   * @type {string}
   */
  static readonly UUID = "3e7ee30c6fc0004a773dc33b0597b5732b145c04";
  /**
   * 设备号
   * @type {string}
   */
  static readonly DEVICE_NUM = "ONEPLUS%20A6000"
}