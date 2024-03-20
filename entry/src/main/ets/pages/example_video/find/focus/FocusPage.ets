import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { FocusModelItemList } from '../../../../model/FocusModel'
import FocusViewModel from '../../viewmodel/FocusViewModel'
import { StateComponent } from '../../../../views/StateComponent'
import { FocusItemComponent } from './component/FocusItemComponent'
import { ListComponent, ListController } from '../../../../views/RefreshList'

@Component
export struct FocusPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: FocusModelItemList[] = []
  controller = new ListController()

  aboutToAppear() {
    FocusViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    FocusViewModel.getFocusData((result) => {
      this.controller.refreshed()
      this.controller.loaded()
      if (FocusViewModel.pageIndex == 0) {
        this.dataList = result
      } else {
        this.dataList = [...this.dataList, ...result]
      }
    })
  }

  build() {
    StateComponent({
      viewState: this.viewState,
      retryCallback: () => {
        FocusViewModel.pageIndex = 0
        this.loadNet()
      } }) {
      ListComponent({ controller: this.controller, spaceValue: 10, onRefresh: () => {
        this.loadNet()
      }, onLoad: () => {
        this.loadNet()
      } }) {
        ForEach(this.dataList, (item: FocusModelItemList, index: number) => {
          FocusItemComponent({ item: item })
        })
      }
    }
  }
}