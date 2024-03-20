import { SquareList } from './SquareList';

@Component
export struct Square {
  tabSquareArray: string[] = ['体系', '导航']
  @State currentIndex: number = 0

  @Builder
  TabBuilder(index: number) {
    Column() {
      Text(this.tabSquareArray[index])
        .height('100%')
        .fontSize(this.currentIndex === index ? 18 : 16)
        .fontColor(this.currentIndex === index ? Color.Blue : Color.Black)
    }
    .width('100%')
  }

  build() {
    Tabs() {
      ForEach(this.tabSquareArray, (_: string, index: number) => {
        TabContent() {
          SquareList({ positionIndex: index })
        }
        .backgroundColor(Color.White)
        .tabBar(this.TabBuilder(index))
      });
    }
    .barHeight('7.2%')
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .padding({ top: 40 })
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}