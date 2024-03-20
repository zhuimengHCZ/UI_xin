import { FocusModelItemList, FocusModelItemListDataItemList } from '../../../../../model/FocusModel'
import { RoutePath } from '../../../../../route/RoutePath'
import { Router } from '../../../../../route/Router'

@Component
export struct FocusItemComponent {
  private item: FocusModelItemList

  build() {
    Column() {
      Row() {
        Image(this.item.data.header.icon)
          .width('50vp')
          .height('50vp')
          .border({ radius: '25vp' })
        Column() {
          Text(this.item.data?.header.title)
            .fontSize($r('app.float.size_text_15'))
            .fontColor($r('app.color.six3'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(this.item.data?.header.description)
            .fontSize($r('app.float.size_text_13'))
            .fontColor($r('app.color.six9'))
            .margin({ top: $r('app.float.size_5') })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
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

      List({ space: 10 }) {
        ForEach(this.item.data.itemList, (innerItem: FocusModelItemListDataItemList, index: number) => {
          ListItem() {
            Stack() {
              Stack() {
                Image(innerItem.data?.cover.feed)
                  .width("100%")
                  .height("100%")
                  .border({ radius: $r('app.float.size_10') })
                  .alt($r('app.media.ic_alt_image'))
                Text(innerItem.data?.category)
                  .width('45vp')
                  .height('20vp')
                  .fontColor(Color.White)
                  .fontSize($r('app.float.size_text_12'))
                  .backgroundColor(Color.Blue)
                  .border({ radius: { topLeft: $r('app.float.size_10'), bottomRight: $r('app.float.size_10') } })
                  .textAlign(TextAlign.Center)
                  .position({ x: 0, y: 0 })
              }
            }
            .height('130vp')
            .width('220vp')
          }.onClick(() => {
            Router.push(RoutePath.DetailPage, { "id": innerItem.data.id, "url": innerItem.data.playUrl })
          })
        })
      }
      .listDirection(Axis.Horizontal)
      .height('130vp')
      .width("100%")
    }
  }
}