import router from '@ohos.router';
import window from '@ohos.window';
import LogUtils from '../utils/LogUtils';


@Component
export struct AppBar {
  private title?: string|Resource;
  @State statusBarHeight: number = 0
  private titleAlignment: TextAlign = TextAlign.Center
  private isDark: boolean = false
  private backButton: boolean = true
  private onBackClick?: () => void

  aboutToAppear() {
    this.setSystemStatusBar()
  }

  setSystemStatusBar() {
    let context = getContext(this)
    window.getLastWindow(context, (error, data) => {
      //1、设置系统状态栏
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      //这里为什么要自己设置一个高度？因为系统返回的高度太高了，并不能正确的返回系统状态栏的高度，自己二次设置一个接近的值
      avoidArea.topRect.height = 90
      this.statusBarHeight = avoidArea.topRect.height
      LogUtils.debug("顶部状态栏的高度", `${this.statusBarHeight}`)
      let bottomHeight = avoidArea.bottomRect.height
      LogUtils.debug("底部系统导航栏的高度", `${bottomHeight}`)
      //2、设置系统状态栏颜色---该API废弃了，统一返回801，目前没找到好的方法设置状态栏文字的颜色，放弃了。。。。。。
      const systemBarProperties: window.SystemBarProperties = {
        //顶部状态栏颜色
        statusBarColor: "#ffffff",
        statusBarContentColor: "#ffffff",
        isStatusBarLightIcon: true
      }
      data.setWindowSystemBarProperties(systemBarProperties, (err, result) => {
        LogUtils.debug("设置状态栏结果码", `${err.code}`)
        if (err.code == 0) {
          LogUtils.debug("状态栏设置成功")
        } else {
          LogUtils.debug("状态栏设置失败", `${err.message}`)
        }
      })
    })
  }

  build() {
    Column() {
      Row() {
        if (this.backButton) {
          Button() {
            Image($r('app.media.ic_back'))
              .size({ width: $r('app.float.size_16'), height: $r('app.float.size_16') })
          }
          .backgroundColor($r('app.color.background_shallow_grey'))
          .id('backBtn')
          .onClick(() => {
            this.onBackClick?.()
            router.back();
          })
        }
        Text(this.title)
          .flexGrow(1)
          .textAlign(this.titleAlignment)
          .fontColor(this.isDark ? Color.White : Color.Black)
          .fontSize($r('app.float.size_text_16'))
          .align(Alignment.Center)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding($r('app.float.page_padding'))

      Divider()
        .width('100%')
        .height($r('app.float.divider_height'))
        .color($r('app.color.divider_color'))
        .margin({ bottom: 12 })
    }
    .width('100%')
    .height(this.statusBarHeight)
    .justifyContent(FlexAlign.Center | FlexAlign.End)
  }
}