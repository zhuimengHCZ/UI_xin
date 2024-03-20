/**
 * TabBar组件
 */

@Component
export struct TabBarView {
  private title: ResourceStr // 标题
  private icon: string | PixelMap | Resource // 未选中图标
  private iconSelected: string | PixelMap | Resource // 选中图标
  private index: number; // tabBar下标
  @Link selectedIndex: number; // 被选定的tabBar下标
  private haveIndicator?: boolean; // 是否有指示器

  build() {
    Column() {
      if (this.icon) {
        Image(this.selectedIndex === this.index ? this.iconSelected : this.icon)
          .width($r('app.float.size_21'))
          .height($r('app.float.size_21'))
          .margin({ bottom: $r('app.float.size_4') })
      }else {
        Text(this.title)
          .height(this.haveIndicator ? '45vp' : '15vp')
          .fontSize($r('app.float.size_text_12'))
          .fontWeight(this.selectedIndex === this.index ? 500 : 400)
          .fontFamily('HarmonyHeiTi-Medium')
          .fontColor(this.selectedIndex === this.index ? Color.Blue : Color.Gray)
          .flexGrow(1)
          .textAlign(TextAlign.Center)
      }
      if (this.haveIndicator)
        Divider()
          .strokeWidth(5)
          .color(Color.Blue)
          .opacity(this.selectedIndex === this.index ? 1 : 0)
          .width('80vp')
          .lineCap(LineCapStyle.Round)
    }
    .width('100%')
    .height('100%')
    .id(`tabBar${this.title}`)
    .padding({ top: 8, bottom: 10 })
    .justifyContent(FlexAlign.Center)
  }
}