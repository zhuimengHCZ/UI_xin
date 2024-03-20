// xxx.ets
@Entry
@Component
struct XComponentPage {
  private surfaceId : string =''
  xcomponentController: XComponentController = new XComponentController()
  build() {
    Row() {
      XComponent({
        id: 'xcomponent',
        type: 'surface',
        controller: this.xcomponentController
      })
        .onLoad(() => {
          this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
        })
        .width('640px')
        .height('480px')
    }
    .backgroundColor(Color.Black)
    .position({x: 0, y: 48})
  }
}