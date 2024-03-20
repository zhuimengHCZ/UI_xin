import { AppString } from '../common/AppString'
import { Article, BannerBean } from '../model/HomeBean'
import { CategoryModel } from '../model/CategoryModel'
import { FocusModel } from '../model/FocusModel'
import { HomeModel } from '../model/HomeModel'
import { TopicDetailModel } from '../model/TopicDetailModel'
import { TopicModel } from '../model/TopicModel'
import { Api } from './Api'
import { AxiosRequestHeaders } from '@ohos/axios'
import { axiosHelper } from './AxiosHelper'
import { httpHelper } from './HttpHelper'
import { INav, ITree } from '../model/ITreeBean'
import HashMap from '@ohos.util.HashMap'

//请求首页数据-axios客户端请求
export function getHomeListAxios(date: string = "") {
  return axiosHelper.get<HomeModel>({
    url: Api.feed,
    params: { "date": date },
    showLoading: true,
    headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
  })
}

///获取关注接口
export function getFocusData(pageIndex: number = 0) {
  return axiosHelper.get<FocusModel>(
    {
      url: Api.follow,
      params: { "start": pageIndex },
      headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
    }
  )
}

///获取分类数据
export function getCategories() {
  return axiosHelper.get<CategoryModel>({
    url: Api.categories,
    showLoading: true,
    checkLoginState: true,
    needJumpToLogin: true,
    headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
  })
}

///获取专题接口
export function getTopicData(start: number = 0) {
  return axiosHelper.get<TopicModel>(
    {
      url: Api.specialTopics,
      params: { "start": start },
      headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
    }
  )
}


///获取排行榜 @param rankType "weekly" "monthly" "historical"
export function getRankList(rankType: string) {
  return axiosHelper.get<HomeModel>(
    {
      url: Api.videos,
      params: { "strategy": rankType },
      headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
    }
  )
}

///获取主题详情接口
export function getTopicDetailList(id: number) {
  return axiosHelper.get<TopicDetailModel>(
    {
      url: Api.internal + id,
      headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
    }
  )
}

///获取视频详情接口 @param id
export function getRelationList(id: number) {
  return axiosHelper.get<HomeModel>(
    {
      url: Api.related,
      params: { "id": id },
      headers: { 'Content-Type': "application/json" } as AxiosRequestHeaders
    }
  )
}

/**
 * 获取分类详情接口
 * @param id
 * @param start
 */
export function getCategoryDetailList(id: number, start: number) {
  return axiosHelper.get<HomeModel>(
    {
      url: Api.videoList,
      params: {
        "id": id,
        "start": start,
        "udid": AppString.UUID,
        deviceModel: AppString.DEVICE_NUM
      },
      headers: { "Accept": "application/json" } as AxiosRequestHeaders
    }
  )
}

//////////////////获取wnaAndroid//////////////////

export function getWanLogin(params: HashMap<string, Object>) {
  return httpHelper.postForm<any>({ url: Api.login, extraData: params })
}

//Banner数据
export function getWanBanner() {
  return httpHelper.get<BannerBean[]>({ url: Api.banner })
}

//文章数据
export function getWanArticle(page: number) {
  return httpHelper.get<Article>({ url: Api.article + page + '/json' })
}

//体系数据
export function getWanTree() {
  return httpHelper.get<ITree[]>({ url: Api.tree })
}

//导航数据
export function getWanNav() {
  return httpHelper.get<INav[]>({ url: Api.nav })
}

//////////////////获取apiopen.top//////////////////

export function getImages(page: number) {
  return httpHelper.get<BannerBean[]>({ url: Api.getImages + `?type=person&page=${page}&size=${Api.PAGE_SIZE}` })
}

export function getHaoKanVideo(page: number) {
  return httpHelper.get<Article>({ url: Api.getHaoKanVideo + `?page=${page}&size=${Api.PAGE_SIZE}` })
}

export function getMiniVideo(page: number) {
  return httpHelper.get<ITree[]>({ url: Api.getMiniVideo + `?page=${page}&size=${Api.PAGE_SIZE}` })
}

export function getSentences() {
  return httpHelper.get<INav[]>({ url: Api.sentences })
}

