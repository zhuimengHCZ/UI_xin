import common from '@ohos.app.ability.common';
import { AppString, USER_INFO_KEY } from '../../common/AppString';
import { UserModel } from '../../model/UserModel';
import { Router } from '../../route/Router';
import { AppBar } from '../../views/AppBar';
import BottomDialog from '../../views/BottomDialog';
import { CommonDialog } from '../../views/CommonDialog';
import MediaUtils from '../../utils/MediaUtils';


@Entry
@Component
struct MovieUserPage {
  @StorageLink(USER_INFO_KEY) userData: UserModel = null;
  private value?: string; //中间值
  dialogController: CustomDialogController = null

  aboutToDisappear() {
    this.dialogController = null;
  }

  @Styles
  blockStyle(){
    .backgroundColor(Color.White)
    .borderRadius(15)
    .padding(15)
    .width('100%')
    .margin({ top: 15 })
  }

  @Styles
  arrowStyle(){
    .margin({ left: 10 })
    .height(24)
    .width(12).opacity(0.2)
  }

  @Styles
  rowStyle(){
    .border({
      width: {
        bottom: 1,
      },
      color: {
        bottom: '#efefef'
      },
      style: {
        bottom: BorderStyle.Solid
      }
    })
    .width('100%')
    .padding({ top: 15, bottom: 15 })
  }

  showDialog(title: string, field?: string) {
    if (field === 'sex') {
      this.dialogController = new CustomDialogController({
        customStyle: true,
        builder: BottomDialog({
          confirm: (value) => this.onConfirm(field, value),
          options: AppString.sexType,
        }),
        alignment: DialogAlignment.Bottom,
      })
    } else if (title === 'photo') {
      this.dialogController = new CustomDialogController({
        customStyle: true,
        builder: BottomDialog({
          confirm: (value) => {
            if (value == '相册') {
              MediaUtils.selectPicture(1, (url) => {
                this.userData.avatar = url[0];
              })
            } else {
              MediaUtils.takePhoto(getContext() as common.UIAbilityContext, (url) => {
                this.userData.avatar = url;
              })
            }
          },
          options: AppString.phoneType
        }),
        alignment: DialogAlignment.Bottom,
      })
    } else if (title === 'logout') {
      this.dialogController = new CustomDialogController({
        customStyle: false,
        builder: CommonDialog({
          description: '是否退出登录？',
          confirm: () => Router.clear()
        })
      })
    } else {
      this.dialogController = new CustomDialogController({
        customStyle: false,
        builder: CommonDialog({
          title: '请输入',
          confirm: () => this.onConfirm(field),
          contentBuilder: () => this.contentBuilder(title, field)
        })
      })
    }
    this.dialogController.open()
  }

  @Builder
  contentBuilder(title: string, field: string) {
    Flex({ alignItems: ItemAlign.Center }) {
      Text(title)
        .flexShrink(0)
        .margin({ right: 10 })
      TextInput({ placeholder: '请输入', text: this.userData[field] })
        .flexGrow(1)
        .backgroundColor('#efefef')
        .height(20 * 2)
        .onChange((value: string) => {
          this.value = value
        })
    }.margin(15)
  }

  ///修改用户信息
  onConfirm(field: string, value?: string) {
    this.userData[field] = value ?? this.value
  }

  build() {
    Column() {
      AppBar({ title: '个人信息' })
      if (this.userData)
      Column() {
        Row() {
          Text('头像').flexGrow(1)
          Image(this.userData.avatar ?? $r("app.media.default_avatar2"))
            .height(80)
            .width(80)
            .alt($r("app.media.default_avatar"))
            .borderRadius(80)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('photo')
        })

        Row() {
          Text('昵称').flexGrow(1)
          Text(this.userData ? this.userData.userName : '')
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('昵称', 'userName')
        })

        Row() {
          Text('性别').flexGrow(1)
          Text(this.userData.sex)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('性别', 'sex')
        })

        Row() {
          Text('电话').flexGrow(1)
          Text(this.userData.phone)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('电话', 'phone')
        })

        Row() {
          Text('邮箱').flexGrow(1)
          Text(this.userData.email)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('邮箱', 'email')
        })

        Row() {
          Text('生日').flexGrow(1)
          Text(this.userData.birthday)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          DatePickerDialog.show({
            start: new Date("1900-1-1"),
            end: new Date("2100-12-31"),
            selected: new Date(this.userData.birthday),
            onChange: (value: DatePickerResult) => {
              console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
            },onAccept: (value: DatePickerResult) => {
              // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日
              this.userData.birthday= `${value.year}-${value.month}-${value.day}`;
              console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
            },
          })
        })

        Row() {
          Text('个性签名').flexGrow(1)
          Text(this.userData.sign)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('个性签名', 'sign')
        })

        Row() {
          Text('区域').flexGrow(1)
          Text(this.userData.region)
          Image($r('app.media.ic_right')).arrowStyle()
        }.rowStyle().border({ width: 0 }).justifyContent(FlexAlign.Center).onClick(() => {
          this.showDialog('区域', 'region')
        })

      }.blockStyle().padding({ top: 0, left: 15, right: 15 })

      Text('退出登录')
        .width('100%')
        .padding(15)
        .textAlign(TextAlign.Center)
        .backgroundColor('#f7453b')
        .margin({ top: 15 })
        .fontColor(Color.White)
        .borderRadius(15 * 2)
        .onClick(() => {
          this.showDialog('logout');
        })
    }
    .width('100%')
    .padding({ left: 15, right: 15, bottom: 15 })
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .backgroundColor('#efefef')
  }

  /**
   * 拍照
   */
  takePhoto(context: common.UIAbilityContext, callback: (uri: string) => void) {

    let want = {
      'uri': '',
      'action': "ohos.want.action.imageCapture",
      'parameters': {
        // "callBundleName": context.abilityInfo.bundleName,
      },
    };
    return context.startAbilityForResult(want)
      .then((result) => {
        if (result.resultCode === 0) {
          //拍照成功
          // let resultUri: string = result.want?.parameters?.resourceUri as string;
          if (callback && result.want.uri) {
            callback(result.want.uri);
          }
          return result.want.uri;
        }
      }).catch((error) => {
        return error;
      });
  }
}