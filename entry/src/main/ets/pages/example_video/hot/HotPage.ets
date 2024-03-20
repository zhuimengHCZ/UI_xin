import { AppString } from '../../../common/AppString'
import { TabView } from '../view/TabView'

///热门页面
@Component
export struct HotPage {
  @Provide hotCurrentIndex: number = 0

  build() {
    Column() {
      TabView({
        selectedIndex: this.hotCurrentIndex,
        list: AppString.Hot_TABS,
        haveIndicator: true,
        onChangeTab: (index) => {
          this.hotCurrentIndex = index;
        }
      })
    }.padding({ top: 40 })
  }
}