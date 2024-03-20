import { AppString } from '../../common/AppString'
import { TabBarView } from '../view/TabBarView'
import { ContactsPage } from './view/ContactsPage'
import { DiscoveryPage } from './view/DiscoveryPage'
import { MyPage } from './view/MyPage'
import { ChatPage } from './view/ChatPage'

@Entry
@Component
struct ChatIndex {
  @Provide currentIndex: number = 0

  build() {
    Column() {
      Tabs({
        index: this.currentIndex,
        barPosition: BarPosition.End
      }) {
        ForEach(AppString.Example_Chat_TABS, (item:string,index: number) => {
          TabContent() {
            if (index === 1) {
              ContactsPage()
            } else if (index === 2) {
              DiscoveryPage()
            } else if (index === 3) {
              MyPage()
            } else {
              ChatPage()
            }
          }
          .tabBar(this.tabBuilder(index))
        }, item => JSON.stringify(item))
      }
      .barMode(BarMode.Fixed)
      .onChange((index) => {
        this.currentIndex = index
      })
    }
  }

  @Builder
  tabBuilder(index: number) {
    TabBarView({
      title: AppString.Example_Chat_TABS[index],
      icon: AppString.Example_Chat_ICON_TABS[index],
      iconSelected: AppString.Example_Chat_ICON_SEL_TABS[index],
      index: index,
      selectedIndex: this.currentIndex
    })
  }
}