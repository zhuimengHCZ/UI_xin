import router from '@ohos.router'
import { RoutePath } from '../route/RoutePath'

@Entry
@Component
struct SplashPage {
  aboutToAppear() {
    setTimeout(() => {
      router.replaceUrl({ url: RoutePath.HomePage })
    }, 2000)
  }

  build() {
    Stack() {
      Image($r('app.media.landing_image')).objectFit(ImageFit.Cover)
    }.width("100%").height("100%").backgroundColor(Color.White).alignContent(Alignment.Center)
  }
}