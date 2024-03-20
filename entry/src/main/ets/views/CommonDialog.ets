///通用Dialog弹窗组件
import { DividerView } from '../pages/view/DividerView'

@CustomDialog
export struct CommonDialog {
  //自定义加载的内容
  @BuilderParam contentBuilder?: () => void
  private title: ResourceStr
  private description: ResourceStr
  private confirmText = "确认"
  private cancelText = "取消"
  private confirm: () => void
  private cancel: () => void
  private showConfirm = true
  private showCancel = true

  //弹窗控制器
  controller: CustomDialogController

  aboutToAppear() {
  }

  build() {

    Column() {
      if (this.title) {
        Text(this.title)
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .height('50fp')
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      if (this.description) {
        Text(this.description)
          .fontColor($r('app.color.six5'))
          .textAlign(TextAlign.Center)
          .padding('28fp')
      }
      if (this.contentBuilder) {
        this.contentBuilder()
      }
      DividerView({heightNum:1,diverColor:'#efefef'})
      Row() {
        Text(this.cancelText)
          .flexShrink(1)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .visibility(this.showCancel ? Visibility.Visible : Visibility.None)
          .onClick(() => {
            this.cancel?.()
            this.controller.close()
          })
        Divider()
          .color('#efefef')
          .vertical(true)
          .visibility((this.showCancel && this.showConfirm) ? Visibility.Visible : Visibility.None)
        Text(this.confirmText)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .fontColor(Color.Blue)
          .visibility(this.showConfirm ? Visibility.Visible : Visibility.None)
          .onClick(() => {
            this.confirm?.()
            this.controller.close()
          })
      }
      .height('50vp')
      .width("100%")
      // .border({
      //   width: { top: 1 },
      //   color: { top: $r('app.color.f5f5f5') },
      //   style: { top: BorderStyle.Solid }
      // })
    }
    .backgroundColor(Color.White)
    .borderRadius(20)
    .alignItems(HorizontalAlign.Center)
    .margin({ left: 15, right: 15 })
  }
}