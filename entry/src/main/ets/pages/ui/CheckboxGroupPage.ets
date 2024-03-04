// xxx.ets
import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct CheckboxGroupPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Scroll() {
        Column() {
          // 全选按钮
          Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            CheckboxGroup({ group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .onChange((itemName: CheckboxGroupResult) => {
                console.info("checkbox group content" + JSON.stringify(itemName))
              })
            Text('Select All').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }

          // 选项1
          Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is' + value)
              })
            Text('Checkbox1').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.margin({ left: 36 })

          // 选项2
          Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .onChange((value: boolean) => {
                console.info('Checkbox2 change is' + value)
              })
            Text('Checkbox2').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.margin({ left: 36 })

          // 选项3
          Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
            Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
              .selectedColor('#007DFF')
              .onChange((value: boolean) => {
                console.info('Checkbox3 change is' + value)
              })
            Text('Checkbox3').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.margin({ left: 36 })
        }
      }
    }
  }
}
