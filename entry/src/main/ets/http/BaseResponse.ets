/**
 * 响应类
 */
export interface BaseResponse<T> {
  errorCode: number
  errorMsg: string
  //拓展xxx-API响应体
  data: string | T | any;
}
