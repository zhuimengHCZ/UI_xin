// xxx.ets
import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct MarqueePage {
  @State start: boolean = false
  private fromStart: boolean = true
  private step: number = 50
  private loop: number = Number.POSITIVE_INFINITY
  private src: string = "Running Marquee starts rolling"

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Marquee({
          start: this.start,
          step: this.step,
          loop: this.loop,
          fromStart: this.fromStart,
          src: this.src
        })
          .width(360)
          .height(80)
          .fontColor('#FFFFFF')
          .fontSize(48)
          .fontWeight(700)
          .backgroundColor('#182431')
          .margin({ bottom: 40 })
          .onStart(() => {
            console.info('Marquee animation complete onStart')
          })
          .onBounce(() => {
            console.info('Marquee animation complete onBounce')
          })
          .onFinish(() => {
            console.info('Marquee animation complete onFinish')
          })
        Button('Start')
          .onClick(() => {
            this.start = true
          })
          .width(120)
          .height(40)
          .fontSize(16)
          .fontWeight(500)
          .backgroundColor('#007DFF')
      }
      .width('100%')
      .height('100%')
    }
  }
}
