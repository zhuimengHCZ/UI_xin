import { RoutePath } from '../route/RoutePath';
import { Category, TabBarCategory } from '../model/CategoricalType';

const Example_CATEGORY: Category[] = [
  {
    title: $r('app.string.Example_Multimedia'),
    url: RoutePath.HomePage
  },
  {
    title: $r('app.string.Example_Mall'),
    url: RoutePath.HomePage
  },
  {
    title: $r('app.string.Example_Education'),
    url: RoutePath.HomePage
  },
  {
    title: $r('app.string.Example_TrafficNavigation'),
    url: RoutePath.HomePage
  }
];

const TimePicker_Type: Category[] = [
  {
    title: $r('app.string.CalendarPicker'),
    url: RoutePath.CalendarPickerPage
  },
  {
    title: $r('app.string.DatePicker'),
    url: RoutePath.DatePickerPage
  },
];
const Checkbox_Type: Category[] = [
  {
    title: $r('app.string.CheckboxGroup'),
    url: RoutePath.CheckboxGroupPage
  },
  {
    title: $r('app.string.Checkbox'),
    url: RoutePath.CheckboxPage
  }
];
const SelectionBox_Type: Category[] = [
  {
    title: $r('app.string.Checkbox'),
    child: Checkbox_Type
  },
  {
    title: $r('app.string.Radio'),
    url: RoutePath.RadioPage
  },
];
const Components_Child: Category[] = [
  {
    title: $r('app.string.Blank'),
    url: RoutePath.BlankPage
  },
  {
    title: $r('app.string.Button'),
    url: RoutePath.ButtonPage
  },
  {
    title: $r('app.string.CalendarPicker'),
    child: TimePicker_Type
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
    title: $r('app.string.Radio'),
    url: RoutePath.RadioPage
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
];
const Container_Child: Category[] = [
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
  }
];

const Components_CATEGORY: Category[] = [
  {
    title: $r('app.string.Basic_components'),
    child: Components_Child
  },
  {
    title: $r('app.string.Container_components'),
    child: Container_Child
  }
];

export const HOME_TABS: TabBarCategory[] = [
  {
    title: $r('app.string.table_ui'),
    icon: $r("app.media.tab_ui"),
    iconSelected: $r("app.media.tab_ui_selected"),
    child: Components_CATEGORY
  },
  {
    title: $r('app.string.table_example'),
    icon: $r("app.media.tab_example"),
    iconSelected: $r("app.media.tab_example_selected"),
    child: Example_CATEGORY
  }
];
