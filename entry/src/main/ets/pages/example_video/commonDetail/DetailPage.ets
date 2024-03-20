import { Router } from '../../../route/Router'
import { AppBar } from '../../../views/AppBar'
import { VideoComponent } from '../../../views/VideoComponent'

import { VideoBottomComponent } from './component/VideoBottomComponent'

@Entry
@Component
struct DetailPage {
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl: string = ""
  @State relationId: number = -1
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    this.relationId = Router.getId()
    this.playUrl = Router.getUrl()
  }

  build() {
    Column() {
      AppBar({ title: '视频详情' })
      this.headerPlayer()
      VideoBottomComponent({
        relationId: this.relationId,
        onItemClick: (playUrl) => {
          this.playUrl = playUrl
        } }
      ).layoutWeight(1)
    }
    .width("100%")
    .height("100%")

  }

  @Builder
  headerPlayer() {
    VideoComponent({ showControls: $showControls, playUrl: $playUrl, isAutoPlay: this.isAutoPlay })
      .width('100%')
      .height('250vp')

  }
}