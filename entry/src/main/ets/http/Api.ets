/**
 * api接口url
 */
export class Api {
  static readonly baseUrlOpen = "https://api.apiopen.top/"
  static readonly baseUrlHarmonyTeach = "https://api-harmony-teach.itheima.net/hm/"
  static readonly baseUrlKaiYanApp = "https://baobab.kaiyanapp.com/"
  static readonly baseUrlWanAndroid = "https://www.wanandroid.com/"
  static readonly apiV2 = Api.baseUrlKaiYanApp + "api/v2/"
  static readonly apiV3 = Api.baseUrlKaiYanApp + "api/v3/"
  static readonly apiV4 = Api.baseUrlKaiYanApp + "api/v4/"
  static readonly feed = Api.apiV2 + "feed"
  static readonly follow = Api.apiV4 + "tabs/follow"
  static readonly categories = Api.apiV4 + "categories"
  static readonly specialTopics = Api.apiV3 + "specialTopics"
  static readonly videos = Api.apiV4 + "rankList/videos"
  static readonly internal = Api.apiV3 + "lightTopics/internal/"
  static readonly related = Api.apiV4 + "video/related"
  static readonly videoList = Api.apiV4 + "categories/videoList"
  ///////////////
  static readonly banner = Api.baseUrlWanAndroid + '/banner/json'//广告页
  static readonly article = Api.baseUrlWanAndroid + '/article/list/'//文章
  static readonly tree = Api.baseUrlWanAndroid + '/tree/json'//体系
  static readonly nav = Api.baseUrlWanAndroid + '/navi/json'//导航
  static readonly login = Api.baseUrlWanAndroid + "/user/login"//登录
  ///////////////
  /**
   * @param
   * type:items
   * */
  static readonly getQuestionType = Api.baseUrlHarmonyTeach + "https://api-harmony-teach.itheima.net/hm/question/type"
  /**
   * @param
   * questionBankType: 10
   * type: getQuestionType获取的id
   * page: this.page
   * sort: 排序：0 默认 20 浏览量↑ 21 浏览量↓
   * */
  static readonly getQuestionList = Api.baseUrlHarmonyTeach + "question/list"
  ///////////////
  static readonly getImages = Api.baseUrlOpen + "api/getImages"
  static readonly getHaoKanVideo = Api.baseUrlOpen + "api/getHaoKanVideo"
  static readonly getMiniVideo = Api.baseUrlOpen + "api/getMiniVideo"
  static readonly sentences = Api.baseUrlOpen + "api/sentences"
  static readonly PAGE_SIZE: number = 10;
  //网络请求超时
  static readonly timeout: number = 10000;
}