import display from '@ohos.display'
import { Router } from '../../route/Router'
import { AppBar } from '../../views/AppBar'
import { CommonDialog } from '../../views/CommonDialog'
import { GameController } from './model/GameController'
import { GameDataSource } from './model/GameDataSource'

@Entry
@Component
struct Game2048Index {
  @State flatCellArr: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  private gameController: GameController = new GameController()
  @State @Watch("onGameOver") isGameOver: boolean = false
  gameOverDialogController: CustomDialogController = new CustomDialogController({
    builder: CommonDialog({
      description: '游戏结束',
      confirmText: '重新开始',
      confirm: () => this.startGame.bind(this)
    }),
    autoCancel: false
  })
  @State screenX: number = 750

  onGameOver() {
    if (this.isGameOver === true) {
      this.gameOverDialogController.open()
    }
  }

  startGame() {
    this.flatCellArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    this.gameController.init(this.flatCellArr)
    this.flatCellArr = this.gameController.getFlatCellArr()
    this.isGameOver = false
  }

  moveUp() {
    this.gameController.moveUp()
    this.updateCells()
  }

  moveDown() {
    this.gameController.moveDown()
    this.updateCells()
  }

  moveLeft() {
    this.gameController.moveLeft()
    this.updateCells()
  }

  moveRight() {
    this.gameController.moveRight()
    this.updateCells()
  }

  updateCells() {
    this.flatCellArr = this.gameController.getFlatCellArr()
    this.isGameOver = this.gameController.isGameOver
  }

  aboutToAppear() {
    try {
      let displayClass = display.getDefaultDisplaySync();
      if (displayClass.height > displayClass.width) {
        this.screenX = px2vp(displayClass.width)
      } else {
        this.screenX = px2vp(displayClass.height)
      }
    } catch (exception) {
      console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
    }
    this.startGame()
  }

  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Column() {
        Grid() {
          LazyForEach(new GameDataSource(this.flatCellArr), (item) => {
            GridItem() {
              Text(`${item === 0 ? '' : item}`)
                .fontSize('85px')
                .fontColor(item <= 4 ? '#000' : '#fcf8f5')
                .fontWeight(FontWeight.Bolder)
                .backgroundColor('#f0fff0')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(this.getCellBackgroundColor(item))
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width(this.screenX)
        .height(this.screenX)
        .padding(10)
        .backgroundColor('rgba(80,69,46,0.26)')

        .borderRadius(10)
        .gesture(GestureGroup(GestureMode.Exclusive,
          PanGesture({ direction: PanDirection.Left }).onActionEnd(() => {
            this.moveLeft()
          }),
          PanGesture({ direction: PanDirection.Right }).onActionEnd(() => {
            this.moveRight()
          }),
          PanGesture({ direction: PanDirection.Up }).onActionEnd(() => {
            this.moveUp()
          }),
          PanGesture({ direction: PanDirection.Down }).onActionEnd(() => {
            this.moveDown()
          })
        ))

        Button('向上', { type: ButtonType.Normal })
          .borderRadius(5)
          .width(100)
          .margin({ top: 20 })
          .onClick(() => {
            this.moveUp()
          })
        Row() {
          Button('向左', { type: ButtonType.Normal })
            .borderRadius(5)
            .width(100)
            .onClick(() => {
              this.moveLeft()
            })
          Button('向右', { type: ButtonType.Normal })
            .borderRadius(5)
            .width(100)
            .margin({ left: 50 })
            .onClick(() => {
              this.moveRight()
            })
        }.margin({ top: 20 })

        Button('向下', { type: ButtonType.Normal })
          .borderRadius(5)
          .width(100)
          .margin({ top: 20 })
          .onClick(() => {
            this.moveDown()
          })
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .height('100%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }

  getCellBackgroundColor(cellValue: number) {
    switch (cellValue) {
      case 2:
        return "#EEE4DA";
      case 4:
        return "#EDE0C8";
      case 8:
        return "#F26179";
      case 16:
        return "#F59563";
      case 32:
        return "#F67C5F";
      case 64:
        return "#F65E36";
      case 128:
        return "#EDCF72";
      case 256:
        return "#EDCC61";
      case 512:
        return "#90C000";
      case 1024:
        return "#3365A5";
      case 2048:
        return "#90C000";
      case 4096:
        return "#60B0C0";
      case 8192:
        return "#9030C0";
      default:
        return "#CDC1B4";
    }
  }
}