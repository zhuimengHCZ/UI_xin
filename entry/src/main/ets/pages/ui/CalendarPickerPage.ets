// xxx.ets
import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct CalendarPickerPage {
  private selectedDate: Date = new Date()
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Text('月历日期选择器').fontSize(30)
      Column() {
        //10+
        // CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        //   .edgeAlign(CalendarAlign.END)
        //   .textStyle({ color: "#ff182431", font: { size: 20, weight: FontWeight.Normal } })
        //   .margin(10)
        //   .onChange((value) => {
        //     console.info("CalendarPicker onChange:" + JSON.stringify(value))
        //   })
      }.alignItems(HorizontalAlign.End).width("100%")
    }.width('100%')
  }
}
