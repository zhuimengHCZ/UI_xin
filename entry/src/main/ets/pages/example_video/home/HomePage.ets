import { AppBar } from '../../../views/AppBar'
import { ViewStateConstant } from '../../../common/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import LogUtils from '../../../utils/LogUtils'
import HomeViewModel from '../viewmodel/HomeViewModel'
import { StateComponent } from '../../../views/StateComponent'
import { ListComponent, ListController } from '../../../views/RefreshList'
import { HomeListItemComponent } from './component/HomeListItemComponent'
import { Router } from '../../../route/Router'
import { RoutePath } from '../../../route/RoutePath'

///首页
@Component
export struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: HomeModelIssueListItemList[] = []
  @Consume @Watch('onTabSelected') homeTabSelected: number
  controller = new ListController()

  aboutToAppear() {
    HomeViewModel.observeState(state => {
      this.viewState = state
    })
    this.loadNet()
  }

  onTabSelected() {
    LogUtils.debug("onTabSelected>>>", `${this.homeTabSelected}`)
  }

  loadNet() {
    HomeViewModel.getHomeList(
      (result) => {
        this.controller.refreshed()
        this.controller.loaded()
        if (HomeViewModel.getDate() == "") {
          this.dataList = result
        } else {
          this.dataList = [...this.dataList, ...result]
        }
        // if (this.dataList.length % 10 != 0) {
        //   this.controller.finished()
        // }
      })
  }

  build() {
    Column() {
      AppBar({ title: "首页" }).align(Alignment.TopStart)
      StateComponent({
        viewState: this.viewState,
        // showSkeleton: true,
        retryCallback: () => {
          this.loadNet()
        }
      }) {
        ListComponent({
          controller: this.controller,
          spaceValue: 10,
          onRefresh: () => {
            HomeViewModel.revertDate()
            this.loadNet()
          },
          onLoad: () => {
            this.loadNet()
          }
        }) {
          ForEach(this.dataList, (item: HomeModelIssueListItemList, index: number) => {
            HomeListItemComponent({ item: item }).onClick(() => {
              Router.push(RoutePath.DetailPage, { "id": item?.data?.id, "url": item?.data?.playUrl })
            })
          })
        }
      }
    }
  }
}