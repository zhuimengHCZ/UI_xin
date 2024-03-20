import axios, { AxiosError, AxiosInstance, AxiosRequestHeaders } from '@ohos/axios';
import LogUtils from '../utils/LogUtils';
import { StorageUtils } from '../utils/StorageUtils';
import { JsonUtils } from '../utils/JsonUtils';
import { errorHandler, RequestConfig } from './Config';
import { hideLoadingDialog, showLoadingDialog } from '../utils/DialogUtils';
import showToast from '../utils/ToastUtils';
import { Router } from '../route/Router';
import { RoutePath } from '../route/RoutePath';
import { AppString } from '../common/AppString';

///网络请求构造-基于axios框架实现
class AxiosHelper {
  config: RequestConfig = {
    timeout: 10 * 1000,
    headers: { 'Content-Type': 'application/json' } as AxiosRequestHeaders,
  };
  instance: AxiosInstance;

  constructor() {
    // this.config.baseURL = "";
    this.instance = axios.create(this.config);
    this.setupInterceptor()
  }

  setupInterceptor(): void {
    this.instance.interceptors.request.use(
      async (request) => {
        // 在发送请求之前做一些处理，例如打印请求信息
        LogUtils.debug('网络请求Request 请求方法:', `${request.method}`);
        LogUtils.debug('网络请求Request 请求链接:', `${request.url}`);
        LogUtils.debug('网络请求Request Params:', `\n${JsonUtils.stringify(request.params)}`);
        LogUtils.debug('网络请求Request Data:', `${JsonUtils.stringify(request.data)}`);
        if (this.config.showLoading) {
          showLoadingDialog("加载中...")
        }
        if (this.config.checkLoginState) {
          let hasLogin = await StorageUtils.get(AppString.USER_LOGIN, false)
          LogUtils.debug('网络请求Request 登录状态校验>>>', `${hasLogin.toString()}`);
          if (hasLogin) {
            return request
          } else {
            if (this.config.needJumpToLogin) {
              Router.push(RoutePath.Login)
            }
            throw new AxiosError("请登录")
          }
        }
        return request;
      },
      (err) => {
        LogUtils.error("网络请求异常", err.toString())
        if (this.config.showLoading) {
          hideLoadingDialog()
        }
        return err;
      }
    );
    this.instance.interceptors.response.use(
      (response) => {
        //优先执行自己的请求响应拦截器，在执行通用请求request的
        if (this.config.showLoading) {
          hideLoadingDialog()
        }
        LogUtils.debug('网络请求响应Response:', `\n${JsonUtils.stringify(response.data)}`);
        if (response.status === 200) {

          const checkResultCode = this.config.checkResultCode
          if (checkResultCode && response.data.errorCode != 0) {
            showToast(response.data.errorMsg)
            return Promise.reject(response)
          }
          return Promise.resolve(response.data);
        } else {
          return Promise.reject(response);
        }
      },
      (error) => {
        if (this.config.showLoading) {
          hideLoadingDialog()
        }
        LogUtils.error("网络请求响应异常", error.toString())
        errorHandler(error);
        return Promise.reject(error);
      }
    );
  }

  // 类型参数的作用，T决定AxiosResponse实例中data的类型
  request<T = any>(config: RequestConfig): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      this.instance
        .request<any, T>(config)
        .then(res => {
          resolve(res);
        })
        .catch((err) => {
          LogUtils.error("网络请求Request异常：", err.message)
          errorHandler(err)
          if (err) {
            reject(err);
          }
        });
    });
  }

  get<T = any>(config: RequestConfig): Promise<T> {
    return this.request({ ...config, method: 'GET' });
  }

  post<T = any>(config: RequestConfig): Promise<T> {
    return this.request({ ...config, method: 'POST' });
  }

  delete<T = any>(config: RequestConfig): Promise<T> {
    return this.request({ ...config, method: 'DELETE' });
  }

  patch<T = any>(config: RequestConfig): Promise<T> {
    return this.request({ ...config, method: 'PATCH' });
  }
}

export const axiosHelper = new AxiosHelper()





