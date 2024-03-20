import { AppBar } from '../../../../views/AppBar'
import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../../model/HomeModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'
import ImageRegexUtils from '../../../../utils/ImageRegexUtils'
import { HomeListItemComponent } from '../../home/component/HomeListItemComponent'
import categoryDetailViewModel from '../../viewmodel/CategoryDetialViewModel'
import { StateComponent } from '../../../../views/StateComponent'
import { ListComponent, ListController } from '../../../../views/RefreshList'

@Entry
@Component
struct CategoryDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: HomeModelIssueListItemList[] = []
  @State headerImage: string = ""
  @State title: string = ""
  controller = new ListController()

  aboutToAppear() {
    categoryDetailViewModel.observeState((state) => this.viewState = state)
    categoryDetailViewModel.id = Router.getId()
    this.headerImage = Router.getImg()
    this.title = Router.getTitle()
    this.loadNet()
  }

  loadNet() {
    categoryDetailViewModel.getCategoryDetailList((result) => {
      this.controller.refreshed()
      this.controller.loaded()
      if (categoryDetailViewModel.pageIndex == 0) {
        this.dataList = result
      } else {
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        ListComponent({ controller: this.controller, onRefresh: () => {
          categoryDetailViewModel.pageIndex = 0
          this.loadNet()
        }, onLoad: () => {
          this.loadNet()
        } }) {
          this.listHeader()
          ForEach(this.dataList, (item: HomeModelIssueListItemList) => {
            HomeListItemComponent({ item: item })
              .padding({ left: $r('app.float.size_10'), right: $r('app.float.size_10'),top: $r('app.float.size_10')})
              .onClick(() => {
                Router.push(RoutePath.DetailPage, { "id": item.data.id, "url": item.data.playUrl })
              })
          })
        }
      }

      AppBar({ title: this.title, titleAlignment: TextAlign.Start })
    }
    .width("100%")
    .height("100%")
  }

  @Builder
  listHeader() {
    Image(ImageRegexUtils(this.headerImage))
      .width("100%")
      .height('300vp')
      .alt($r('app.media.ic_alt_image'))
  }
}