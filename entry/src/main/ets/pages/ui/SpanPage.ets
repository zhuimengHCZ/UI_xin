// xxx.ets
import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct SpanPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text() {
          Span('This is the Span and ImageSpan component').fontSize(25).textCase(TextCase.Normal)
            .decoration({ type: TextDecorationType.None, color: Color.Pink })
        }.width('100%').textAlign(TextAlign.Center)

        Text() {
          // ImageSpan($r('app.media.icon'))
          //   .width('200px')
          //   .height('200px')
          //   .objectFit(ImageFit.Fill)
          //   .verticalAlign(ImageSpanAlignment.CENTER)
          Span('I am LineThrough-span')
            .decoration({ type: TextDecorationType.LineThrough, color: Color.Red }).fontSize(25)
          // ImageSpan($r('app.media.icon'))
          //   .width('50px')
          //   .height('50px')
          //   .verticalAlign(ImageSpanAlignment.TOP)
          Span('I am Underline-span')
            .decoration({ type: TextDecorationType.Underline, color: Color.Red }).fontSize(25)
          // ImageSpan($r('app.media.icon'))
          //   .size({ width: '100px', height: '100px' })
          //   .verticalAlign(ImageSpanAlignment.BASELINE)
          Span('I am Underline-span')
            .decoration({ type: TextDecorationType.Underline, color: Color.Red }).fontSize(25)
          // ImageSpan($r('app.media.icon'))
          //   .width('70px')
          //   .height('70px')
          //   .verticalAlign(ImageSpanAlignment.BOTTOM)
          Span('I am Underline-span')
            .decoration({ type: TextDecorationType.Underline, color: Color.Red }).fontSize(50)
        }
        .width('100%')

        // .textIndent(50)
      }.width('100%').height('100%')
    }
  }
}
