// xxx.ets
import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct GaugePage {
  build() {
    Column({ space: 20 }) {
      AppBar({ title: Router.getTitle() })
      // 使用默认的min和max为0-100，角度范围默认0-360，value值设置
      // 参数中设置当前值为75
      Gauge({ value: 75 })
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 参数设置当前值为75，属性设置值为25，属性设置优先级高
      Gauge({ value: 75 })
        .value(25) // 属性和参数都设置时以属性为准
        .width(200).height(200)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])

      // 210--150度环形图表
      Gauge({ value: 30, min: 0, max: 100 })
        .startAngle(210)
        .endAngle(150)
        .colors([[0x317AF7, 0.1], [0x5BA854, 0.2], [0xE08C3A, 0.3], [0x9C554B, 0.4]])
        .strokeWidth(20)
        .width(200)
        .height(200)
    }.width('100%')
  }
}
