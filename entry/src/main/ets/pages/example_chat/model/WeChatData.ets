
import { UserInfo } from './WCUserInfo'

const ContactInfo: any[] = [
  {
    "portrait": "xh.png",
    "nickName": "刘一",
    "chatInfo": "来世，我定退了沙场",
    "time": "10:00"
  },
  {
    "portrait": "xh.png",
    "nickName": "陈二",
    "chatInfo": "我是项氏一足，没有我办不到的",
    "time": "10:10"
  },
  {
    "portrait": "xh.png",
    "nickName": "张三",
    "chatInfo": "毁灭，永远比建设要简单的多",
    "time": "10:20"
  },
  {
    "portrait": "xh.png",
    "nickName": "李四",
    "chatInfo": "弱者没有权利要求公平",
    "time": "10:30"
  },
  {
    "portrait": "xh.png",
    "nickName": "王五",
    "chatInfo": "或许是为了这样的生存，一点点地忘记了最初的本意",
    "time": "10:40"
  },
  {
    "portrait": "xh.png",
    "nickName": "赵六",
    "chatInfo": "有些翅膀却不知道往哪里飞翔，也许只有笨鸟才会这样吧",
    "time": "10:50"
  },
  {
    "portrait": "xh.png",
    "nickName": "孙七",
    "chatInfo": "我没有问你，还轮不到你说话",
    "time": "11:00"
  },
  {
    "portrait": "xh.png",
    "nickName": "周八",
    "chatInfo": "如此眼神，充满了迷茫和无邪，能否通过长路的漆黑慢慢",
    "time": "11:10"
  },
  {
    "portrait": "xh.png",
    "nickName": "吴九",
    "chatInfo": "我送你离开千里之外你无声黑白",
    "time": "11:20"
  },
  {
    "portrait": "xh.png",
    "nickName": "郑十",
    "chatInfo": "天灰灰会不会，让我忘了你是谁",
    "time": "11:30"
  },
  {
    "portrait": "xh.png",
    "nickName": "赵六2",
    "chatInfo": "有些翅膀却不知道往哪里飞翔，也许只有笨鸟才会这样吧",
    "time": "11:40"
  },
  {
    "portrait": "xh.png",
    "nickName": "孙七2",
    "chatInfo": "我没有问你，还轮不到你说话",
    "time": "11:50"
  },
  {
    "portrait": "xh.png",
    "nickName": "周八2",
    "chatInfo": "如此眼神，充满了迷茫和无邪，能否通过长路的漆黑慢慢",
    "time": "12:00"
  },
  {
    "portrait": "xh.png",
    "nickName": "吴九2",
    "chatInfo": "我送你离开千里之外你无声黑白",
    "time": "12:10"
  },
  {
    "portrait": "xh.png",
    "nickName": "郑十2",
    "chatInfo": "天灰灰会不会，让我忘了你是谁",
    "time": "12:20"
  }
]

export function getContactInfo(): Array<UserInfo> {
  let contactList: Array<UserInfo> = []
  ContactInfo.forEach(item => {
    contactList.push(new UserInfo(item.nickName, item.portrait, item.chatInfo, item.time))
  })
  return contactList
}