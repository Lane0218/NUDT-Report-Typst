# 🚀 NUDT-实验报告Typst模板

![Typst](https://img.shields.io/badge/Built_with-Typst-239BAD) ![License](https://img.shields.io/github/license/Lane0218/NUDT-Report-Typst)

国防科技大学课程实验报告专用Typst模板，提供符合学校规范的格式预设与智能排版能力，助你快速生成专业实验报告！

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
├── fonts/                # 专用字体库
│   ├── SimHei.ttf
│   └── SourceHanSerif.ttf...
├── pic/                  # 图片资源目录
├── config.typ            # 全局格式配置
├── main.typ              # 主文档入口
└── README.md             # 说明文档
```

## ⚙️ 核心配置

### 格式预设

```typst
// config.typ
set page(
  margins: 3cm,
  footer-margin: 2.5cm,
  ...
)

// 标题格式
show heading: it => [
  text(weight: "bold", ..it.body)
]
```

### 文档设置

```typst
// main.typ
#let title = "实验名称"  // 封面标题
#let infos = (          // 学员信息
  姓名: "张三",
  学号: "2023123456",
  单位: "国防科技大学",
)
```

## 📝 使用指南

### 内容编写

```typst
= 实验一：网络协议分析  // 一级标题

== 实验目的            // 二级标题

实验旨在通过...（正文自动首行缩进2字符）

=== 实验设备          // 三级标题
1. 计算机
2. 网络分析仪

==== 注意事项         // 四级标题
• 操作前检查设备
◦ 记录实验数据
```

### 功能开关

```typst
// 关闭填写说明
#let instructions_display = false

// 关闭目录生成
#let outline_display = false
```

## 💡 高级定制

通过修改`config.typ`文件可深度定制：

```typst
// 调整正文字号
set text(size: 14pt)

// 修改标题缩进
show heading.where(level:4): set block(indent: 2em)
```

## 📚 资源支持

- [Typst官方文档](https://typst.app/docs/)
- [中文交流社区](https://typst.cc/)
- [模板问题反馈](https://github.com/Lane0218/NUDT-Report-Typst/issues)

---

💻 **高效科研**，从规范排版开始！使用过程中遇到任何问题，欢迎提交Issue或加入Typst中文社区交流讨论~