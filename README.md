# 🚀 NUDT-本科实验报告-Typst模板

![Typst](https://img.shields.io/badge/Built_with-Typst-239BAD)  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🌟 功能特性

- **一键生成封面**：自动生成包含实验名称、学员信息的标准封面
- **四级标题体系**：预置「一、（一）1.（1）」四级标题编号体系
- **多字体支持**：黑体/宋体/仿宋/等宽字体全套解决方案
- **智能排版**：自动处理缩进、行距、页边距等格式细节
- **双模式切换**：支持生成/隐藏填写说明和目录
- **响应式设计**：完美适配本地编译与Typst Web App

## 🛠️ 快速开始

### 本地使用（推荐）

```bash
# 克隆仓库
git clone https://github.com/Lane0218/NUDT-Report-Typst

# 安装字体（Windows双击安装，macOS使用字体册）
cd NUDT-Report-Typst/fonts
安装所有*.ttf字体文件

# 编译文档
typst compile main.typ
```

### 在线使用（备用方案）

1. 访问 [Typst Web App](https://typst.app/)
2. 新建项目后上传本仓库所有文件
3. 手动上传`fonts/`目录下的字体文件
4. 编辑`main.typ`实时预览效果

## 📂 项目结构

```
├── fonts/                # 模板字体库
│   ├── simhei.ttf
│   └── times.ttf...
├── pic/                  # 图片资源目录
├── config.typ            # 全局格式配置
├── main.typ              # 主文档入口
└── README.md             # 说明文档
```

## 📝 使用指南

```typst
// main.typ
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
```

## ⚠️ 已知问题 & 临时解决方案

### 伪粗体缺失问题
当前暂不支持自动伪粗体生成，如需在**正文中实现加粗效果**，请使用以下语法临时切换到**思源宋体**：  
```typst
#text(font: "Source Han Serif")[需要强调的*加粗内容*]
```

### 二级有序列表样式定制
可通过局部设置实现多级列表样式：  
```typst
+ 一级有序列表
+ 一级有序列表
  #set enum(numbering: "(1)",indent: 1pt)
  + 二级有序列表
  + 二级有序列表
+ 一级有序列表
```

## 📚 资源支持

- [Typst官方文档](https://typst.app/docs/)
- [Typst中文交流社区](https://typst-doc-cn.github.io/guide/)