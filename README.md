# Easy-Vim

> 深色冷静系的 Vim 配置

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintenance-⚠️%20Academic-yellow.svg)]()

## ✨ 特性

- 🎨 **TokyoNight 主题** - 深色冷静，护眼高级
- 🔌 **COC 智能补全** - 支持 Python/Go/Rust/JS/TS
- 🐛 **Vimspector 调试** - 断点、单步、变量查看
- 📁 **NERDTree 文件树** - 快速导航项目
- 🔍 **FZF 模糊搜索** - 秒级定位文件
- 🌈 **括号高亮** - rainbow 渐进色，美观清晰
- 🖥️ **半透明支持** - 终端透明背景优化

## 🚀 快速安装

### 一键安装（推荐）

```bash
git clone https://github.com/pingkai-hun/Easy-Vim.git ~/Easy-Vim
cp ~/Easy-Vim/.vimrc ~/.vimrc
vim +PlugInstall +qall

手动安装

    备份原有配置：
    bash

    mv ~/.vimrc ~/.vimrc.bak
    mv ~/.vim ~/.vim.bak

    克隆本仓库：
    bash

    git clone https://github.com/pingkai-hun/Easy-Vim.git ~/.vim
    ln -sf ~/.vim/.vimrc ~/.vimrc

    安装插件：
    bash

    vim +PlugInstall +qall

⌨️ 常用快捷键
快捷键	功能
<leader>n	打开/关闭文件树
<leader>p	模糊搜索文件
<leader>c	注释当前行/选中区域
gd	跳转到定义
K	查看悬浮文档
<F5>	开始调试
<F7>	打开浮动终端
<F8>	打开 Tagbar
<leader>w	保存文件
<leader>q	退出

    <leader> 键为空格键

📦 主要插件
插件	用途
coc.nvim	智能补全 + LSP
tokyonight-vim	TokyoNight 主题
vim-airline	美化状态栏
vimspector	图形化调试
fzf.vim	模糊搜索
NERDTree	文件树
vim-commentary	快速注释
rainbow	括号高亮
vim-floaterm	浮动终端
📫 联系方式与维护说明

    ⚠️ 学业比较紧，开源随缘

本人为在校学生，学业压力较大，无法保证及时响应 Issue 和 Pull Request。

    📧 主邮箱：opmbwdpqr@mozmail.com

    📧 备用邮箱：zhangkai26_9_1@foxmail.com


欢迎 PR，但请理解 review 可能需要时间。感谢理解 🙏
📄 许可证
MIT © pingkai-hun
如果这个配置对你有帮助，欢迎点个 Star ⭐
