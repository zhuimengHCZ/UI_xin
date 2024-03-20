/**
 * TabBar组件
 */
import { AppString } from '../../../common/AppString';
import { TabContentView } from '../../home/TabContentView';
import { CategoryPage } from '../find/category/CategoryPage';
import { FindPage } from '../find/FindPage';
import { FocusPage } from '../find/focus/FocusPage';
import { TopicPage } from '../find/topic/TopicPage';
import { HomePage } from '../home/HomePage';
import { HotPage } from '../hot/HotPage';
import { RankPage } from '../hot/rank/RankPage';
import { MinePage } from '../../mine/MinePage';
import { TabBarView } from '../../view/TabBarView';

@Component
export struct TabView {
  @Link selectedIndex: number; // 被选定的tabBar下标(首页)
  private haveIndicator?: boolean; // 是否有指示器
  private list: ResourceStr[];
  private iconList?: Resource[];
  private iconSelectedList?: Resource[];
  private onChangeTab?: (index) => void
  @StorageLink('currentDevice') curBp: string = 'sm';

  build() {

    Tabs({
      index: this.selectedIndex,
      barPosition: this.curBp === 'sm' && !this.haveIndicator ? BarPosition.End : BarPosition.Start
    }) {

      ForEach(this.list, (item: string, index: number) => {
        TabContent() {
          if (this.list[index] == '首页') {
            HomePage()
          } else if (this.list[index] == '发现') {
            FindPage()
          } else if (this.list[index] == '热门') {
            HotPage()
          } else if (this.list[index] == '我的') {
            MinePage()
          } else if (this.list[index] == '关注') {
            FocusPage()
          } else if (this.list[index] == '分类') {
            CategoryPage()
          } else if (this.list[index] == '主题') {
            TopicPage()
          } else if (this.list[index] == AppString.Hot_TABS[index]) {
            RankPage({ positionIndex: index })
          } else {
            TabContentView({ index: index })
          }
        }
        .tabBar(this.TabBuilder(index)
          // {text: this.list[index],
          // icon: this.iconList ? (this.selectedIndex === index ? this.iconSelectedList[index] : this.iconList[index]) : null }
        )
      }, item => JSON.stringify(item))
    }
    .vertical(this.curBp === 'sm' ? false : true)
    .barHeight(this.curBp === 'sm' ? '56vp' : '40%')
    .barWidth(this.curBp === 'sm' ? '100%' : '56vp')
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .onChange((index: number) => {
      this.selectedIndex = index;
      this.onChangeTab?.(index)
    })
  }

  @Builder
  TabBuilder(index: number) {
    TabBarView({
      title: this.list[index],
      icon: this.iconList ? this.iconList[index] : null,
      iconSelected: this.iconList ? this.iconSelectedList[index] : null,
      index: index,
      selectedIndex: this.selectedIndex,
      haveIndicator: this.haveIndicator
    })
  }
}