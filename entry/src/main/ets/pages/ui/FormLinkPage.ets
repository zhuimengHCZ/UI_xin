import { AppBar } from '../../views/AppBar'
import { Router } from '../../route/Router'

@Entry
@Component
struct FormLinkDemo {
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Text("这是一个静态卡片").fontSize(20).margin(10)

      // router事件用于静态卡片跳转到对应的UIAbility
      // FormLink({
      //   action: "router",
      //   abilityName: "EntryAbility",
      //   params: {
      //     'message': 'testForRouter' // 自定义要发送的message
      //   }
      // }) {
      //   Button("router event").width(120)
      // }.margin(10)
      //
      //
      // // message事件触发FormExtensionAbility的onFormEvent生命周期
      // FormLink({
      //   action: "message",
      //   abilityName: "EntryAbility",
      //   params: {
      //     'message': 'messageEvent' // 自定义要发送的message
      //   }
      // }) {
      //   Button("message event").width(120)
      // }.margin(10)
      //
      //
      // // call事件用于触发UIAbility中对应的方法
      // FormLink({
      //   action: "call",
      //   abilityName: "EntryAbility",
      //   params: {
      //     'method': 'funA', // 在EntryAbility中调用的方法名
      //     'num': 1 // 需要传递的其他参数
      //   }
      // }) {
      //   Button("call event").width(120)
      // }.margin(10)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%').height('100%')
  }
}
