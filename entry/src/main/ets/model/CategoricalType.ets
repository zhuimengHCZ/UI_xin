export interface TabBarCategory {
  child: Category[] | OtherCategory[],
  iconSelected: Resource, // TabBar icon is selected
  icon: Resource, // TabBar icon is not selected
  title: Resource // TabBar title
}

export interface Category {
  title:string | Resource, // One-level category title
  url?: string, // One-level category detail page URL
  child?: Category[]
}

export interface OtherCategory {
  title: Resource, //自定义一些其他分类
}
