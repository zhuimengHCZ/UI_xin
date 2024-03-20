// xxx.ets
import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct ActionSheetPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Button('Click to Show ActionSheet')
          .onClick(() => {
            ActionSheet.show({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              confirm: {
                value: 'Confirm button',
                action: () => {
                  console.log('Get Alert Dialog handled')
                }
              },
              cancel: () => {
                console.log('actionSheet canceled')
              },
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -10 },
              sheets: [
                {
                  title: 'apples',
                  action: () => {
                    console.log('apples')
                  }
                },
                {
                  title: 'bananas',
                  action: () => {
                    console.log('bananas')
                  }
                },
                {
                  title: 'pears',
                  action: () => {
                    console.log('pears')
                  }
                }
              ]
            })
          })
      }.width('100%')
      .height('100%')
    }.width('100%')
  }
}