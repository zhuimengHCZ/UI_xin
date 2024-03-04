import { AppBar } from '../../common/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct MenuPage {
  @State select: boolean = true
  private iconStr: ResourceStr = $r("app.media.icon")
  private iconStr2: ResourceStr = $r("app.media.icon")

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
        endIcon: $r("app.media.ic_right"),
        builder: (): void => this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({ content: "菜单选项" })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
            this.iconStr2 = $r("app.media.icon");
          })
        MenuItem({
          startIcon: $r("app.media.icon"),
          content: "菜单选项",
          endIcon: $r("app.media.ic_right"),
          builder: (): void => this.SubMenu()
        })
      }

      MenuItem({
        startIcon: this.iconStr2,
        content: "菜单选项",
        endIcon: $r("app.media.ic_right")
      })
    }
  }

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Row() {
        Column() {
          AppBar({ title: Router.getTitle() })
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
