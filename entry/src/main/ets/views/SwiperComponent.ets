@Component
export default struct SwiperComponent {
  private swiperHeight: Length
  private swiperBorderRadius?: number
  private swiperImageFit?: ImageFit
  private list: Array<string> = [];
  private swiperController: SwiperController = new SwiperController()

  aboutToAppear() {
  }

  build() {
    if (this.list.length > 0) {
      Swiper(this.swiperController) {
        ForEach(this.list, (item: string) => {
          Image(item)
            .width('100%')
            .height(this.swiperHeight)
            .alt($r('app.media.ic_alt_image'))
            .objectFit(this.swiperImageFit ?? ImageFit.Fill)
            .borderRadius(this.swiperBorderRadius)
        })
      }
      .cachedCount(3)
      .index(0)
      .width('100%')
      .itemSpace(20)
      .loop(false)
      .autoPlay(true)
      .duration(500)
      .interval(4000)
      .curve(Curve.Linear)
      .indicator(true)
      .indicatorStyle({ color: Color.White, selectedColor: Color.Blue })
    }
  }
}