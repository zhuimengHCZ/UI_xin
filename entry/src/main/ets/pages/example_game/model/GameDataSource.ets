export class GameDataSource implements IDataSource {
    public dataArray: string[][] = []

    constructor(ele) {
        for (var index = 0;index < ele.length; index++) {
            this.dataArray.push(ele[index])
        }
    }

    public totalCount(): number {
        return this.dataArray.length
    }

    public getData(index: number): any {
        return this.dataArray[index]
    }

    registerDataChangeListener(listener: DataChangeListener): void {
    }

    unregisterDataChangeListener(listener: DataChangeListener): void {
    }
}