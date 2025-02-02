#import "config.typ": *

#show: project.with(
  title: "用ANTLR实现SysY词法/语法分析器",
  author: "风车车",
  
  infos: (
    (key: [学#h(2em)员:], value: "风车车"),
    (key: [学#h(2em)号:], value: "202200000000"),
    (key: [培养类型:], value: "地方本科生"),
    (key: [年#h(2em)级:], value: "2022级"),
    (key: [专#h(2em)业:], value: "计算机类"),
    (key: [所属学院:], value: "计算机学院"),
    (key: [指导教员:], value: "假老练"),
    (key: [职#h(2em)称:], value: "教授"),
    (key: [实#h(0.5em)验#h(0.5em)室:], value: "305-101"),
    (key: [实验日期:], value: "2025年2月1日"),
  ),

  instructions_display: true,  // 是否显示填写说明
  outline_display: true,        // 是否显示目录
)

// ==================== 正文内容 ====================
= 模版简介

== 默认设置

=== 字体

==== 标题字体为“黑体（SimHei）”；
==== 正文英文字体为“Times New Roman”，中文字体为“宋体（SimSun）”；
==== 代码字体为“DejaVu Sans Mono”；
==== 数学公式字体为“New Computer Modern Math”；
==== 封面、填写说明和目录页还用到了“仿宋（FangSong）”“思源宋体（Source Han Serif）”“思源黑体（Source Han Sans）”等字体。

=== 字号
正文默认为小四号字，标题根据级别有所不同，一级标题为四号字，二级、三级、四级标题为小四号字。

=== 页边距
上下左右各侧的页边距均为3cm；页脚距边界为2.5cm。

=== 段落格式
首行缩进2em，行间距为1.5em，段前间距为1.5em。

=== 标题编号
一级标题编号为“一、”，二级标题为“（一）”，三级标题为“1.”，四级标题为“（1）”。分别缩进0em、0.5em、1em和1em。

== 包含文件
- fonts文件夹：包含实验报告所需字体文件；
- pic文件夹：用于存放实验报告中的图片文件；
- config.typ：配置文件，包含实验报告的全局设置和格式定义；
- main.typ：实验报告的正文文件，用户需在其中编写实验报告内容。

==  模板功能说明
=== 封面
实验报告的封面会自动生成，包含实验名称、学员基本信息等；
实验名称在main.typ中通过title参数设置，学员基本信息通过infos参数设置。

=== 填写说明
模板默认会显示填写说明，如果不需要，可以在main.typ中将instructions_display参数设置为false。

=== 目录
模板默认会生成目录，如果不需要，可以在main.typ中将outline_display参数设置为false。

=== 标题编号
模板支持最高四级标题编号，编号格式为“一、（一）1.（1）”。

=== 列表
无序列表默认使用“•”和“◦”作为标记；
有序列表默认使用数字编号。


文本的字体和字号可以在config.typ中全局设置，也可以在main.typ中局部调整。
自定义说明
如果需要对模板进行自定义，可以修改config.typ文件中的相应部分，例如：

如果需要进一步的帮助，请参照Typst的官方文档或加入Typst的中文交流群。



= 使用说明

== 本地使用（推荐）
+ 下载对应平台的 typst：https://github.com/typst/typst/releases 根据其README文件完成安装。
+ 推荐在 VSCode 中编辑，使用Tinymist Typst插件可以实现代码提示、文本和预览之间的快速跳转与实时预览功能。
+ clone 本仓库 
  ```bash
  git clone https://github.com/Lane0218/NUDT-Report-Typst
  ```
+ 安装fonts文件夹中的字体
+ 在main.typ中编写实验报告内容，利用右侧预览窗口实时查看渲染效果。
+ 在本项目目录里，命令行执行 `typst c .\main.typ` 的命令即可编译生成同名PDF文件。

== 在线使用Typst App（不推荐）
+ clone 本仓库 
  ```bash
  git clone https://github.com/Lane0218/NUDT-Report-Typst
  ```
+ 打开Typst官方Web App（https://typst.app/），选择Start from scratch新建空白文档，手动上传项目文件。（注意：部分字体在Web App中没有提供，需要上传fonts文件夹中的字体文件到项目中）

+ 在main.typ中编写实验报告内容，利用右侧预览窗口实时查看渲染效果。







= 使用示例 <example>

== 特殊标记 <bug1>

你可以 Typst 的语法对文本进行特殊标记，我们为如下标记设定了样式：

#enum(
  [*突出*],
  [_emph 强调_],
  [引用 @example],
  [`raw text`] 
)

=== 注意事项

由于 Typst 的语法， 如果你使用 `*本文*` 来标记突出，那么你需要在 `*` 前面加上一个空格，但这会导致你 *突出的文本* 前后附带一个空格，如果你#strong("不想要这个空格")，你可以使用 `#strong("本文")` 来代替。

== 图片

图片插入例：

#figure(
  image("./pic/01.png",  width: 60%),
  caption: [
    示例图片
  ],
)<img>

== 表格 <bug2>

表格有助于数据的整理与展示。Typst 支持使用 `table` 来插入表格，详见 #link("https://typst.app/docs/reference/model/table/")[typst/docs/table]。下面是一些表格插入的示例：

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [], [*Area*], [*Parameters*],
    ),
    [*Cylinder*],
    [$pi h (D^2 - d^2) / 4$],
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],
    [*Tetrahedron*],
    [$sqrt(2) / 12 a^3$],
    [$a$: edge length]
  ),
  caption: "示例表格"
)

#figure(
  table(
    columns: 4,
    align: center + horizon,
    stroke: none,
    table.hline(),
    table.header(
      table.cell(rowspan: 2, [*Names*]), 
      table.cell(colspan: 2,[*Properties*],),
      table.hline(stroke: 0.6pt),
      table.cell(rowspan: 2, [*Creators*]),
      [*Type*], [*Size*],
      
    ),
    table.hline(stroke: 0.4pt),
    [Machine], [Steel], [5 $"cm"^3$], [John p& Kate],
    [Frog], [Animal], [6 $"cm"^3$], [Robert],
    [Frog], [Animal], [6 $"cm"^3$], [Robert],
    table.hline()
  ),
  caption: "示例表格"
)

== 公式

Typst 可以使用 Typst 原生语法插入公式，参考 #link("https://typst.app/docs/reference/math/")[typst/docs/math]。下面是一些公式插入的示例：

首先是行内公式，例如 $integral_123^123a+b+c$ $a^2 + b^2 = c^2$。行内公式使用 `$$` 包裹，公式和两端的 `$$` 之间没有空格$$。

其次是行间公式，例如：$ integral.triple_(Omega)\(frac(diff P, diff x) + frac(diff Q, diff y) + frac(diff R, diff z)\)d v = integral.surf_(Sigma)P d y d z + Q d z d x + R d x d y $ 式（1）是高斯公式。行间公式使用 `$$` 环境包裹，公式和两端的 `$$` 之间至少有一个空格，若要显示公式编号请使用 `#equation()` 函数，如：$ integral.triple_(Omega)\(frac(diff P, diff x) + frac(diff Q, diff y) + frac(diff R, diff z)\)d v = integral.surf_(Sigma)P d y d z + Q d z d x + R d x d y $

公式内可以使用换行符 `\` 换行。若需要对齐，每行可以包含一个或多个对齐点 `&` 对其进行对齐。例如：
$ sum_i b_i &= sum_i sum_(h,j != i) frac(sigma_(h j) (i), sigma_(h j)) \ &= sum_(h != j) frac(1, sigma_(h j)) sum_(i != h,j) sigma_(h j)(i) $ `&` 是对齐的位置，`&` 可以有多个，但是每行的个数要相同。

矩阵输入示例：
$ A = mat(
  a_(1 1), a_(1 2), ..., a_(1 n);
  a_(2 1), a_(2 2), ..., a_(2 n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
) $


分段函数可以使用 `case` 环境：
$ f\(x\)= cases(
  0 #h(1em) x text("为无理数,") ,
  1 #h(1em) x text("为有理数.") 
) $
假如公式里面有个别文字，需要把这部分放在 text 环境里面,即 `text[文本内容]` 。

如果公式中有个别需要加粗的字母，可以使用 `bold()` 进行加粗。如，$alpha a bold(alpha a)$。

以上仅为一些简单的公式示例，更多的公式使用方法可以查看 #link("https://typst.app/docs/reference/math/")[typst/docs/math]

另外，如果需要插入 LaTeX 公式可以使用外部包 #link("https://typst.app/universe/package/mitex")[mitex]。

== 代码

行内代码例 `main()`。

#figure(
```c
#include <stdio.h>
int main()
{
   // printf() 中字符串需要引号
   printf("Hello, World!");
   return 0;
}
```,
  caption: [代码块插入例]
)





= 实验目的和内容
<实验目的和内容>
== 实验目的
<实验目的>
== 实验内容
<实验内容>

= 实验原理
<实验原理>

= 实验环境

+ 台式机2台
+ 交换机2台
+ 路由器2台
+ 网线、配置线若干

= 实验步骤及结果
== 硬件连接

根据拓扑图（如图所示）完成硬件连接

#figure(
  image("pic/01.png", width: 51%),
  caption: [实验拓扑图],
)

= 实验总结和思考
== 实验总结
<实验总结>
== 实验思考
<实验思考>