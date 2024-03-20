import webview from '@ohos.web.webview'
import { Router } from '../../../route/Router'

@Entry
@Component
struct DetailsWeb {
  webController: WebviewController = new webview.WebviewController()
  @State url: string = Router.getUrl()

  build() {
    Column() {
      Web({ src: this.url, controller: this.webController })
    }.padding({ top: 40 })
  }
}