import { Status_Bar_Height } from '../common/AppString';
import { DividerView } from '../pages/view/DividerView';
import { Router } from '../route/Router';


@Component
export struct AppBar {
  @StorageProp(Status_Bar_Height)
  statusBarHeight: number = 0
  private title?: ResourceStr;
  private rightTitle?: ResourceStr;
  private leftImg?: Resource;
  private rightImg?: Resource;
  private appBarHeight: number = 50
  private titleAlignment: TextAlign = TextAlign.Center
  private isDark: boolean = false
  private backButton: boolean = true
  private leftClick?: () => void
  private rightClick?: () => void

  build() {
    Column() {
      Row() {
        if (this.backButton) {
          Button() {
            Image(this.leftImg ?? $r('app.media.ic_back'))
              .size({ width: $r('app.float.size_16'), height: $r('app.float.size_16') })
          }
          .backgroundColor(Color.Transparent)
          .padding('12vp')
          .id('backBtn')
          .onClick(() => {
            this.leftClick?.()
            Router.back()
          })
        }
        if (this.title) {
          Text(this.title)
            .flexGrow(1)
            .textAlign(this.titleAlignment)
            .fontColor(this.isDark ? Color.White : Color.Black)
            .fontSize($r('app.float.size_text_16'))
            .align(Alignment.Center)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        if (this.rightTitle || this.rightImg) {
          Button() {
            if (this.rightTitle) {
              Text(this.rightTitle)
                .flexGrow(1)
                .textAlign(this.titleAlignment)
                .fontColor(this.isDark ? Color.White : Color.Black)
                .fontSize($r('app.float.size_text_16'))
                .align(Alignment.Center)
            } else {
              Image(this.rightImg)
                .size({ width: $r('app.float.size_16'), height: $r('app.float.size_16') })
            }
          }
          .backgroundColor(Color.Transparent)
          .padding('12vp')
          .id(`right:${this.rightTitle ?? this.rightImg}`)
          .onClick(() => {
            this.rightClick?.()
          })
        } else {
          if(this.backButton){
            Row().width('40vp')
          }
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.Center | FlexAlign.SpaceBetween)
      DividerView()
    }
    .width('100%')
    .height(this.statusBarHeight + this.appBarHeight)
    .justifyContent(FlexAlign.Center | FlexAlign.End)
  }
}