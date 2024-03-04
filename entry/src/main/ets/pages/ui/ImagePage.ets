import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct ImagePage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Column() {
        // Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
        //   Row() {
        //     // 加载png格式图片
        //     Image($r('app.media.ic_camera_master_ai_leaf'))
        //       .width(110).height(110).margin(15)
        //       .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        //     // 加载gif格式图片
        //     Image($r('app.media.loading'))
        //       .width(110).height(110).margin(15)
        //       .overlay('gif', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        //   }
        //   Row() {
        //     // 加载svg格式图片
        //     Image($r('app.media.ic_camera_master_ai_clouded'))
        //       .width(110).height(110).margin(15)
        //       .overlay('svg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        //     // 加载jpg格式图片
        //     Image($r('app.media.ic_public_favor_filled'))
        //       .width(110).height(110).margin(15)
        //       .overlay('jpg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        //   }
        // }
        Image("https://www.example.com/xxx.png")// 直接加载网络地址，请填写一个具体的网络图片地址
          .alt($r('app.media.icon'))// 使用alt，在网络图片加载成功前使用占位图
          .width(100)
          .height(100)
      }.height(320).width(360).padding({ right: 10, top: 10 })
    }
  }
}
