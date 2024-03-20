import { ViewStateConstant } from '../common/ViewStateConstant';

@Component
export struct StateComponent {
  @Prop viewState: string;
  //页面内容区域组件
  @BuilderParam viewContent: () => void
  //重试的回调方法
  retryCallback?: () => void

  build() {
    Stack() {
      if (this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS) {
        this.holdContent()
      } else {
        this.viewContent()
      }
    }.layoutWeight(1)
  }

  //占位组件
  @Builder
  holdContent() {
    Column() {
      Image(this.convertImage())
        .width('100vp')
        .height('100vp')
      Text(this.convertValue())
        .fontSize($r('app.float.size_text_15'))
        .fontColor($r("app.color.six6"))
        .margin($r('app.float.size_10'))
      if (this.viewState != ViewStateConstant.VIEW_STATE_LOADING) {
        Button($r('app.string.press_retry'))
          .width('120vp')
          .height('35vp')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .onClick(() => {
            this.retryCallback?.()
          })
      }
    }
  }

  //转换文案
  convertValue() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.string.loading')
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.string.load_error')
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.string.net_error')
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.string.load_empty')
      default:
        return $r('app.string.load_success')
    }
  }

  //转换图片
  convertImage() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.media.loading')
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.media.common_empty_content')
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.media.timeout')
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.media.common_empty_content')
      default:
        return $r('app.media.loading')
    }
  }
}



