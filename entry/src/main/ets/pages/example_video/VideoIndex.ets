import emitter from '@ohos.events.emitter'
import { EventKeys, loadingEvent } from '../../event/EventKeys'
import LogUtils from '../../utils/LogUtils'
import { LoadingDialog } from '../../views/LoadingDialog'
import { TabView } from './view/TabView'
import { AppString } from '../../common/AppString'

@Entry
@Component
struct VideoIndex {
  @Provide homeTabSelected: number = 0
  @State loadingTips: string = "加载中..."
  @State loadingShow: boolean = false
  //全局的loading
  loadingDialogController: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({ loadingTips: this.loadingTips }),
    autoCancel: false,
    gridCount: 2,
    cancel: () => {
      this.loadingShow = false
    }
  })

  aboutToAppear() {
    emitter.on(loadingEvent, (event) => {
      if (event.data.showLoading == true && !this.loadingShow) {
        this.loadingShow = true
        this.loadingTips = event.data.loadingTips
        this.loadingDialogController.open()
      } else if (event.data.showLoading == false) {
        this.loadingDialogController.close()
        this.loadingShow = false
      }
    })
  }

  aboutToDisappear() {
    this.loadingDialogController = null
    emitter.off(EventKeys.LOADING_DIALOG_EVENT)
  }

  build() {
    Column() {
      TabView({
        selectedIndex: this.homeTabSelected,
        list: AppString.Example_Video_TABS,
        iconList: AppString.Example_Video_ICON_TABS,
        iconSelectedList: AppString.Example_Video_ICON_SEL_TABS,
        onChangeTab: (index) => {
          this.homeTabSelected = index;
        },
      })
    }
  }
}
