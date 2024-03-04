//card.ets
import { AppBar } from '../../common/AppBar';
import { Router } from '../../route/Router';

@Entry
@Component
struct FormComponentPage {
  @State formId:number = 0;
  build() {
    Column() {
      AppBar({ title: Router.getTitle() })
      Text('this is a card')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      // FormComponent({
      //   id:this.formId,
      //   name:"Form1",
      //   bundle:"com.example.cardexample",
      //   ability:"FormAbility",
      //   module:"entry",
      //   dimension:FormDimension.Dimension_2_2,
      //   temporary:false
      // })
      //   .allowUpdate(true)
      //   .size({width:360,height:360})
      //   .visibility(Visibility.Visible)
      //   .onAcquired((form)=>{
      //     console.log(`form info : ${JSON.stringify(form)}`);
      //     this.formId = form.id;
      //   })
      //   .onError((err)=>{
      //     console.log(`fail to add form, err: ${JSON.stringify(err)}`);
      //   })

    }
    .width('100%')
    .height('100%')
  }
}
