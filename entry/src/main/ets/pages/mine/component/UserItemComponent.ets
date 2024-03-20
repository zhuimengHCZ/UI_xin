@Component
export struct UserItemComponent {
  private name: string
  private value: string=''
  private confirm?: () => void

  @Styles
  rowStyle(){
    .border({
      width: {
        bottom: 1,
      },
      color: {
        bottom: '#efefef'
      },
      style: {
        bottom: BorderStyle.Solid
      }
    })
    .width('100%')
    .padding({ top: 15, bottom: 15 })
  }

  @Styles
  arrowStyle(){
    .margin({ left: 10 })
    .height(24)
    .width(12).opacity(0.2)
  }

  build() {
    Row() {
      Text(this.name).flexGrow(1)
      Text(this.value)
      Image($r('app.media.ic_right')).arrowStyle()
    }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
      this.confirm?.()
    })
  }
}