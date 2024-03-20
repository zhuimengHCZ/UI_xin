// xxx.ets
import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct DatePickerPage {
  @State isLunar: boolean = false
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Button('切换公历农历')
        .margin({ top: 30, bottom: 30 })
        .onClick(() => {
          this.isLunar = !this.isLunar
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        // .disappearTextStyle({color: Color.Gray, font: {size: '16fp', weight: FontWeight.Bold}})
        // .textStyle({color: '#ff182431', font: {size: '18fp', weight: FontWeight.Normal}})
        // .selectedTextStyle({color: '#ff0000FF', font: {size: '26fp', weight: FontWeight.Regular}})
        .lunar(this.isLunar)
        // .onDateChange((value: Date) => {
        //   this.selectedDate = value
        //   console.info('select current date is: ' + value.toString())
        // })

    }.width('100%')
  }
}
