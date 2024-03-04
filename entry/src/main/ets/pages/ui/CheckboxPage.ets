// xxx.ets
import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct CheckboxPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Row() {
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(0xed6f21)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value)
          })
        Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
          .select(false)
          .selectedColor(0x39a2db)
          .onChange((value: boolean) => {
            console.info('Checkbox2 change is' + value)
          })
      }
    }
  }
}
