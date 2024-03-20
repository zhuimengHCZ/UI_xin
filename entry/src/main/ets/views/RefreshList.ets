import LogUtils from '../utils/LogUtils'
import { RefreshFooter } from './RefreshFooter'

export class ListController {
  loaded: () => void = () => {
  }
  finished: () => void = () => {
  }
  refreshed: () => void = () => {
  }
  reload: () => void = () => {
  }
}

@Component
export struct ListComponent {
  private scrollOffset: number = 0
  private spaceValue: number
  @State alpha: number = 0
  @State refreshing: boolean = false
  @State finished: boolean = false
  @State loading: boolean = false

  @Builder
  defaultListContent() {
  }

  @BuilderParam
  listContent: () => void = this.defaultListContent
  onLoad: () => void = () => {
  }
  onRefresh: () => void = () => {
  }
  controller: ListController = new ListController()
  scroller: Scroller = new Scroller()

  aboutToAppear() {
    if (this.controller) {
      this.controller.loaded = () => this.loading = false
      this.controller.finished = () => this.finished = true
      this.controller.refreshed = () => this.refreshing = false
      this.controller.reload = () => {
        this.finished = false
        this.refreshing = true
      }
    }
  }

  build() {
    Refresh({ refreshing: $$this.refreshing, offset: 100, friction: 100 }) {
      List({ scroller: this.scroller, space: this.spaceValue }) {
        this.listContent()
        ListItem() {
          RefreshFooter({ loading: this.loading, finished: this.finished })
        }
      }
      .width('100%')
      .height('100%')
      .divider({
        strokeWidth: '0.5vp',
        color: $r('app.color.f5f5f5'),
        startMargin: 10,
        endMargin: 10
      })
      .padding(this.spaceValue)
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
      })
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.scrollOffset += scrollOffset
        LogUtils.debug("Scroll滚动距离", `${scrollState}  >>  ${scrollOffset}`)
        this.dispatchScrollOffset()
      })
      .onScrollStop(() => {
        LogUtils.debug("Scroll滚动距离", "scrollStateStop")
        this.dispatchScrollOffset()
      })
      .onReachEnd(() => {
        if (this.refreshing || this.finished) return;
        this.loading = true
        this.onLoad()
      })
      .scrollBar(BarState.Off)
      // .nestedScroll({
      //   scrollForward: NestedScrollMode.PARENT_FIRST,
      //   scrollBackward: NestedScrollMode.SELF_FIRST
      // })
      .edgeEffect(EdgeEffect.None)
    }
    .width('100%')
    .height('100%')
    .onRefreshing(() => {
      if (this.loading) return;
      this.finished = false
      this.onRefresh()
    })
  }

  /**
   * 处理滚动事件
   */
  private dispatchScrollOffset() {
    let alpha = this.scrollOffset / 300
    this.alpha = alpha > 1 ? 1 : alpha < 0 ? 0 : alpha
    LogUtils.info("scroll", `${this.scrollOffset}`)
  }
}
