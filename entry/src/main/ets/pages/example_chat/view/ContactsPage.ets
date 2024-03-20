import { AppBar } from '../../../views/AppBar'
import { DividerView } from '../../view/DividerView'
import { getContactInfo } from '../model/WeChatData'
import { ChatComponent } from './ChatComponents'


@Entry
@Component
export struct ContactsPage {
  private contactsInfo = getContactInfo()

  build() {
    Column() {
      AppBar({ title: '通讯录' })
      Scroll() {
        Column() {
          ChatComponent({ portrait: "new_friend.png", title: "新的朋友" })
          DividerView({ heightNum: 2, marginValue: { left: '195px', top: 3 } })
          ChatComponent({ portrait: "group.png", title: "群聊" })
          DividerView({ heightNum: 2, marginValue: { left: '195px', top: 3 } })
          ChatComponent({ portrait: "biaoqian.png", title: "标签" })
          DividerView({ heightNum: 2, marginValue: { left: '195px', top: 3 } })
          ChatComponent({ portrait: "gonzh.png", title: "公众号" })

          Text("      我的企业及企业联系人")
            .fontSize('12fp')
            .backgroundColor($r('app.color.divider'))
            .height('80px')
            .width('100%')
          ChatComponent({ portrait: "qiye.png", title: "企业微信联系人" })

          Text("      我的微信好友")
            .fontSize('12fp')
            .backgroundColor($r('app.color.divider'))
            .height('80px')
            .width('100%')

          List() {
            ForEach(this.contactsInfo, (item) => {
              ListItem() {
                Column(){
                  ChatComponent({ portrait: item.portrait, title: item.nickName })
                  DividerView({ heightNum: 2, marginValue: { left: '195px', top: 3 } })
                }
              }
            }, item => item.userId.toString())
          }
        }
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}