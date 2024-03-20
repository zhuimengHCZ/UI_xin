import web_webview from '@ohos.web.webview'
import display from '@ohos.display';

@Entry
@Component
struct MoviePlayPage {
  @State movieItem:any[] =[];// 电影详情
  @State currentUrl:string =  '';// 当前播放地址
  @State currentUrlGroup:number = 0;// 当前选中的url分组
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  screenWidth:number = display.getDefaultDisplaySync().width;

  @Styles blockStyle(){
    .backgroundColor(Color.White)
    .borderRadius(15)
    .padding(15)
    .width('100%')
    .margin({ top: 15 })
  }

  aboutToAppear() {
  }

  build() {
    Column(){
      Scroll() {
        Column(){
          if(this.currentUrl){
            Web({ src: this.currentUrl, controller:this.controller })
              .height(300)
              .width('100%')
              .backgroundColor(Color.Black)
          }else{
            Row().height(300).width('100%').backgroundColor(Color.Black)
          }

          Column(){
            Column(){
              Text(this.movieItem['name'])
                .fontWeight(FontWeight.Bolder)
                .fontSize(25)
                .padding({bottom:10})
              Text(this.movieItem['star']).fontSize(15)
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
            }.blockStyle().alignItems(HorizontalAlign.Start)

            Column(){
              Scroll(){
                Row(){
                  ForEach(this.movieItem['movieUrlGroup'],(item,index:number)=>{
                    Text((/^\d$/.test(item[0].playGroup) ? '分组': '') + item[0].playGroup).border({
                      width: { top: this.currentUrlGroup == index ? 1 : 0,bottom: this.currentUrlGroup == index ? 0 : 1, left : this.currentUrlGroup == index ? 1 : 0, right:this.currentUrlGroup == index ? 1 : 0},
                      color: '#999999',
                      style: BorderStyle.Solid
                    }).padding(10)
                      .fontColor(this.currentUrlGroup == index ? Color.Orange : Color.Black)
                      .onClick(()=>{
                        this.currentUrlGroup = index;
                      })
                  })
                }
              }.width('100%').scrollable(ScrollDirection.Horizontal)
              Grid(){
                ForEach(this.movieItem['movieUrlGroup'][this.currentUrlGroup],(item)=>{
                  GridItem(){
                    Text(item['label']).border({
                      width:1,
                      color:this.currentUrl == item.url ? Color.Orange : Color.Black,
                      style:BorderStyle.Solid
                    }).padding(10)
                      .fontColor(this.currentUrl == item.url ? Color.Orange : Color.Black)
                      .width('100%').textAlign(TextAlign.Center).borderRadius(15)
                  }
                })
              }
                .columnsTemplate('1fr 1fr 1fr 1fr')
                .columnsGap(10)
                .rowsGap(10).margin({top:10})
            }.blockStyle().alignItems(HorizontalAlign.Start)
          }
          .backgroundColor(Color.White)
          .padding({ left: 15, right: 15,bottom:15 })
        }.justifyContent(FlexAlign.Start)
      }
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .backgroundColor(Color.White)
  }
}