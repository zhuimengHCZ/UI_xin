// xxx.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct TextAreaPage {
  @State text: string = ''
  controller: TextAreaController = new TextAreaController()

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.text)
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}