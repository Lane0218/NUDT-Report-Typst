#import "config.typ": *

#show: project.with(
  title: "基于猫和老鼠行为学数据的实证分析",
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
= 使用示例 <example>

== 特殊标记 <bug1>

你可以使用 Typst 的语法对文本进行特殊标记，我们为如下标记设定了样式：


- #text(font: "Source Han Serif")[需要强调的*内容*]
- 引用 @example
- `raw text` 

== 图片

图片插入示例：

#figure(
  image("./pic/01.jpg",  width: 60%),
  caption: [
    风车车在读报纸
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

其次是行间公式，例如：$ integral.triple_(Omega)\(frac(diff P, diff x) + frac(diff Q, diff y) + frac(diff R, diff z)\)d v = integral.surf_(Sigma)P d y d z + Q d z d x + R d x d y $ 式(1)是高斯公式。行间公式使用 `$$` 环境包裹，公式和两端的 `$$` 之间至少有一个空格。

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

如果公式里面有个别文字，需要把这部分放在 text 环境里面,即 `text[文本内容]` 。

如果公式中有个别需要加粗的字母，可以使用 `bold()` 进行加粗。如，$alpha a bold(alpha a)$。



另外，如果需要插入 LaTeX 公式可以使用外部包 #link("https://typst.app/universe/package/mitex")[mitex]。

== 代码

行内代码例 `main()`。

#figure(
```c
#include <stdio.h>
int main()
{
   printf("Hello, World!");   // printf() 中字符串需要引号
   return 0;
}
```,
  caption: [代码块插入示例]
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



= 实验步骤及结果

= 实验总结和思考
== 实验总结
<实验总结>
== 实验思考
<实验思考>