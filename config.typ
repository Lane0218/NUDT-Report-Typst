#import "@preview/indenta:0.0.3": fix-indent

#let project(
  title: "",
  author: "",

  infos: (
  ),

  instructions_display: true,
  outline_display: true,
  
  body
) = {
  // ================== 全局样式设置开始 ==================
  // 字体类型
  let english_font = "Times New Roman"
  let code_font = "DejaVu Sans Mono"
  let equation_font="New Computer Modern Math"
  let siyuan_songti = "Source Han Serif"
  let siyuan_heiti="Source Han Sans"
  let fangsong="FangSong"
  let songti = "SimSun"
  let heiti = "SimHei"
   
  // 设置文档元数据和参考文献格式
  set document(author: author, title: title)
  set bibliography(style: "gb-7714-2015-numeric")
  
  // 页面设置
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 3cm, top: 3cm, bottom: 3cm),
  )
  // 段落设置
  set par(leading: 1.5em,first-line-indent: 2em, justify: true,spacing: 1.5em)

  // 字体设置
  set text(
    font: (english_font, songti), // 英文优先 Times，中文用宋体
    size: 12pt,                   // 相当于 Word 小四号字
    lang: "zh", 
    region: "cn"
  )

  // 代码字体设置
  show raw: set text(font: (code_font,songti), 10.5pt)

  // 四级标题全局设置
  set heading(numbering: (..args) => {
    let nums = args.pos()
    let level = nums.len() - 1
    let label = ("一、", "(一)", "1.", "(1)").at(level)
    let indents = (0em, 0.5em, 1em, 1em).at(level)
    let fsize = (14pt, 12pt, 12pt, 12pt).at(level)
    [#h(indents)#numbering(label, nums.at(level))]
  })

  // 逐级设置字体字号
  show heading.where(level: 1): it => {
    set text(font: heiti, size: 14pt)  // 一级标题：黑体四号
    it
    v(10pt)
  }
  show heading.where(level: 2): it => {
    set text(font: heiti, size: 12pt)  // 二级标题：黑体小四
    it
    v(10pt)
  }
  show heading.where(level: 3): it => {
    set text(font: heiti, size: 12pt)  // 三级标题：黑体小四
    it
    v(10pt)
  }
  show heading.where(level: 4): it => {
    set text(font: songti, size: 12pt)  // 四级标题：黑体小四
    it
    v(10pt)
  }

  // 无序列表
  set list(indent: 1em, marker: ([•], [◦], [•], [◦]))
  // 有序列表
  set enum(indent: 1em)
    // set enum(numbering: "(1)",indent: 1pt)

  // 表格标题样式
  show figure.caption: it => {
    set text(size: 10.5pt)
    box(it)
  }

  // 配置公式的编号、间距
  set math.equation(numbering: "(1.1)")
  show math.equation: eq => {
    set block(spacing: 2em)
    set text(font: (equation_font,songti))
    eq
  }

  // 配置图表的间距
  show figure: it => [
    #v(4pt)
    #it
    #v(4pt)
  ]

  // 配置行间代码块样式
  show figure.where(
    kind: raw
  ): it => {
    set block(width: 100%, breakable: true)
    it
  }

  // 配置行内代码块样式
  show raw.where(block: false): it => box(fill: luma(240), inset: (x: 2pt), outset: (y: 3pt), radius: 1pt)[#it]

  // 配置行间代码块样式
  show raw.where(block: true): it => block(width: 100%, fill: luma(240), inset: 10pt, radius: 3pt, breakable: true)[#it]

  // 设置表格的题目显示在表格上方
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // ================== 全局样式设置结束 ==================

  // ===================== 封面开始 ======================
  v(130pt)
  block(width: 100%, below: 130pt)[
    #set align(center)
    #text(
      size: 30pt,
      font: siyuan_songti,
      weight: "bold",
      tracking: 1em // 控制字间距
    )[本科实验报告] 
  ]

  // 实验名称
  align(center)[
    #grid(
      columns: (80pt, 320pt),
      align(right + top)[
        #text(size: 17pt)[实验名称：]
      ],
      grid(
        rows: (18pt, auto),
        text(size: 17pt)[#title],
        line(length: 100%, stroke: 0.5pt)
      )
    )
  ]

  // 定义显示实验报告信息的函数
  let underlineField(key1, value1,key2, value2) = [
    #set align(center)
      #grid(
        columns: (65pt, 85pt, 70pt, 130pt), // 四列布局：标签+内容+标签+内容
        column-gutter: 10pt, // 列间距
        // 左侧栏
        align(right + top)[
          #text(size: 15pt)[#key1]
        ],
        grid(
          rows: (10pt, 15pt),
          text(size: 15pt)[#value1],
          line(length: 100%, stroke: 0.5pt)
        ),
        // 右侧栏
        align(right + top)[
          #text(size: 15pt)[#key2]
        ],
        grid(
          rows: (10pt, 15pt),
          text(size: 15pt)[#value2],
          line(length: 100%, stroke: 0.5pt)
        )
      )
    ]
  // 显示实验报告信息
  block(width: 100%, above: 105pt)[
    #set align(center + horizon)
    #let length=infos.len()
    #for i in range(0,length - 1, step: 2){
      underlineField(infos.at(i).key, infos.at(i).value,infos.at(i+1).key, infos.at(i+1).value)
      v(-7pt)
    } 
  ]

  block(width: 100%, above: 95pt)[
    #set align(center)
    #text(
      size: 15pt,
      font: siyuan_songti,
      weight: "bold",
    )[国防科技大学训练部制]
  ]

  pagebreak()

  // ===================== 封面结束 ======================

  // ==================== 填写说明开始 =====================
  if instructions_display{
    v(4pt)
    block(width: 100%)[
      #set align(center)
      #text(
        size: 14pt,
        font: siyuan_heiti,
      )[《实验报告》填写说明] 
    ]
    v(40pt)
    block(width: 100%)[
      #set align(left)
      #text(
        size: 12pt,
        font: songti,
      )[
        #set par(leading: 1em,justify: true,spacing: 1.6em)
        + 学员完成人才培养方案和课程标准所要求的每个实验后，均须提交实验报告。

        + 实验报告无需打印，电子版上传EDUCODER。

        + 实验报告内容编排及打印应符合以下要求：
          #set enum(numbering: "（1）",indent: 1pt)
          #set text(font: fangsong)
          #set par(leading: 1em,justify: true,spacing: 1.3em)

          + 上下左右各侧的页边距均为3cm；缺省文档网格：字号为小4号，中文为宋体，英文和阿拉伯数字为Times New Roman，每页30行，每行36字；页脚距边界为2.5cm，页码置于页脚、居中，采用小5号阿拉伯数字从1开始连续编排，封面不编页码。

          + 报告正文最多可设四级标题，字体均为黑体，第一级标题字号为4号，其余各级标题为小4号；标题序号第一级用“一、”“二、”……，第二级用“（一）”“（二）” ……，第三级用“1.”“2.” ……，第四级用“（1）”“（2）” ……，分别按序连续编排。

          + 正文插图、表格中的文字字号均为5号。
      ] 
    ]
    pagebreak()
  }
  // ==================== 填写说明结束 =====================

  // ===================== 目录开始 ======================
  if outline_display{
    v(4pt)
    block(width: 100%)[
      #set align(center)
      #text(
        size: 14pt,
        font: siyuan_heiti,
        tracking: 3em
      )[目录] 
    ]
    v(40pt)
    set text(font: heiti)
    outline(title: none,indent: 1em,depth: 2)
    pagebreak()
  }
  // ===================== 目录结束 ======================


  // 显示页码
  counter(page).update(1)
  set page(numbering: "1",footer-descent: 17%)

  // 解决标题后首行无法缩进的问题
  show: fix-indent()

  body
}