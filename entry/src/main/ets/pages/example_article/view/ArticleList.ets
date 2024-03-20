import { IState } from '../../../common/IStatus';
import LoadMoreLayout from '../../../common/refresh/LoadMoreLayout';
import NoMoreLayout from '../../../common/refresh/NoMoreLayout';
import { listTouchEvent } from '../../../common/refresh/PullRefresh';
import { RefreshConst } from '../../../common/refresh/RefreshConst';
import RefreshLayout from '../../../common/refresh/RefreshLayout';
import RefreshModel, { RefreshLoadLayoutClass } from '../../../common/refresh/RefreshModel';
import { getWanArticle } from '../../../http/NetManager';
import { Article, IArticle } from '../../../model/HomeBean';
import { RoutePath } from '../../../route/RoutePath';
import { Router } from '../../../route/Router';


@Component
export struct ArticleList {
  @State page: number = 0;
  @State list: Article = new Article()
  @State refreshModel: RefreshModel = new RefreshModel();

  aboutToAppear() {
    this.reqArticle()
  }

  //请求文章列表数据
  reqArticle() {
    getWanArticle(this.page).then((res: Article) => {
      if (this.list && this.list.datas && this.list.datas.length > 0) {
        this.list.datas = this.list.datas.concat(res.datas)
        return
      }
      this.list.datas = res.datas
    })
  }

  @Builder
  showData() {
    List() {
      //下拉刷新组件
      ListItem() {
        RefreshLayout({
          rlc: new RefreshLoadLayoutClass(this.refreshModel.isVisiblePullDown
            , this.refreshModel.pullDownRefreshImage, this.refreshModel.pullDownRefreshText
            , this.refreshModel.pullDownRefreshHeight)
        })
      }
      ForEach(this.list.datas, (item: IArticle) => {
        ListItem() {
          Flex({ direction: FlexDirection.Column }) {
            //作者+新/置顶/时间
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                //作者
                Text(item.author ? "作者：" + item.author : "分享者：" + item.shareUser).fontSize(11)
                //置顶数据
                if (item.type === 1) {
                  Text('置顶')
                    .fontColor(Color.Red)
                    .borderRadius(12)
                    .fontSize(10)
                    .borderWidth(1)
                    .borderColor(Color.Red)
                    .margin({ left: 10 })
                    .padding({ left: 5, right: 5, top: 3, bottom: 3 })
                }
                if (item.fresh) {
                  //是否最新数据
                  Text('新')
                    .fontColor(Color.Red)
                    .fontSize(11)
                    .borderRadius(5)
                    .borderWidth(1)
                    .borderColor(Color.Red)
                    .margin({ left: 10 })
                    .textAlign(TextAlign.Center)
                    .padding({ left: 5, right: 5, top: 3, bottom: 3 })
                } else {
                  if (item.tags.length > 0) {
                    Text(item.tags[0].name)
                      .fontColor(Color.Green)
                      .fontSize(10)
                      .borderRadius(12)
                      .borderWidth(1)
                      .textAlign(TextAlign.Center)
                      .borderColor(Color.Green)
                      .padding({ left: 5, right: 5, top: 3, bottom: 3 })
                      .margin({ left: 10 })
                  }
                }
              }

              //发布时间
              Text(item.niceDate).fontSize(11).width('40%').textAlign(TextAlign.End)
            }

            //title
            Text(item.title).fontSize(18).fontColor(Color.Black).margin({ top: 10 }).fontWeight(700)
            //分类
            Text("分类：" + item.superChapterName + " / " + item.chapterName)
              .margin({ top: 10, bottom: 5 })
              .fontSize(11)
          }
        }
        .onClick(() => {
          Router.push(RoutePath.DetailsWeb, { "url": item.link })
        })
        .backgroundColor(Color.White)
        .margin({ top: 10 })
        .borderRadius(12)
      }, (item: IArticle, index?: number) => JSON.stringify(item) + index) //赋值一个key标识
      //加载更多
      ListItem() {
        if (this.refreshModel.hasMore) {
          LoadMoreLayout({ rlc: new RefreshLoadLayoutClass(this.refreshModel.isVisiblePullUpLoad
            , this.refreshModel.pullUpLoadImage, this.refreshModel.pullUpLoadText
            , this.refreshModel.pullUpLoadHeight) })
        } else {
          NoMoreLayout()
        }
      }
    }
    .width('93.3%')
    .height('90%')
    .margin({ left: '3.3%',
      right: '3.3%' })
    .padding({ bottom: '50' })
    .backgroundColor(Color.White)
    .divider({
      color: '#E2E2E2',
      strokeWidth: 0.5,
      endMargin: '3.3%'
    })
    .offset({ x: 0, y: `${this.refreshModel.offsetY}${RefreshConst.LIST_OFFSET_UNIT}` })
    .onScrollIndex((start: number, end: number) => {
      // 监控滑动的index和当前List值是否到底
      this.refreshModel.startIndex = start;
      this.refreshModel.endIndex = end;
    })
    .onTouch((event: TouchEvent | undefined) => {
      if (event) {
        listTouchEvent(event, this.list, this.refreshModel);
      }
    })
    .edgeEffect(EdgeEffect.None)
  }

  build() {
    this.showData()
  }
}