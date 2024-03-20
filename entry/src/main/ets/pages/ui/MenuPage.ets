import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct MenuPage {
  @State selectIndex: number = 0
  private iconList: ResourceStr[] = [$r("app.media.icon"), $r("app.media.app_icon")]
  private selectType = [{ value: "1" }, { value: "2" }, { value: "3" },]
  @State currentIndex: number = 0
  @State currentName: string = this.selectType[0].value

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  SecBuilder() {
    Row() {
      Text("搜索")
        .margin({ left: 15 })
        .fontSize(17)
        .padding({ right: 50 })
      Select(this.selectType)
        .selected(this.currentIndex)
        .value(this.currentName)
        .onSelect((index: number, value: string) => {
          this.currentIndex = index
          this.currentName = value
        })
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItemGroup() {
        MenuItem(this.SecBuilder())
      }

      MenuItem({ startIcon: this.iconList[1], content: "菜单选项" })
      MenuItem({ startIcon: this.iconList[1], content: "菜单选项" })
        .enabled(false)
      MenuItem({
        startIcon: this.iconList[0],
        content: "菜单选项",
        endIcon: this.iconList[1],
        builder: this.SubMenu.bind(this)
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({ content: "菜单选项" })
          .selectIcon(true)
          .selected(this.selectIndex == 0)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
            this.selectIndex = 1;
          })
        MenuItem({
          startIcon: this.iconList[0],
          content: "菜单选项",
          endIcon: this.iconList[1],
          builder: this.SubMenu.bind(this)
        })
      }

      MenuItem({
        startIcon: this.iconList[this.selectIndex],
        content: "菜单选项",
        endIcon: this.iconList[this.selectIndex]
      })
    }
  }

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Row() {
        Column() {
          Text('click to show menu')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        .bindMenu(this.MyMenu)
        .width('100%')
      }
      .height('100%')
    }
  }
}
