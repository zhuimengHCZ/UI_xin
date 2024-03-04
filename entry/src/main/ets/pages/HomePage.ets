import { TabBarCategory } from '../model/CategoricalType';
import { HOME_TABS } from '../data/HomeData';
import { TabContentView } from './home/TabContentView';

@Entry
@Component
struct HomePage {
  @State tabsIndex: number = 0;
  @StorageLink('currentDevice') curBp: string = 'sm';

  build() {

    Tabs({ barPosition: this.curBp === 'sm' ? BarPosition.End : BarPosition.Start }) {
      ForEach(HOME_TABS, (item: TabBarCategory, index: number) => {

        TabContent() {
          TabContentView({ child: item.child,index:index })
        }
        .tabBar(this.CustomTabBar(item, index))
      }, item => JSON.stringify(item))
    }
    .vertical(this.curBp === 'sm' ? false : true)
    // 大型设备tabbar的高度为40%,宽度为56vp，小型设备的高度为56vp,宽度为100%
    .barHeight(this.curBp === 'sm' ? '56vp' : '40%')
    .barWidth(this.curBp === 'sm' ? '100%' : '56vp')
    .barMode(BarMode.Fixed)
    .backgroundColor($r('app.color.background_shallow_grey'))
    .onChange((index: number) => {
      this.tabsIndex = index;
    })
  }

  @Builder
  CustomTabBar(item: TabBarCategory, index: number) {
    Column() {
      Image(this.tabsIndex === index ? item.iconSelected : item.icon)
        .width($r('app.float.size_21'))
        .height($r('app.float.size_21'))
        .margin({ bottom: $r('app.float.size_4') })

      Text(item.title)
        .fontSize($r('app.float.size_text_10'))
        .fontFamily('HarmonyHeiTi-Medium')
        .fontColor(this.tabsIndex === index ? $r('app.color.tab_bar_select') : $r('app.color.tab_bar_unselect'))
    }
    .width('100%')
    .id(`tabBar${index}`)
    .padding({ top: 8, bottom: 10 })
    .alignItems(HorizontalAlign.Center)
  }
}

