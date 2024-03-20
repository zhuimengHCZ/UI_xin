import { getContactInfo } from '../model/WeChatData'
import { AppBar } from '../../../views/AppBar'
import { ChatComponent } from './ChatComponents'
import { DividerView } from '../../view/DividerView'

@Entry
@Component
export struct ChatPage {
  private contactsInfo = getContactInfo()

  build() {
    Column() {
      AppBar({ title: '微信' })
      List() {
        ForEach(this.contactsInfo, (item) => {
          ListItem() {
            Column(){
              ChatComponent({
                title: item.nickName,
                portrait: item.portrait,
                subTitle: item.chatInfo,
                time: item.time
              })
              DividerView({ heightNum: 2, marginValue: { left: '195px', top: 3 } })
            }
          }
        }, item => item.userId.toString())
      }
      .width('100%')
      .height('100%')
      .padding({bottom:50})
    }
  }
}