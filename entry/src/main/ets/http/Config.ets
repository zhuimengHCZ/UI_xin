import { AxiosError, AxiosRequestHeaders, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import showToast from '../utils/ToastUtils';
import http from '@ohos.net.http';

//Axios网络请求拦截器
export interface Interceptor {
  requestInterceptor?: (config: RequestConfig) => Promise<RequestConfig>;
  requestInterceptorCatch?: (error: any) => any;
  responseInterceptor?: (response: AxiosResponse) => AxiosResponse | Promise<AxiosResponse>;
  responseInterceptorCatch?: (error: any) => any;
}

//Axios网络请求配置
export interface RequestConfig extends InternalAxiosRequestConfig {
  showLoading?: boolean //是否展示请求loading
  checkResultCode?: boolean //是否检验响应结果码
  checkLoginState?: boolean //校验用户登陆状态
  needJumpToLogin?: boolean //是否需要跳转到登陆页面
  interceptor?: Interceptor //网络请求拦截器
  headers: AxiosRequestHeaders //网络请求header
}

//Http网络请求配置
export interface HttpRequestConfig extends http.HttpRequestOptions {
  showLoading?: boolean; //是否展示请求loading
  checkLoginState?: boolean //校验用户登陆状态
  needJumpToLogin?: boolean //是否需要跳转到登陆页面
  url?: string, //请求网络链接
}

//网络请求响应类
export interface BaseResponse<T> {
  errorCode: number
  errorMsg: string
  //拓展xxx-API响应体
  data: string | T | any;
}

//网络请求错误回调
export function errorHandler(error: any) {
  if (error instanceof AxiosError) {
    showToast(error.message)
  } else if (error != undefined && error.response != undefined && error.response.status) {
    switch (error.response.status) {
    // 401: 未登录
    // 未登录则跳转登录页面，并携带当前页面的路径
    // 在登录成功后返回当前页面，这一步需要在登录页操作。
      case 401:

        break;
    // 403 token过期
    // 登录过期对用户进行提示
    // 清除本地token和清空vuex中token对象
    // 跳转登录页面
      case 403:
        showToast("登录过期，请重新登录")
      // 清除token
      // localStorage.removeItem('token');
        break;
    // 404请求不存在
      case 404:
        showToast("网络请求不存在")
        break;

    // 其他错误，直接抛出错误提示
      default:
        showToast(error.response.data.message)
    }

  }
}



