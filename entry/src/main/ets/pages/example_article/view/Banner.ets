import { IState } from '../../../common/IStatus';
import { getWanBanner } from '../../../http/NetManager';
import { BannerBean, HomeBean } from '../../../model/HomeBean';
import SwiperComponent from '../../../views/SwiperComponent';


@Component
export struct Banner {
  @State list: HomeBean = new HomeBean()
  private listBanner: Array<string> = []

  requestBanner() {
    getWanBanner().then((data: BannerBean[]) => {
      this.list.status = IState.Success
      this.listBanner = []
      data.forEach((item) => {
        this.listBanner = [...this.listBanner, item.imagePath]
      })
    }).catch((err: ResourceStr) => {
      this.list.status = IState.Fail
    })
  }

  aboutToAppear() {
    this.requestBanner()
  }

  @Builder
  LoadingLayout(name: ResourceStr) {
    Text(name).width('100%').height('27%').textAlign(TextAlign.Center)
  }

  @Builder
  ShowData() {
    SwiperComponent({ swiperHeight: '27%', swiperBorderRadius: 6, list: this.listBanner })
  }

  build() {
    if (this.list.status === IState.Loading) {
      this.LoadingLayout('加载中...')
    } else if (this.list.status === IState.Fail) {
      this.LoadingLayout('加载失败，请重试')
    } else {
      this.ShowData()
    }
  }
}