// xxx.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct TextPickerPage {
  private select: number = 1
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4']

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      TextPicker({ range: this.fruits, selected: this.select })
        .onChange((value: string, index: number) => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index)
        })
    }
  }
}