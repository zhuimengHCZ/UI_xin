// xxx.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct TogglePage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })

      Column({ space: 10 }) {
        Text('type: Switch').fontSize(12).fontColor(0xcccccc).width('90%')
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })

          Toggle({ type: ToggleType.Switch, isOn: true })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
        }

        Text('type: Checkbox').fontSize(12).fontColor(0xcccccc).width('90%')
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Toggle({ type: ToggleType.Checkbox, isOn: false })
            .size({ width: 20, height: 20 })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })

          Toggle({ type: ToggleType.Checkbox, isOn: true })
            .size({ width: 20, height: 20 })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
        }

        Text('type: Button').fontSize(12).fontColor(0xcccccc).width('90%')
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Toggle({ type: ToggleType.Button, isOn: false }) {
            Text('status button').fontColor('#182431').fontSize(12)
          }.width(106)
          .selectedColor('rgba(0,125,255,0.20)')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })

          Toggle({ type: ToggleType.Button, isOn: true }) {
            Text('status button').fontColor('#182431').fontSize(12)
          }.width(106)
          .selectedColor('rgba(0,125,255,0.20)')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
        }
      }.width('100%').padding(24)
    }
  }
}