// xxx.ets
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'

@Entry
@Component
struct GridRowPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Column() {

        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ["400vp", "600vp", "800vp"],
            reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach(this.bgColors, (color) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
              Row().width("100%").height("20vp")
            }.borderColor(color).borderWidth(2)
          })
        }.width("100%").height("100%")
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
        })
      }.width('80%').margin({ left: 10, top: 5, bottom: 5 }).height(200)
      .border({ color: '#880606', width: 2 })
    }
  }
}