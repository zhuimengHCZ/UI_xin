import dataPreferences from '@ohos.data.preferences';
import { AppString } from '../common/AppString';

const defaultPreferenceName = "XIN_KEY_PREFERENCES"
type ValueType = number | string | boolean | Array<number> | Array<string> | Array<boolean>;

///项目全局存储，使用ohos.data.preferences
export class StorageUtils {
  static token:string='';
  private constructor() {
  }

  static readonly context = getContext();

  //获取Prefer实例
  static async getPreferences(preferenceName: string = defaultPreferenceName) {
    return await dataPreferences.getPreferences(this.context, preferenceName)
  }
  static getToken() {
    return AppStorage.Get<string>(AppString.TOKEN_KEY)
  }
  //保存
  static async put(key: string, value: ValueType, preferenceName: string = defaultPreferenceName) {
    // 获取实例
    let preferences = await this.getPreferences(preferenceName)
    await preferences.put(key, value)
    //Tips Point ---此处一定要flush，要不然不能永久序列化到本地
    if(key==AppString.TOKEN_KEY){
      AppStorage.SetOrCreate(key, value)
    }
    await preferences.flush()
  }
  //获取
  static async get(key: string, defaultValue: ValueType = "", preferenceName: string = defaultPreferenceName) {
    // 获取实例
    let preferences = await this.getPreferences(preferenceName)
    return preferences.get(key, defaultValue)
  }

  //删除
  static async delete(key: string, preferenceName: string = defaultPreferenceName) {
    let preferences = await this.getPreferences(preferenceName)
    return await preferences.delete(key)
  }

  //清空
  static async clear(preferenceName: string = defaultPreferenceName) {
    let preferences = await this.getPreferences(preferenceName)
    return await preferences.clear()
  }

  static async flush(preferenceName: string = defaultPreferenceName) {
    let preferences = await this.getPreferences(preferenceName)
    return await preferences.flush()
  }
}