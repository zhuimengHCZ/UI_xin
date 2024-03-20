@Component
export struct SearchComponent {
  @State
  readonlyMode: boolean = true
  placeholder: string = ''
  bg: string = ''
  color: string = ''

  build() {
    if (this.readonlyMode) {
      Row({ space: 4 }) {
        Image($r("app.media.ic_search"))
          .width('16vp')
          .aspectRatio(1)
          .fillColor(this.color || '#848484')
        Text(this.placeholder || '搜索')
          .fontColor(this.color || '#848484')
          .fontSize('14fp')
      }
      .layoutWeight(1)
      .height('32vp')
      .backgroundColor(this.bg || '#e8e7ee')
      .borderRadius('16vp')
      .justifyContent(FlexAlign.Center)
    } else {
      Search({
        placeholder: this.placeholder || "搜索",
      })
        .padding(0)
        .margin(0)
        .flexGrow(1)
        .placeholderColor('#848484')
        .height('32vp')
        .layoutWeight(1)
    }
  }
}