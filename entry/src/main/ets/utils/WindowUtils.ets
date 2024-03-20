import window from '@ohos.window'
import { AppString, Status_Bar_Height } from '../common/AppString'
import LogUtils from './LogUtils'

class WindowUtils {
  //设置系统状态栏
  fullScreen() {
    window.getLastWindow(getContext(), (error, data) => {
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      let statusBarHeight = px2vp(avoidArea.topRect.height)
      LogUtils.debug("顶部状态栏的高度", `${statusBarHeight}`)
      LogUtils.debug("底部系统导航栏的高度", `${avoidArea.bottomRect.height}`)
      if (statusBarHeight > 0) {
        data.setWindowLayoutFullScreen(true)
        AppStorage.SetOrCreate(Status_Bar_Height, statusBarHeight)
      }
    })
  }

  disableFullScreen() {
    window.getLastWindow(getContext()).then((windowStage: window.Window) => {
      windowStage.setWindowLayoutFullScreen(false)
      AppStorage.SetOrCreate(Status_Bar_Height, 0)
    })
  }

  //设置系统状态栏颜色
  setSysStatusBar(config: window.SystemBarProperties) {
    window.getLastWindow(getContext()).then((windowStage: window.Window) => {
      windowStage.setWindowSystemBarProperties(config, (err, result) => {
        LogUtils.debug("设置状态栏结果码", `${err.code}`)
        if (err.code == 0) {
          LogUtils.debug("状态栏设置成功")
        } else {
          LogUtils.debug("状态栏设置失败", `${err.message}`)
        }
      })
    })
  }

  setSysStatusBarLight() {
    this.setSysStatusBar({ statusBarColor: "#FFFFFF", statusBarContentColor: '#FFFFFF' })
  }

  setSysStatusBarDark() {
    this.setSysStatusBar({ statusBarColor: "#000000", statusBarContentColor: '#000000' })
  }
}


export const windowUtils = new WindowUtils()