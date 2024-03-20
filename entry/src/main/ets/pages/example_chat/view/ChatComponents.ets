
@Component
export struct ChatComponent {
  private portrait: string
  private title: string
  private subTitle?: string
  private time?: string
  private haveRightImg?: boolean

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Image($rawfile(this.portrait))
          .width('120px')
          .height('120px')
          .margin({ left: '50px', right: '50px' })
          .border({
            radius: 4
          })

        Column() {
          Text(this.title)
            .fontSize('16fp').margin({ bottom: '10px' })
          if (this.subTitle) {
            Text(this.subTitle)
              .fontSize('12pf')
              .width('620px')
              .maxLines(1)
              .fontColor("#c2bec2")
          }
        }
        .alignItems(HorizontalAlign.Start)
        .flexGrow(1)

        if (this.time) {
          Text(this.time)
            .fontSize('12fp')
            .margin({ right: '50px' })
            .fontColor('#c2bec2')
        }
        if (this.haveRightImg) {
          Image($rawfile('arrow.png'))
            .width('75px')
            .height('75px')
            .margin({ right: '40px' })
        }

      }
      .width('100%')
      .height('180px')
    }
  }
}