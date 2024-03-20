import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { TopicModelItemList } from '../../../../model/TopicModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'
import ImageRegexUtils from '../../../../utils/ImageRegexUtils'
import LogUtils from '../../../../utils/LogUtils'
import TopicViewModel from '../../viewmodel/TopicViewModel'
import { StateComponent } from '../../../../views/StateComponent'
import { ListComponent, ListController } from '../../../../views/RefreshList'

@Component
export struct TopicPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State topicList: TopicModelItemList[] = []
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false
  controller = new ListController()

  aboutToAppear() {
    TopicViewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet()
    }
  }

  //懒加载处理逻辑
  onHomeTabSelected() {
    LogUtils.debug("Topic-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  //懒加载处理逻辑
  onFindTabSelectedIndex() {
    LogUtils.debug("Topic-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 2) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    TopicViewModel.getTopicData((result) => {
      this.controller.refreshed()
      this.controller.loaded()
      if (TopicViewModel.pageIndex == 0) {
        this.topicList = result
      } else {
        this.topicList = [...this.topicList, ...result]
      }
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        ListComponent({
          controller: this.controller,
          spaceValue: 10,
          onRefresh: () => {
            TopicViewModel.pageIndex = 0
            this.loadNet()
          },
          onLoad: () => {
            this.loadNet()
          }
        }) {
          ForEach(this.topicList, (item: TopicModelItemList, index: number) => {
            Image(ImageRegexUtils(item.data.image))
              .alt($r('app.media.ic_alt_image'))
              .width("100%")
              .height('200vp')
              .border({ radius: $r('app.float.size_5') })
              .onClick(() => {
                Router.push(RoutePath.TopicDetailPage, { "id": item.data.id })
              })
          })
        }

        /*Refresh({ refreshing: $$this.isRefreshing }) {
          List({ space: 10, initialIndex: 0 }) {
            ForEach(this.topicList, (item: TopicModelItemList, index: number) => {
              ListItem() {
                Image(ImageRegexUtils(item.data.image))
                  .alt($r('app.media.ic_alt_image'))
                  .width("100%")
                  .height('200vp')
                  .border({ radius: $r('app.float.size_5') })
              }.onClick(() => {
                Router.push(RoutePath.TopicDetailPage, { "id": item.data.id })
              })
            })
            ListItem() {
              RefreshFooter({ showFooter: this.showLoading })
            }
          }
          .listDirection(Axis.Vertical)
          .onReachEnd(() => {
            this.showLoading = true
            this.loadNet()
          }).padding({ left: $r('app.float.size_10'), right: $r('app.float.size_10'), top: $r('app.float.size_10') })
        }.onRefreshing(() => {
          TopicViewModel.pageIndex = 0
          this.loadNet()
        })*/
      }
    }
  }
}