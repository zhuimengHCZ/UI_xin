// xxx.ets
import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct RadioPage {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Column() {
          Text('Radio1')
          Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)// .radioStyle({
            //   checkedBackgroundColor: Color.Pink
            // })
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              console.log('Radio1 status is ' + isChecked)
            })
        }

        Column() {
          Text('Radio2')
          Radio({ value: 'Radio2', group: 'radioGroup' }).checked(false)// .radioStyle({
            //   checkedBackgroundColor: Color.Pink
            // })
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              console.log('Radio2 status is ' + isChecked)
            })
        }

        Column() {
          Text('Radio3')
          Radio({ value: 'Radio3', group: 'radioGroup' }).checked(false)// .radioStyle({
            //   checkedBackgroundColor: Color.Pink
            // })
            .height(50)
            .width(50)
            .onChange((isChecked: boolean) => {
              console.log('Radio3 status is ' + isChecked)
            })
        }
      }.padding({ top: 30 })
    }
  }
}
