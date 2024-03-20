import { RoutePath } from '../route/RoutePath'
import { Router } from '../route/Router'

@Entry
@Component
struct SplashPage {
  aboutToAppear() {
    setTimeout(() => {
      Router.replace(RoutePath.IndexPage)
    }, 2000)
  }

  build() {
    Stack() {
      Image($r('app.media.landing_image')).objectFit(ImageFit.Cover)
    }.width("100%").height("100%").backgroundColor(Color.White).alignContent(Alignment.Center)
  }
}