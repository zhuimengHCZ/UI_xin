import picker from '@ohos.file.picker';
import storageStatistics from '@ohos.file.storageStatistics';
import bundleManager from '@ohos.bundle.bundleManager';
import { USER_INFO_KEY } from '../../common/AppString';
import { UserModel } from '../../model/UserModel';
import { RoutePath } from '../../route/RoutePath';
import { Router } from '../../route/Router';
import { StorageUtils } from '../../utils/StorageUtils';
import { CommonDialog } from '../../views/CommonDialog';
import fs from '@ohos.file.fs';
import showToast from '../../utils/ToastUtils';

///我的页面
@Component
export struct MinePage {
  @StorageLink(USER_INFO_KEY) userData: UserModel = null;
  @StorageLink("darkMode") darkMode: boolean = false
  @State version: string = ''
  @State cache: string = ''
  private dialogTitle: string = '关于'
  private dialogContent: string = '该项目是基于鸿蒙HarmonyOS Api9版本开发的Ui和示例APP（主要使用ArkTs+ArkUI开发），主要用来学习和了解HarmonyOS开发App的使用方式'
  dialogController: CustomDialogController = null

  aboutToAppear(): void {
    bundleManager.getBundleInfoForSelf(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
    ).then((res) => {
      this.version = 'v' + res.versionName
    })
    this.calcCache()
  }

  calcCache() {
    storageStatistics.getCurrentBundleStats().then(res => {
      this.cache = (res.cacheSize / (1024 * 1024)).toFixed(2) + 'MB'
    })
  }
  clearCache() {
    const dir = getContext().cacheDir
    const listDir = fs.listFileSync(dir)
    listDir.forEach(item => {
      const filePath = dir + '/' + item
      const stat = fs.statSync(filePath)
      if (stat.isDirectory()) {
        fs.rmdirSync(filePath)
      }
      if (stat.isFile()) {
        fs.unlinkSync(filePath)
      }
    })
    showToast('清理完毕')
    this.calcCache()
  }
  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Scroll() {
      Column() {

        Row() {
          Image(this.userData ? (this.userData.avatar ?? $r("app.media.default_avatar")) : $r("app.media.default_avatar"))
            .height('70vp')
            .width('70vp')
            .alt($r("app.media.default_avatar"))
            .border({ radius: '35vp' })
          Row() {
            Column() {
              Text(this.userData ? this.userData.userName : '请登录').fontSize($r('app.float.size_text_15'))
                .fontColor(Color.Blue)
              if (this.userData) {
                Text(this.userData ? this.userData.sex : '描述').fontSize($r('app.float.size_text_15'))
                  .fontColor(Color.Blue)
              }
            }.height('70vp').justifyContent(FlexAlign.SpaceBetween).padding({ top: 10, bottom: 10 })

            Image($r("app.media.ic_right"))
              .height(24)
              .width(12).opacity(0.2)
          }.flexGrow(1).padding({ left: 20, right: 20 }).justifyContent(FlexAlign.SpaceBetween).onClick(() => {
            Router.push(this.userData ? RoutePath.UserDetailPage : RoutePath.Login)
          })
        }
        .backgroundImage($r('app.media.mine_bg'))
        .backgroundImageSize({ width: '100%', height: '100%' })
        .padding({ left: 30, right: 30 })
        .justifyContent(FlexAlign.Center)
        .width("100%")
        .height('300vp')
        this.itemBuilder("清除缓存", () => {
          this.showDialog('清除缓存')
        })
        this.itemBuilder("夜间模式")
        this.itemBuilder("消息设置")
        this.itemBuilder("检查更新")
        this.itemBuilder("关于",() => {
          this.showDialog('关于')
        })
      }.height("100%").width("100%").backgroundColor(this.darkMode ? Color.Black : Color.White)
    }
  }

  @Builder
  itemBuilder(title: string,onItemClick?: () => void) {
    Row() {
      Text(title)
        .fontSize($r('app.float.size_text_15'))
        .fontColor(this.darkMode ? Color.White : $r('app.color.six3'))
        .margin({ left: 10})
      if (title == '夜间模式') {
        Toggle({ type: ToggleType.Switch, isOn: this.darkMode })
          .onChange((isOn: boolean) => {
            this.darkMode = isOn
          })
      }else if (title == '清除缓存') {
        Text(this.cache)
          .fontSize($r('app.float.size_text_14'))
          .fontColor(this.darkMode ? Color.White : $r('app.color.six3'))
          .margin({ right: 10 })
      }else if (title == '检查更新') {
        Text(this.version)
          .fontSize($r('app.float.size_text_14'))
          .fontColor(this.darkMode ? Color.White : $r('app.color.six3'))
          .margin({ right: 10 })
      }
    }
    .height('50vp')
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .padding({ left: $r('app.float.size_10') })
    .onClick(() => {
      onItemClick?.()
    })
  }

  showDialog(title: string) {

    if (title === '清除缓存') {
      this.dialogController = new CustomDialogController({
        builder: CommonDialog({ title: '清除缓存', description: '将清除APP所有缓存', confirm: () => {
          StorageUtils.clear();
          this.clearCache();
        } })
      })
    } else {
      this.dialogController = new CustomDialogController({
        builder: CommonDialog({ title: this.dialogTitle, description: this.dialogContent, showConfirm: false })
      })
    }
    this.dialogController.open()
  }
}