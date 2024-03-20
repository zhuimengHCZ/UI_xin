import { AppString } from '../common/AppString';
import LogUtils from '../utils/LogUtils';
import { windowUtils } from '../utils/WindowUtils';
import { TabView } from './example_video/view/TabView';

@Entry
@Component
struct IndexPage {
  @Provide selectedIndex: number = 0; // 被选定的tabBar下标(首页)

  onPageShow(): void {
    windowUtils.fullScreen()
    LogUtils.error("页面可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  onPageHide(): void {
    windowUtils.setSysStatusBarDark()
    LogUtils.error("页面不可见>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }

  build() {
    Column() {
      TabView({
        selectedIndex: this.selectedIndex,
        list: AppString.HOME_TABS,
        iconList: AppString.HOME_ICON_TABS,
        iconSelectedList: AppString.HOME_ICON_SEL_TABS
      })
    }
  }
}