import { RoutePath } from '../route/RoutePath';
import { TypeModel } from '../model/TypeModel';


const Picker_Type: TypeModel[] = [
  {
    title: $r('app.string.CalendarPicker'),
    url: RoutePath.CalendarPickerPage
  },
  {
    title: $r('app.string.DatePicker'),
    url: RoutePath.DatePickerPage
  },
  {
    title: $r('app.string.TimePicker'),
    url: RoutePath.TimePickerPage
  },
  {
    title: $r('app.string.TextPicker'),
    url: RoutePath.TextPickerPage
  },
];
const Checkbox_Type: TypeModel[] = [
  {
    title: $r('app.string.CheckboxGroup'),
    url: RoutePath.CheckboxGroupPage
  },
  {
    title: $r('app.string.Checkbox'),
    url: RoutePath.CheckboxPage
  }
];
const SelectionBox_Type: TypeModel[] = [
  {
    title: 'Checkbox(复选框)',
    child: Checkbox_Type
  },
  {
    title: $r('app.string.Radio'),
    url: RoutePath.RadioPage
  },
  {
    title: $r('app.string.Toggle'),
    url: RoutePath.TogglePage
  },
  {
    title: 'Picker(选取器)',
    child: Picker_Type
  },
];
const Components_Child: TypeModel[] = [

  {
    title: 'AlphabetIndexer(联动容器组件)',
    url: RoutePath.AlphabetIndexerPage
  },
  {
    title: $r('app.string.Blank'),
    url: RoutePath.BlankPage
  },
  {
    title: $r('app.string.Button'),
    url: RoutePath.ButtonPage
  },

  {
    title: '选择框',
    child: SelectionBox_Type
  },

  {
    title: $r('app.string.DataPanel'),
    url: RoutePath.DataPanelPage
  },
  {
    title: $r('app.string.Divider'),
    url: RoutePath.DividerPage
  },
  {
    title: $r('app.string.FormComponent'),
    url: RoutePath.FormComponentPage
  },
  {
    title: $r('app.string.Gauge'),
    url: RoutePath.GaugePage
  },
  {
    title: $r('app.string.Image'),
    url: RoutePath.ImagePage
  },
  {
    title: $r('app.string.ImageAnimator'),
    url: RoutePath.ImageAnimatorPage
  },
  {
    title: $r('app.string.LoadingProgress'),
    url: RoutePath.LoadingProgressPage
  },
  {
    title: $r('app.string.Marquee'),
    url: RoutePath.MarqueePage
  },
  {
    title: $r('app.string.Menu'),
    url: RoutePath.MenuPage
  },
  {
    title: $r('app.string.PatternLock'),
    url: RoutePath.PatternLockPage
  },
  {
    title: $r('app.string.Progress'),
    url: RoutePath.ProgressPage
  },
  {
    title: $r('app.string.QRCode'),
    url: RoutePath.QRCodePage
  },
  {
    title: $r('app.string.Rating'),
    url: RoutePath.RatingPage
  },
  {
    title: $r('app.string.RichText'),
    url: RoutePath.RichTextPage
  },
  {
    title: $r('app.string.ScrollBar'),
    url: RoutePath.ScrollBarPage
  },

  {
    title: $r('app.string.Span'),
    url: RoutePath.SpanPage
  },
  {
    title: $r('app.string.Stepper'),
    url: RoutePath.StepperPage
  },
  {
    title: $r('app.string.Text'),
    url: RoutePath.TextPage
  },
  {
    title: $r('app.string.TextArea'),
    url: RoutePath.TextAreaPage
  },
  {
    title: $r('app.string.TextClock'),
    url: RoutePath.TextClockPage
  },
  {
    title: $r('app.string.TextInput'),
    url: RoutePath.TextInputPage
  },

  {
    title: $r('app.string.TextTimer'),
    url: RoutePath.TextTimerPage
  },
  {
    title: $r('app.string.Web'),
    url: RoutePath.WebPage
  },
  {
    title: $r('app.string.XComponent'),
    url: RoutePath.XComponentPage
  },
];
const Container_Child: TypeModel[] = [
  {
    title: $r('app.string.Badge'),
    url: RoutePath.BadgePage
  },
  {
    title: $r('app.string.Column'),
    url: RoutePath.ColumnPage
  },
  {
    title: $r('app.string.ColumnSplit'),
    url: RoutePath.ColumnSplitPage
  },
  {
    title: $r('app.string.Row'),
    url: RoutePath.RowPage
  },
  {
    title: $r('app.string.RowSplit'),
    url: RoutePath.RowSplitPage
  },
  {
    title: $r('app.string.Counter'),
    url: RoutePath.CounterPage
  },
  {
    title: $r('app.string.Flex'),
    url: RoutePath.FlexPage
  },
  {
    title: $r('app.string.GridRow'),
    url: RoutePath.GridRowPage
  },
  {
    title: $r('app.string.Grid'),
    url: RoutePath.GridPage
  },
  {
    title: $r('app.string.List'),
    url: RoutePath.ListPage
  },
  {
    title: $r('app.string.Navigator'),
    url: RoutePath.NavigatorPage
  },
  {
    title: $r('app.string.Panel'),
    url: RoutePath.PanelPage
  },
  {
    title: $r('app.string.Refresh'),
    url: RoutePath.RefreshPage
  },
  {
    title: $r('app.string.RelativeContainer'),
    url: RoutePath.RelativeContainerPage
  },
  {
    title: $r('app.string.Scroll'),
    url: RoutePath.ScrollPage
  },
  {
    title: $r('app.string.SideBarContainer'),
    url: RoutePath.SideBarContainerPage
  },
  {
    title: $r('app.string.Stack'),
    url: RoutePath.StackPage
  },
  {
    title: $r('app.string.Swiper'),
    url: RoutePath.SwiperPage
  },
  {
    title: $r('app.string.Tabs'),
    url: RoutePath.TabsPage
  },
  {
    title: $r('app.string.WaterFlow'),
    url: RoutePath.WaterFlowPage
  },
];

const Media_Child: TypeModel[] = [
  {
    title: 'Video(视频组件)',
    url: RoutePath.VideoPage
  }
];
const Dialog_Child: TypeModel[] = [
  {
    title: 'AlertDialog',
    url: RoutePath.AlertDialogPage
  },
  {
    title: 'ActionSheet',
    url: RoutePath.ActionSheetPage
  },
  {
    title: 'CustomDialog',
    url: RoutePath.CustomDialogPage
  },
  {
    title: 'DatePickerDialog',
    url: RoutePath.DatePickerDialogPage
  },
  {
    title: 'TimePickerDialog',
    url: RoutePath.TimePickerDialogPage
  },
  {
    title: 'TextPickerDialog',
    url: RoutePath.TextPickerDialogPage
  }
];

export const Components_CATEGORY: TypeModel[] = [
  {
    title: '基础组件',
    child: Components_Child
  },
  {
    title: '容器组件',
    child: Container_Child
  },
  {
    title: '媒体组件',
    child: Media_Child
  },
  {
    title: '绘制组件',

  },
  {
    title: '画布组件',
  },
  {
    title: '弹窗',
    child: Dialog_Child
  },
];

export const Example_CATEGORY: TypeModel[] = [
  {
    title: '多媒体APP',
    url: RoutePath.VideoIndex
  },
  {
    title: '文章类APP',
    url: RoutePath.ArticleIndex
  },
  {
    title: '聊天APP',
    url: RoutePath.ChatIndex
  },
  {
    title: '2048APP',
    url: RoutePath.Game2048Index
  },
  {
    title: '教育APP',
  },
  {
    title: '商城APP',
  },
  {
    title: '导航交通APP',
  },
  {
    title: '其他App正在赶来的路上…'
  },
];