import { HomeModelIssueListItemList } from '../../../../model/HomeModel'
import SwiperComponent from '../../../../views/SwiperComponent'

@Component
export struct HomeListItemComponent {
  private item?: HomeModelIssueListItemList
  private listBanner: Array<string> = []

  aboutToAppear() {
    this.listBanner = []
    this.item?.bannerList?.forEach((item) => {
      this.listBanner = [...this.listBanner, item.data?.image]
    })
  }

  build() {
    if (this.item.type == "banner") {
      this.bannerComponent()
    } else {
      this.itemComponent()
    }
  }

  @Builder
  bannerComponent() {
    SwiperComponent({ swiperHeight: '200vp', swiperBorderRadius: 6, list: this.listBanner })
  }

  @Builder
  itemComponent() {
    Column() {
      Stack() {
        Image(this.item?.data?.cover?.feed)
          .width("100%")
          .height("100%")
          .border({ radius: $r('app.float.size_10') })
          .alt($r('app.media.ic_alt_image'))
        Text(this.item.data?.category)
          .width('45vp')
          .height('20vp')
          .fontColor(Color.White)
          .fontSize($r('app.float.size_text_12'))
          .backgroundColor(Color.Blue)
          .border({ radius: { topLeft: $r('app.float.size_10'), bottomRight: $r('app.float.size_10') } })
          .textAlign(TextAlign.Center)
          .position({ x: 0, y: 0 })
      }
      .width("100%")
      .height('210vp')
      .border({ radius: $r('app.float.size_5') })

      Row() {
        Image(this.item?.data?.author?.icon)
          .width('50vp')
          .height('50vp')
          .border({ radius: '25vp' })
        Column() {
          Text(this.item.data?.author?.name)
            .fontSize($r('app.float.size_text_15'))
            .fontColor($r('app.color.six3'))
          Text(this.item.data?.author?.name)
            .fontSize($r('app.float.size_text_13'))
            .fontColor($r('app.color.six9'))
            .margin({ top: $r('app.float.size_5') })
        }
        .alignItems(HorizontalAlign.Start)
        .flexGrow(1)
        .margin({ left: $r('app.float.size_5') })
        .justifyContent(FlexAlign.Center)
      }
      .width("100%")
      .height('60vp')
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.size_5'), right: $r('app.float.size_5') })
    }.width("100%")
  }
}