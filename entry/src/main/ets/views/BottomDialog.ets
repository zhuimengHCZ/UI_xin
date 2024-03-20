///底部单选弹窗
@CustomDialog
export default struct BottomDialog {
  controller: CustomDialogController
  confirm: (value: string) => void
  options: Array<string>

  build() {
    Column() {
      Column() {
        ForEach(this.options, (item: string, index: number) => {
          Text(item)
            .textAlign(TextAlign.Center)
            .width('100%')
            .padding(15)
            .backgroundColor(Color.White)
            .borderRadius(15)
            .onClick(() => {
              this.confirm(item)
              this.controller.close()
            })
          if (index !== this.options.length - 1) {
            Divider()
              .height(1)
              .backgroundColor('#efefef')
          }
        })
      }.backgroundColor(Color.White)
      .borderRadius(15)
      .padding({ left: 15, right: 15 })

      Divider()
        .height(15)
        .backgroundColor(Color.Transparent)
      Text('取消')
        .textAlign(TextAlign.Center)
        .width('100%')
        .padding(15)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .onClick(() => {
          this.controller.close()
        })
      Divider()
        .height(15)
        .backgroundColor(Color.Transparent)
    }.width('100%').backgroundColor(Color.Transparent).padding({ left: 15, right: 15 })
  }
}