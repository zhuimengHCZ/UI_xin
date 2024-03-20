// xxx.ets
import web_webview from '@ohos.web.webview'
import image from "@ohos.multimedia.image"
import { AppBar } from '../../views/AppBar';
import { Router } from '../../route/Router';

@Entry
@Component
struct WebPage {
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  @State icon: image.PixelMap = undefined;
  build() {
    Column() {
      AppBar({title:Router.getTitle()})
      Web({ src:'www.example.com', controller: this.controller })
        .onFaviconReceived((event) => {
          console.log('onFaviconReceived');
          this.icon = event.favicon;
        })
    }
  }
}