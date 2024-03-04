import { AppBar } from '../../common/AppBar';
import { Router } from '../../route/Router';
import { Category } from '../../model/CategoricalType';

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
  private child: Category[] = [];
  private index: number = 0;

  build() {
    Column() {
      AppBar({ title: this.index === 0 ? '组件' : '示例', backButton: false })
      List() {
        if (this.index === 0) {
          ForEach(this.child, (category: Category, oneIndex: number) => {
            ListItem() {
              Column() {
                Text(category.title)
                  .height(48)
                  .fontSize(14)
                  .width('100%')
                  .textAlign(TextAlign.Start)
                  .fontFamily('HarmonyHeiTi-Medium')
                  .fontColor($r('app.color.font_color_shallow'))
                  .padding({ bottom: 4, top: 4, left: 24 })

                Column() {
                  ForEach(category.child, (category: Category, twoIndex: number) => {
                    TwoView({
                      category: category,
                      typeIndex: 0,
                      idStr: `${this.index}${oneIndex}${twoIndex}`,
                    })
                  })
                }
                .ColumnStyle()
              }
            }
          })
        } else {
          ForEach(this.child, (category: Category, oneIndex: number) => {
            ListItem() {
              Column() {
                TwoView({ category: category,typeIndex: 0,idStr: `${this.index}${oneIndex}`, })
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

      Divider()
        .height(0.75)
        .width('100%')
        .alignSelf(ItemAlign.Baseline)
        .color($r('app.color.tab_bar_divider'))
    }
    .height('100%')
    .padding({ top: 12 })
  }
}

@Component
struct TwoView {
  @State isUnfold: boolean = false
  private category: Category
  private typeIndex: number
  private idStr: string =""

  build() {
    Column() {
      Row() {
        Text(this.category.title)
          .fontSize(16)
          .margin({ left: 16 + this.typeIndex * 32 })
          .fontFamily('HarmonyHeiTi-Medium')
          .fontColor($r('app.color.font_color_dark'))
        Blank()
        if (this.category.child) {
          Image(this.isUnfold ? $r("app.media.ic_down") : $r("app.media.ic_right"))
            .width(this.isUnfold ? 24 : 12)
            .height(this.isUnfold ? 12 : 24)
            .margin({ right: this.isUnfold ? 0 : 6 })
        }
      }
      .height(56)
      .width('100%')
      .onClick(() => {
        if (this.category.child === undefined) {
          Router.push(this.category.url, { "title": this.category.title })
        } else {
          this.isUnfold = !this.isUnfold;
        }
      })

      if (this.isUnfold) {
        ForEach(this.category.child, (category: Category) => {
          Column() {
            Divider()
              .height(1)
              .opacity(0.2)
              .margin({ left: 42 + this.typeIndex * 32, right: 8 })
              .color($r('app.color.font_color_dark'))
            TwoView({ category: category, typeIndex: this.typeIndex + 1 })
          }
        }, item => JSON.stringify(item))
      }
    }
    .id(`level${this.idStr}`)
  }
}