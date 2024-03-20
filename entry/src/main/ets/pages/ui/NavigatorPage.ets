// Navigator.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct NavigatorPage {
  @State active: boolean = false
  @State Text: object = {name: 'news'}

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
        Navigator({ target: "pages/ui/BadgePage", type: NavigationType.Push }) {
          Text('Go to ' + this.Text['name'] + ' page')
            .width('100%').textAlign(TextAlign.Center)
        }.params({ text: this.Text }) // 传参数到Detail页面

        Navigator() {
          Text('Back to previous page').width('100%').textAlign(TextAlign.Center)
        }.type(NavigationType.Back)
      }.height(150).width(350).padding(35)
    }
  }
}
