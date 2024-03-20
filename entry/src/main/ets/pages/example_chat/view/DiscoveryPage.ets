import { AppBar } from '../../../views/AppBar'
import { DividerView } from '../../view/DividerView'
import { ChatComponent } from './ChatComponents'

@Entry
@Component
export struct DiscoveryPage {
  build() {
    Column() {
      AppBar({ title: '发现' })
      ChatComponent({ portrait: "moments.png", title: "朋友圈", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "shipinghao.png", title: "视频号", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "zb.png", title: "直播", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "sys.png", title: "扫一扫", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "yyy.png", title: "摇一摇", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "kyk.png", title: "看一看", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "souyisou.png", title: "搜一搜", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "fujin.png", title: "附近", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "gw.png", title: "购物", haveRightImg: true })
      DividerView({ marginValue: { left: '195px', top: 3 } })
      ChatComponent({ portrait: "game.png", title: "游戏", haveRightImg: true })
      DividerView({ heightNum: 30 })

      ChatComponent({ portrait: "xcx.png", title: "小程序", haveRightImg: true })
      DividerView({ heightNum: 30 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}