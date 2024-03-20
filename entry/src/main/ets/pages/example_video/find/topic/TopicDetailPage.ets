import { AppBar } from '../../../../views/AppBar'
import { ViewStateConstant } from '../../../../common/ViewStateConstant'
import { TopicDetailModel, TopicDetailModelItemList } from '../../../../model/TopicDetailModel'
import TopicDetailViewModel from '../../viewmodel/TopicDetailViewModel'
import { StateComponent } from '../../../../views/StateComponent'
import { VideoComponent } from '../../../../views/VideoComponent'
import { Router } from '../../../../route/Router'


@Entry
@Component
struct TopicDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State title: string = ""
  @State detailData: TopicDetailModel = {}
  @State playIndex: number = -1
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl: string = ""
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    TopicDetailViewModel.topicId = Router.getId()
    TopicDetailViewModel.observeState((state) => this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    TopicDetailViewModel.getTopicDetailList((result) => {
      this.detailData = result
      this.title = this.detailData.brief
    })
  }

  build() {
    Column() {
      AppBar({ title: this.title})
      Stack() {
        StateComponent({ viewState: this.viewState, retryCallback: () => {
          this.loadNet()
        } }) {
          List() {
            ListItem() {
              this.topicHeader()
            }

            ForEach(this.detailData.itemList, (item: TopicDetailModelItemList, index: number) => {
              ListItem() {
                this.itemContent(item, index)
              }
            })
          }
          .width("100%")
          .height("100%")
          .onScrollIndex((firstIndex: number, lastIndex: number) => {
            if (this.playIndex > lastIndex || this.playIndex < firstIndex) {
              this.playIndex = -1
            }
          })
        }
      }.layoutWeight(1)
    }
    .height("100%")
  }

  /**
   * 顶部头布局
   */
  @Builder
  topicHeader() {
    Column() {
      Image(this.detailData.headerImage)
        .width("100%")
        .height('280vp')
        .alt($r('app.media.ic_alt_image'))

      Text(this.detailData.brief)
        .width("80%")
        .height('46fp')
        .border({ radius: $r('app.float.size_5'), width: $r('app.float.size_1'), color: $r('app.color.six3') })
        .fontColor($r('app.color.six3'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .margin({ top: '-23vp' })
        .backgroundColor(Color.White)

      Text(this.detailData.text)
        .fontColor($r('app.color.six5'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))

    }
  }

  /**
   * item的布局
   */
  @Builder
  itemContent(item: TopicDetailModelItemList, index: number) {
    Column() {
      if (this.playIndex == index) {
        VideoComponent({
          showControls: $showControls,
          playUrl: $playUrl,
          isAutoPlay: this.isAutoPlay
        })
          .width('100%')
          .height('250vp')

      } else {
        Stack() {
          Image(item.data.content.data.cover.feed)
            .width("100%")
            .height('250vp')
            .alt($r('app.media.ic_alt_image'))

          Image($r('app.media.icon_play'))
            .width('45vp')
            .height('45vp')
            .alt($r('app.media.ic_alt_image'))
            .onClick(() => {
              this.playIndex = index
              this.playUrl = item.data.content.data.playUrl
            })
        }
      }

      Text(item.data.content.data.title)
        .width("80%")
        .fontColor($r('app.color.six3'))
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontSize($r('app.float.size_text_14'))
        .maxLines(1)
        .backgroundColor(Color.White)
        .margin({ top: $r('app.float.size_10') })

      Text(item.data.content.data.description)
        .fontColor($r('app.color.six5'))
        .fontSize($r('app.float.size_text_13'))
        .margin($r('app.float.size_10'))

    }
  }
}