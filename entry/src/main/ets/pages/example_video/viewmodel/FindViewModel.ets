import { getHomeListAxios } from '../../../http/NetManager';
import RequestStatus from '../../../http/RequestStatus';
import LogUtils from '../../../utils/LogUtils';
import { BaseViewModel } from './BaseViewModel';

export class FindViewModel extends BaseViewModel {
  /**
   * 获取首页接口数据
   * @param callback
   * @returns
   */
  async getDataList(callback?: (state: string) => void) {
    return await RequestStatus((state) => {
      callback?.(state)
    }).promise(getHomeListAxios("")).then((res) => {
      LogUtils.debug("error>>>>>" + res)
      LogUtils.debug("HomeTag", "error>>>>>" + res)
    }).catch((e) => {
      LogUtils.debug("error>>>>>" + e)
    })
  }
}

let findViewModel = new FindViewModel()

export default findViewModel as FindViewModel