import router from '@ohos.router';
import LogUtils from '../utils/LogUtils';

export class Router {
  static push(url: string, params?: Object) {
    router.pushUrl({ url: url, params: params }, router.RouterMode.Standard, (err) => {
      if (err) {
        LogUtils.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      LogUtils.info('pushUrl success' + url);
    })
  }
  static replace(url: string, params?: Object) {
    router.replaceUrl({ url: url, params: params }, router.RouterMode.Standard, (err) => {
      if (err) {
        LogUtils.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      LogUtils.info('pushUrl success' + url);
    })
  }


  static back() {
    router.back();
  }
  static clear() {
    router.clear();
  }
  private static getParams() {
    return router.getParams();
  }

  static getId() {
    return Router.getParams()["id"];
  }

  static getTitle() {
    return Router.getParams()["title"];
  }

  static getImg() {
    return Router.getParams()["img"];
  }

  static getUrl() {
    return Router.getParams()["url"];
  }

  static getType() {
    return Router.getParams()["type"];
  }
}