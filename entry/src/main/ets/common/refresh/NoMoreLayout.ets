import { RefreshConst } from './RefreshConst'

@Component
export default struct NoMoreLayout {
  build() {
    Row() {
      Text($r('app.string.load_more_empty'))
        .margin({ left: RefreshConst.NoMoreLayoutConstant_NORMAL_PADDING })
        .fontSize(RefreshConst.NoMoreLayoutConstant_TITLE_FONT)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .height(RefreshConst.CUSTOM_LAYOUT_HEIGHT)
  }
}