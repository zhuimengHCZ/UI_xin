import { AppString } from '../../../common/AppString'
import { TabView } from '../view/TabView'

///发现页面
@Component
export struct FindPage {
  @Provide findCurrentIndex: number = 0

  build() {
    Column() {
      TabView({
        selectedIndex: this.findCurrentIndex,
        list: AppString.Find_TABS,
        haveIndicator: true,
        onChangeTab: (index) => {
          this.findCurrentIndex = index;
        },
      })
    }
    .width("100%")
    .height("100%")
    .padding({ top: 40})
  }
}
