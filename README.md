# AeroSpace 配置指南

一个为 macOS 极客量身定制的平铺式窗口管理器配置，灵感来自 i3wm，让你的工作流如丝般顺滑。

## 核心特性

- **零边距极简布局**：窗口之间无缝拼接，最大化屏幕利用率
- **语义化工作区命名**：8 个常驻工作区，名称即用途（Browser/Code/Terminal/Debug/Chat/Music/Other/Tmp）
- **智能应用自动归类**：打开应用自动跳到指定工作区，无需手动拖拽
- **多显示器友好**：支持跨显示器移动窗口，焦点自动跟随

## 快捷键映射

### 窗口导航 (Alt + hjkl)
```
Alt+h  左   Alt+j  下
Alt+k  上   Alt+l  右
```

### 窗口操作
- `Alt+Shift+hjkl` — 移动窗口到对应方向
- `Alt+-` / `Alt+=` — 智能调整窗口大小
- `Alt+Slash` — 切换 tiles 布局方向
- `Alt+Comma` — 切换 accordion 布局

### 工作区管理
- `Alt+1~6` — 切换到 Browser/Code/Terminal/Debug/Chat/Music 工作区
- `Alt+O` — 切换到 Other 工作区
- `Alt+T` — 切换到 Tmp 临时工作区
- `Alt+Shift+1~6` — 移动当前窗口到对应工作区
- `Alt+Shift+O` — 移动当前窗口到 Other 工作区
- `Alt+Shift+T` — 移动当前窗口到 Tmp 工作区
- `Alt+Tab` — 返回上一个工作区

### 多显示器
- `Alt+[` / `Alt+]` — 焦点切换到上/下一个显示器
- `Alt+Shift+[` / `Alt+Shift+]` — 移动窗口到上/下一个显示器

### 服务模式 (`Alt+Shift+;` 进入)
- `R` — 重置布局(扁平化容器树)
- `F` — 切换浮动/平铺模式
- `Esc` — 重载配置并退出
- `Backspace` — 关闭除当前窗口外的所有窗口
- `Alt+Shift+hjkl` — 将当前窗口与相邻窗口合并(父容器)

## 工作区规划

| 工作区 | 用途 | 自动归类应用 |
|--------|------|--------------|
| **1-Browser** | 主浏览器 | Chrome (bingb) |
| **2-Code** | 开发 IDE | VSCode, Cursor, IntelliJ, PyCharm, WebStorm, Zed |
| **3-Terminal** | 终端 | Terminal, Alacritty |
| **4-Debug** | 调试工具 | - |
| **5-Chat** | 通讯工具 | 微信(主窗口平铺,其他浮动), Telegram |
| **6-Music** | 音乐 | Apple Music |
| **Other** | 其他浏览器 | 115浏览器, Chrome (hub) |
| **Tmp** | 临时工作区 | - |

## 微信特殊处理

微信主窗口自动平铺在 `5-Chat` 工作区，但聊天窗口、设置等非主窗口自动浮动，避免遮挡其他应用。

## 禁止平铺的应用

以下应用强制使用浮动布局，不参与平铺：

- **Quantumult X** — 网络工具类应用保持浮动，方便随时查看和操作

**添加方法**：在 `aerospace.toml` 的 `on-window-detected` 部分添加：

```toml
[[on-window-detected]]
    if.app-id = 'com.example.app'
    run = 'layout floating'
```

## 配置文件
[./aerospace.toml](https://github.com/cbingb666/aerospace-dotfile/blob/main/aerospace.toml)

## 查询所有应用的

**see**: [commad/list-app](https://nikitabobko.github.io/AeroSpace/commands#list-apps)

`aerospace list-apps --format "%{app-name} | %{app-bundle-id}"`

## 参考资源

- [AeroSpace 官方仓库](https://github.com/nikitabobko/AeroSpace)
- [AeroSpace 官方指南](https://nikitabobko.github.io/AeroSpace/guide)
- [命令完整列表](https://nikitabobko.github.io/AeroSpace/commands)

---

*让 macOS 像真正的操作系统一样工作。*
