import http from '@ohos.net.http';
import { StorageUtils } from '../utils/StorageUtils';
import { Api } from './Api';
import { BaseResponse, HttpRequestConfig } from './Config';

///网络请求构造器-基于鸿蒙默认的http框架实现
class HttpHelper {
  constructor() {
    this.setupInterceptor()
  }

  //配置属性拦截器
  setupInterceptor() {
  }

  request<T = any>(path: string, data?: Object, method?: http.RequestMethod, showLoading?: boolean, contentType?: string): Promise<T> {
    let httpClient = http.createHttp()
    const options: HttpRequestConfig = {
      connectTimeout: Api.timeout,
      readTimeout: Api.timeout,
      header: { 'Content-Type': contentType ?? 'application/json', "Accept": "application/json" },
      method: method,
      showLoading: showLoading ?? true,
      extraData: data,
      // expectDataType: http.HttpDataType.OBJECT
    }
    // const token = StorageUtils.getToken()
    // if (token && options.header) {
    //   options.header['Authorization'] = `Bearer ${token}`
    // }
    return new Promise<T>((resolve, reject) => {
      httpClient.request(
        path,
        options,
        (error, data) => {
          if (!error) {
            let result = `${data.result}`;
            let resultJson: BaseResponse<T> = JSON.parse(result);
            // const resultJson = data.result as BaseResponse<T>
            resolve(resultJson.data);
          } else {
            reject(error)
          }
          // 当该请求使用完毕时，调用destroy方法主动销毁x
          httpClient.destroy()
        }
      )
    })
  }

  get<T = any>(config: HttpRequestConfig): Promise<T> {
    return this.request(config.url, config.extraData, http.RequestMethod.GET, config.showLoading)
  }

  post<T = any>(config: HttpRequestConfig): Promise<T> {
    return this.request(config.url, config.extraData, http.RequestMethod.POST, config.showLoading)
  }

  postForm<T = any>(config: HttpRequestConfig): Promise<T> {
    return this.request(config.url, config.extraData, http.RequestMethod.POST, config.showLoading, 'application/x-www-form-urlencoded')
  }
}

export const httpHelper = new HttpHelper()