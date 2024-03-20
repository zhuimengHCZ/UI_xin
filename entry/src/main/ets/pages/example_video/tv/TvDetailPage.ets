import List from '@ohos.util.List';
import { Router } from '../../../route/Router';
import TitleComponent from '../../../views/TitleComponent';

@Entry
@Component
struct MovieDetailPage {
  movieItem:any[] =[]
  @Styles blockStyle(){
    .backgroundColor(Color.White)
    .borderRadius(15)
    .padding(15)
    .width('100%')
    .margin({ top: 15 })
  }

  aboutToAppear() {
    this.movieItem= [{
      "img": "xh.png",
      "name": "刘一",
      "des": "来世，我定退了沙场",
      "star": "10",
      "score": 8,
      "plot": "10:00",
      "starList": [{
        "img": "xh.png",
        "name": "刘2",
        "des": "来世，我定退了沙场",
        "role": "10",
        "works": "10:00",
      },{
        "img": "xh.png",
        "name": "刘3",
        "des": "来世，我定退了沙场",
        "role": "10",
        "works": "10:00",
      }],
      "tvList": [{
        "img": "xh.png",
        "name": "刘2",
        "des": "来世，我定退了沙场",
        "role": "10",
        "works": "10:00",
      },{
        "img": "xh.png",
        "name": "刘3",
        "des": "来世，我定退了沙场",
        "role": "10",
        "works": "10:00",
      }],
      'movieUrlGroup': [{
        "label": "分组1",
        "playGroup": "1",
        "url": "10"
      },{
        "label": "分组2",
        "playGroup": "2",
        "url": "10"
      }],

    }]
  }

  build() {
    Column(){
      Scroll() {
        Column(){
          Row(){
            Row(){
              Image($r('app.media.icon_play'))
                .width(40)
                .height(40)
            }
            .borderRadius(15)
            .justifyContent(FlexAlign.Center)
            .alignItems(VerticalAlign.Center)
            .width(150)
            .height(200)
            .backgroundImage(this.movieItem['img'],ImageRepeat.NoRepeat)
            .backgroundImageSize(ImageSize.Cover)
            .onClick((event:ClickEvent)=>{
              Router.push('movie/pages/MoviePlayPage',{
                movieItem: this.movieItem
              });
            })
            Column(){
              Text(this.movieItem['name'])
                .padding({bottom:10})
                .fontWeight(FontWeight.Bolder)
                .fontSize(25)
              Text(this.movieItem['des'] ? this.movieItem['des'].replace(/\n|\s/g,'') : '')
                .padding({bottom:10})
                .fontSize(15)
                .fontColor('#999999')
              Text(this.movieItem['star'])
                .padding({bottom:10})
                .fontSize(15)
                .fontColor('#999999')
              if(this.movieItem['score']){
                Row(){
                  Rating().stars(this.movieItem['score']).stepSize(0.1)
                  Text(this.movieItem['score'].toString())
                    .padding({left:10})
                    .fontColor(Color.Red)
                    .fontSize(15)
                    .fontWeight(FontWeight.Bolder)
                }.justifyContent(FlexAlign.Start).margin({top:10})
              }
            }.flexGrow(1)
            .alignItems(HorizontalAlign.Start)
            .margin({left:15})
          }.blockStyle()

          Column(){
            TitleComponent({title:'剧情'})
            Text(this.movieItem['plot'])
              .padding({top:10})
              .fontSize(15)
              .fontColor('#999999')
          }.justifyContent(FlexAlign.Start)
          .blockStyle()

          Column(){
            TitleComponent({title:'演员'})
            Scroll(){
              Row(){
                ForEach(this.movieItem['starList'],(item)=>{
                  Column(){
                    Image(item['img'])
                      .width(150)
                      .height(200)
                      .borderRadius(15)
                      .margin({bottom:10})
                    Text(item.starName).fontSize(15)
                  }
                  .margin({right:10})
                  .alignItems(HorizontalAlign.Center)
                  .width(150)
                })
              }
            }.width('100%').scrollable(ScrollDirection.Horizontal)
          }
          .blockStyle()

          Column(){
            TitleComponent({title:'推荐'})
            Scroll(){
              Row(){
                ForEach(this.movieItem['tvList'],(item)=>{
                  Column(){
                    Image(item['img'])
                      .width(150)
                      .height(200)
                      .borderRadius(15)
                      .margin({bottom:10})
                    Text(item.movieName).fontSize(15)
                  }
                  .margin({right:10})
                  .alignItems(HorizontalAlign.Center)
                  .width(150)
                })
              }
            }.width('100%').scrollable(ScrollDirection.Horizontal)
          }
          .blockStyle()

        }.justifyContent(FlexAlign.Start)
      }
    }.width('100%')
    .height('100%')
    .padding({ left: 15, right: 15,bottom:15  })
    .justifyContent(FlexAlign.Start)
    .backgroundColor('#efefef')
  }
}