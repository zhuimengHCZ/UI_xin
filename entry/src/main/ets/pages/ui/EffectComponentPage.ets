//Index.ets
@Entry
@Component
struct Index {
  build() {
    Stack() {
      Image($r("app.media.landing_image"))
        .autoResize(true)
      // EffectComponent() {
      //   Column({ space: 20 }) {
      //     // 使用backgroundBlurStyle进行模糊绘制
      //     Text("Normal text with backgroundBlurStyle")
      //       .textAlign(TextAlign.Center)
      //       .fontSize(16)
      //       .fontWeight(FontWeight.Medium)
      //       .backgroundBlurStyle(BlurStyle.Thick)
      //       .borderRadius(16)
      //       .width('90%')
      //       .height('48')
      //
      //     // 不进行模糊绘制
      //     Text("Normal text without blur effect")
      //       .textAlign(TextAlign.Center)
      //       .fontSize(16)
      //       .fontWeight(FontWeight.Medium)
      //       .border({ width: 1 })
      //       .borderRadius(16)
      //       .width('90%')
      //       .height('48')
      //
      //     // 使用useEffect进行模糊合并绘制，继承EffectComponent的模糊参数
      //     Text("Normal text with useeffcet blur 1")
      //       .textAlign(TextAlign.Center)
      //       .useEffect(true)
      //       .fontSize(16)
      //       .fontWeight(FontWeight.Medium)
      //       .borderRadius(16)
      //       .width('90%')
      //       .height('48')
      //
      //     // 使用useEffect进行模糊合并绘制，继承EffectComponent的模糊参数
      //     Text("Normal text with useeffcet blur 2")
      //       .textAlign(TextAlign.Center)
      //       .useEffect(true)
      //       .fontSize(16)
      //       .fontWeight(FontWeight.Medium)
      //       .borderRadius(16)
      //       .width('90%')
      //       .height('48')
      //   }
      //   .width('100%')
      // }
      // .backgroundBlurStyle(BlurStyle.Thin)
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}
