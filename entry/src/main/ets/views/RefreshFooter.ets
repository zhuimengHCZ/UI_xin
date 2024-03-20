///通用上拉加载底部布局
@Component
export struct RefreshFooter {
  @Prop loading: boolean
  @Prop finished: boolean

  build() {
    Row() {
      // if (this.loading && !this.finished) {
      //   LoadingProgress()
      //     .width('24vp')
      // }
      Text($r(this.finished ? 'app.string.load_more_empty' : 'app.string.loading'))
        .fontColor($r('app.color.six3'))
        .fontSize($r('app.float.size_text_15'))
    }
    .width("100%")
    .height('50vp')
    .backgroundColor($r('app.color.f8f8f8'))
    .visibility(this.finished || this.loading ? Visibility.Visible : Visibility.None)
    .justifyContent(FlexAlign.Center)
  }
}