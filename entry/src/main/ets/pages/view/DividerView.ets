@Component
export struct DividerView {
  private heightNum: number = 0.88
  private diverColor: ResourceStr = $r('app.color.divider')
  private marginValue?: Margin

  build() {
    Divider()
      .vertical(false)
      .height(this.heightNum)
      .color(this.diverColor)
      .margin(this.marginValue)
      .strokeWidth(`${this.heightNum}px`)
  }
}