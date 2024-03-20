import { getRankList } from '../../../http/NetManager';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

export class RankViewModel extends BaseViewModel {
  async getRankList(rankType: string, resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getRankList(rankType), true)
      .then((result) => {
        resultCallback?.(result.itemList)
      })
  }
}

let rankViewModel = new RankViewModel()

export default rankViewModel as RankViewModel