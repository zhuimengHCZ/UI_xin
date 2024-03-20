import { ArticleList } from '../view/ArticleList';
import { Banner } from '../view/Banner';

@Component
export struct Home {
  build() {
    Scroll() {
      Column() {
        Banner()
        ArticleList()
      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical).scrollBar(BarState.Off)
  }
}