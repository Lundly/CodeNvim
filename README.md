<div align="center">
    <h1>𝓒𝓸𝓭𝓮𝓝𝓿𝓲𝓶</h1>
    <div>
        <a href="#使用"><img alt="Static Badge" src="https://img.shields.io/badge/readme-a?style=for-the-badge&logo=opencode&logoColor=%23111111&label=CodeNvim&labelColor=%23eeeeee&color=%232d343a"></a>
        <a href="https://neovim.io/"><img alt="Static Badge" src="https://img.shields.io/badge/code-a?style=for-the-badge&logo=neovim&logoColor=%2377be64&label=neovim&labelColor=%23424c51&color=%23829f94"></a>
        <a href="https://www.lazyvim.org/"><img alt="Static Badge" src="https://img.shields.io/badge/reference-a?style=for-the-badge&logo=lazyvim&logoColor=%23c1d2ea&label=lazyvim&labelColor=%23302d41&color=%23c9cbff"></a>
    </div>
</div>

我的Neovim配置，一些简单的编辑器功能配置。

- 参考：[LazyVim](https://www.lazyvim.org/)
- Neovim >= 0.11.2

## 使用

```
# Backup
mv ~/.config/nvim{,.bak}

mv ~/.local/share/nvim{,.bak}

mv ~/.local/state/nvim{,.bak}

mv ~/.cache/nvim{,.bak}
```

使用配置
```
git clone ~/.config/nvim
nvim
```

## 结构

```
nvim
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   ├── plugins/
│   └── core/
└── README.md
```

> AI 冲击的时代，Neovim还有必要吗？
> 
> 简单的编辑器，看看文件，挺好的。

