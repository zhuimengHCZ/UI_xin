import { Router } from '../../route/Router';
import { TypeModel } from '../../model/TypeModel';
import { Components_CATEGORY, Example_CATEGORY } from '../../data/CategoryData';
import { DividerView } from '../view/DividerView';
import showToast from '../../utils/ToastUtils';

@Extend(Column)
function ColumnStyle() {
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .padding({ left: 12, right: 12, bottom: 4, top: 4 })
}

@Preview
@Component
export struct TabContentView {
  private index: number

  build() {
    Column() {
      List() {
        if (this.index === 0) {
          ForEach(Components_CATEGORY, (type: TypeModel, oneIndex: number) => {
            ListItem() {
              Column() {
                Text(type.title)
                  .height(48)
                  .fontSize(14)
                  .width('100%')
                  .textAlign(TextAlign.Start)
                  .fontFamily('HarmonyHeiTi-Medium')
                  .fontColor(Color.Blue)
                  .padding({ bottom: 4, top: 4, left: 24 })

                Column() {
                  ForEach(type.child, (type: TypeModel, twoIndex: number) => {
                    TwoView({
                      type: type,
                      typeIndex: 0,
                      idStr: `${this.tabIndex}${oneIndex}${twoIndex}`,
                    })
                  })
                }
                .ColumnStyle()
              }
            }
          })
        } else {
          ForEach(Example_CATEGORY, (type: TypeModel, oneIndex: number) => {
            ListItem() {
              Column() {
                TwoView({ type: type, typeIndex: 0, idStr: `${this.tabIndex}${oneIndex}`, })
              }
              .ColumnStyle()
            }
            .margin({ top: 4, bottom: 4 })
          })
        }
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, top: 4 })

      Blank()

      DividerView()
    }
    .height('100%')
    .padding({ top: 40 })
  }
}

@Component
struct TwoView {
  @State isUnfold: boolean = false
  private type: TypeModel
  private typeIndex: number
  private idStr: string = ""

  build() {
    Column() {
      Row() {
        Text(this.type.title)
          .fontSize(16)
          .margin({ left: 16 + this.typeIndex * 32 })
          .fontFamily('HarmonyHeiTi-Medium')
          .fontColor(Color.Black)
        Blank()
        if (this.type.child) {
          Image(this.isUnfold ? $r("app.media.ic_down") : $r("app.media.ic_right"))
            .width(this.isUnfold ? 24 : 12)
            .height(this.isUnfold ? 12 : 24)
            .margin({ right: this.isUnfold ? 0 : 6 })
        }
      }
      .height(56)
      .width('100%')
      .onClick(() => {
        if (this.type.child === undefined) {
          if(this.type.url){
            Router.push(this.type.url, { "title": this.type.title })
          }else {
            showToast('正在赶来的路上…')
          }

        } else {
          this.isUnfold = !this.isUnfold;
        }
      })

      if (this.isUnfold) {
        ForEach(this.type.child, (type: TypeModel) => {
          Column() {
            DividerView({ marginValue: { left: 42 + this.typeIndex * 32, right: 8 } })
            TwoView({ type: type, typeIndex: this.typeIndex + 1 })
          }
        }, item => JSON.stringify(item))
      }
    }
    .id(`level${this.idStr}`)
  }
}