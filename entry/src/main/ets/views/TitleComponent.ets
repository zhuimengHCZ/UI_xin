@Component
export default struct TitleComponent {
  @Prop title: string;

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Divider()
        .height(20)
        .width(5)
        .backgroundColor(Color.Blue)
        .margin({ right: 10 })
      Text(this.title).fontSize(25)
    }.alignSelf(ItemAlign.Start)
    .margin({ bottom: 15 })
  }
}