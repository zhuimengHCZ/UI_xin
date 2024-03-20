import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { BaseDataSourceWrapper } from '../../../../model/BaseDataSourceWrapper'
import { CategoryModel, CategoryModelChild } from '../../../../model/CategoryModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'
import ImageRegexUtils from '../../../../utils/ImageRegexUtils'
import LogUtils from '../../../../utils/LogUtils'
import CategoryViewModel from '../../viewmodel/CategoryViewModel'
import { StateComponent } from '../../../../views/StateComponent'

@Component
export struct CategoryPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: CategoryModel = []
  @State dataSource: BaseDataSourceWrapper<CategoryModelChild> = new BaseDataSourceWrapper<CategoryModelChild>([])
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false

  aboutToAppear() {
    CategoryViewModel.observeState((state) => this.viewState = state)
    if (this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑--监听发现页面的tab
   */
  onFindTabSelectedIndex() {
    LogUtils.debug("Category-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.findCurrentIndex == 1) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    CategoryViewModel.getCategoryDataList((result) => {
      //数据缓存-当让也可以把数据缓存的逻辑放在DataSource里面，目前我做的是全部替换
      this.dataList = result
      this.dataSource = new BaseDataSourceWrapper<CategoryModelChild>(this.dataList)
    })
  }

  build() {
    StateComponent({ viewState: this.viewState, retryCallback: () => {
      this.loadNet()
    } }) {
      Grid() {
        LazyForEach(this.dataSource, (item: CategoryModelChild, index: number) => {
          GridItem() {
            Stack() {
              Image(ImageRegexUtils(item.bgPicture))
                .border({ radius: $r('app.float.size_5') })
                .alt($r("app.media.ic_alt_image"))
              Text(item.name)
                .fontColor(Color.White)
                .fontSize('20fp')
                .fontWeight(FontWeight.Bold)
            }.border({ radius: $r('app.float.size_5') })
          }.onClick(() => {
            Router.push(RoutePath.CategoryDetailPage, {
              "img": item.headerImage,
              "title": item.name,
              "id": item.id
            })
          })
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .height("100%")
      .padding({ left: 10, right: 10, top: 10, bottom: 50 })
    }
  }
}