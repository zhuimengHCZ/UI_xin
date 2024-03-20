import HashMap from '@ohos.util.HashMap'
import { getWanLogin } from '../../http/NetManager'
import showToast from '../../utils/ToastUtils'
import { UserModel } from '../../model/UserModel'
import { USER_INFO_KEY } from '../../common/AppString'
import { Router } from '../../route/Router'

@Entry
@Component
struct Login {
  @State acc: string = ""
  @State pwd: string = ""
  params: HashMap<string, Object> = new HashMap();

  login() {
    this.params.set('username', this.acc)
    this.params.set('password', this.pwd)
    getWanLogin(this.params).then((data: any) => {

      AppStorage.SetOrCreate<UserModel>(USER_INFO_KEY, {
        userId: this.acc,
        userName: this.acc,
        password: this.pwd,
        phone: '15235422422',
        email: this.acc,
        avatar: 'https://p3-pc-sign.douyinpic.com/tos-cn-i-0813c001/7113bd849947475e95ea07e0e019ad23~tplv-dy-aweme-images:q75.webp?biz_tag=aweme_images&from=3213915784&s=PackSourceEnum_AWEME_DETAIL&sc=image&se=false&x-expires=1713081600&x-signature=5h6jo06QbXrCEzMuqJUnSI8Su%2Bg%3D',
        birthday: '1998-04-05',
        sex: '女'
      })
      showToast('登录成功')
      Router.back();

    }).catch((err: ResourceStr) => {
      showToast(err.toString())
    })
  }

  build() {
    Navigation() {
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
      }) {
        Flex({
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Text('账号：').width('20%')
          TextInput({ placeholder: '请输入账号'
          }).type(InputType.Normal).onChange((value) => {
            this.acc = value;
          })
        }

        Flex({
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Text('密码：').width('20%')
          TextInput({
            placeholder: '请输入密码'
          }).type(InputType.Password)
            .onChange((value) => {
              this.pwd = value;
            })
        }.margin({ top: 20 })

        Button('登录').width('100%').margin({ top: 30 })
          .onClick(() => {
            //点击
            this.login()
          })
      }
      .padding(20)
      .width('100%')
      .height('100%')
    }
    .title('登录')
    .hideToolBar(true)
    .margin({ top: 40 })
    .titleMode(NavigationTitleMode.Mini)
  }
}