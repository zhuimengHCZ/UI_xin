// xxx.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct StackPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })

      Stack({ alignContent: Alignment.Bottom }) {
        Text('First child, show in bottom').width('90%').height('100%').backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('Second child, show in top').width('70%').height('60%').backgroundColor(0xc1cbac).align(Alignment.Top)
      }.width('100%').height(150)
    }
  }
}