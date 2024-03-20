import { IState } from '../../../common/IStatus';
import { getWanNav, getWanTree } from '../../../http/NetManager';
import { INav, INavChildren, ITree, ITreeChildren } from '../../../model/ITreeBean';
import { RoutePath } from '../../../route/RoutePath';
import { Router } from '../../../route/Router';
import showToast from '../../../utils/ToastUtils';

@Component
export struct SquareList {
  private positionIndex: number = 0;
  @State mListNav: INav[] = new Array()
  @State status: IState = IState.Loading
  @State list: ITree[] = new Array()

  aboutToAppear() {
    if (this.positionIndex === 1) {
      this.getNav();
    } else {
      this.getTree();
    }
  }

  getNav() {
    getWanNav().then((data: INav[]) => {
      this.mListNav = [...data];
      this.status = IState.Success;
    })
  }

  getTree() {
    getWanTree().then((data: ITree[]) => {
      this.list = [...data];
      this.status = IState.Success
    })
  }

  @Builder
  LoadingLayout() {
    Text('加载中...').width('100%').height('100%').textAlign(TextAlign.Center)
  }

  @Builder
  showNav() {
    Scroll() {
      Column() {
        if (this.positionIndex === 1)
          ForEach(this.mListNav, (item: INav, index) => {
            Column() {
              Text(item.name)
                .width('100%')
                .textAlign(TextAlign.Start)
                .margin(10)
                .fontSize(20)
              Flex({
                wrap: FlexWrap.Wrap
              }) {
                ForEach(item.articles, (itemChild: INavChildren, item) => {
                  Button(itemChild.title)
                    .backgroundColor('#EEEEEE')
                    .borderRadius(30)
                    .fontColor(Color.Black)
                    .margin(5)
                    .padding({ left: 8, right: 8 })
                    .onClick(() => Router.push(RoutePath.DetailsWeb, { "url": itemChild.link }))
                }, (item: ITreeChildren, index?: number) => JSON.stringify(item) + index)
              }
            }.padding({ left: 10, right: 10 })
          }, (item: ITree, index?: number) => JSON.stringify(item) + index)
        else ForEach(this.list, (item: ITree, index) => {
          Column() {
            Text(item.name)
              .width('100%')
              .textAlign(TextAlign.Start)
              .margin(10)
              .fontSize(20)
            Flex({
              wrap: FlexWrap.Wrap
            }) {
              ForEach(item.children, (itemChild: ITreeChildren, item) => {
                Button(itemChild.name)
                  .backgroundColor('#EEEEEE')
                  .borderRadius(30)
                  .fontColor(Color.Black)
                  .margin(5)
                  .padding({ left: 8, right: 8 })
                  .onClick(() => {
                    showToast('点击了' + itemChild.name)
                  })
              }, (item: ITreeChildren, index?: number) => JSON.stringify(item) + index)
            }
          }.padding({ left: 10, right: 10 })
        }, (item: ITree, index?: number) => JSON.stringify(item) + index)
      }
      .width('100%')

    }
    .scrollable(ScrollDirection.Vertical)
    .edgeEffect(EdgeEffect.Spring)
  }

  build() {
    if (this.status === IState.Loading) {
      this.LoadingLayout()
    } else {
      this.showNav()
    }
  }
}