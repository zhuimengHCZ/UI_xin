import { DividerView } from '../../view/DividerView'
import { ChatComponent } from './ChatComponents'

@Entry
@Component
export struct MyPage {
  build() {
    Column() {
      Row() {
        Image($r("app.media.default_avatar2"))
          .width('200px')
          .height('200px')
          .margin({ left: '100px', right: '50px' })
          .border({
            radius: 4
          })

        Column() {
          Text('韩立')
            .fontSize('20fp').margin({ bottom: '10px' })
          Row() {
            Text('微信号：123456')
              .fontSize('14fp')
              .fontColor("#c2bec2")
            Image($r('app.media.ic_right'))
              .width('24px')
              .height('48px')
              .margin({ left: '20px', right: '50px' })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        }
        .height('200px')
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Start)
      }.width('100%').margin({ top: 50, bottom: 30 })

      DividerView({ heightNum: 30 })
      ChatComponent({ portrait: "pay.png", title: "服务", haveRightImg: true })
      DividerView({ heightNum: 30 })
      ChatComponent({ portrait: "favorites.png", title: "收藏", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "moments2.png", title: "朋友圈", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "card.png", title: "卡包", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "emoticon.png", title: "表情", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "setting.png", title: "设置", haveRightImg: true })
      DividerView({ heightNum: 30 })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}