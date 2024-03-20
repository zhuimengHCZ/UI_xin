// xxx.ets
import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct LoadingProgressPage {
  build() {
    Column({ space: 5 }) {
      AppBar({ title: Router.getTitle() })
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      LoadingProgress()
        .color(Color.Blue)
        .layoutWeight(1)
    }.width('100%')
  }
}
