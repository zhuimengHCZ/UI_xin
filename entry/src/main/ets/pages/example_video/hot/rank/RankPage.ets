import { AppString } from '../../../../common/AppString'
import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../../model/HomeModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'
import LogUtils from '../../../../utils/LogUtils'
import { HomeListItemComponent } from '../../home/component/HomeListItemComponent'
import { RankViewModel } from '../../viewmodel/RankViewModel'

import { StateComponent } from '../../../../views/StateComponent'

@Component
export struct RankPage {
  private positionIndex: number = 0
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State rankList: HomeModelIssueListItemList[] = []
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onHotTabSelectedIndex") hotCurrentIndex: number
  private hasInit = false
  //因为三个共用了
  private viewModel = new RankViewModel()

  aboutToAppear() {
    this.viewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet()
    }
  }

  //懒加载处理逻辑
  onHomeTabSelected() {
    LogUtils.debug("Focus-homeTabSelectedIndex>>>", `FindIndex:${this.hotCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  //懒加载处理逻辑
  onHotTabSelectedIndex() {
    LogUtils.debug("Focus-onFindTabSelectedIndex>>>", `FindIndex:${this.hotCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 2 && this.hotCurrentIndex == this.positionIndex) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    this.viewModel.getRankList(AppString.Hot_rankType[this.positionIndex], (result) => {
      this.rankList = result
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.rankList, (item: HomeModelIssueListItemList, index: number) => {
            ListItem() {
              HomeListItemComponent({ item: item })
            }.onClick(() => {
              Router.push(RoutePath.DetailPage, { "id": item.data.id, "url": item.data.playUrl })
            })
          })
          ListItem() {
            this.itemFooter()
          }
        }
        .listDirection(Axis.Vertical) // 排列方向
        .margin({ left: 10, top: 10, right: 10, bottom: 50 })
        .divider({
          strokeWidth: 1,
          color: $r('app.color.f5f5f5'),
          startMargin: 10,
          endMargin: 10
        })
      }
    }
  }

  @Builder
  itemFooter() {
    Row() {
      Divider().strokeWidth(2).color($r('app.color.six9')).width('50vp')
      Text("我是有底线的")
        .margin({ left: 15, right: 15 })
        .fontColor($r('app.color.six9'))
        .fontSize($r('app.float.size_text_15'))
      Divider().strokeWidth(2).color($r('app.color.six9')).width('50vp')
    }
    .height('50vp')
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width("100%")
  }
}