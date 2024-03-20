import { AppString } from '../../common/AppString';
import { Home } from './view/HomeComponent';
import { Square } from './view/SquareComponent';

@Entry
@Component
struct ArticleIndex {
  @State bottomTabIndex: number = 0;

  @Builder
  TabBuild(index: number) {
    Column() {
      Image(this.bottomTabIndex === index ? AppString.Example_Article_ICON_SEL_TABS[index] : AppString.Example_Article_ICON_TABS[index])
        .width('40%')
        .height('40%')
        .objectFit(ImageFit.Contain)
    }
    .width('100%')
    .height('100%')
    .id(`tabBar-article${index}`)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFF')
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: this.bottomTabIndex }) {
        ForEach(AppString.Example_Article_TABS, (_, index) => {
          TabContent() {
            if (index === 0) {
              Home()
            } else if (index === 1) {
              Square()
            }
          }.tabBar(this.TabBuild(index))
        })
      }
      .width('100%')
      .height('100%')
      .vertical(false)
      .scrollable(false)
      .barHeight('50')
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
  }
}
