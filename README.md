# AeroSpace 个人配置

这是我的个人 [AeroSpace](https://github.com/nikitabobko/AeroSpace) 配置。主要包含：

- **工作区管理**：9 个工作区，支持快速切换和窗口移动
- **多显示器支持**：快捷键在显示器间移动窗口和焦点
- **浮动窗口**：可绑定快捷键将应用窗口定义为任意工作区随时呼出的浮动窗口
- **键位**：使用 `alt` 作为主要修饰键，支持方向键导航、窗口移动和布局调整
- **零间隙布局**：无边框设计，最大化屏幕利用率

## 目录结构

```
.
├── aerospace.toml    # 主配置文件
├── README.md         # 本说明文档
└── toggle-float.sh   # 浮动窗口切换脚本
```


## 将应用配置为任意工作区的浮动窗口

**场景**: 当希望某个应用在所有工作区都以浮动窗口形式打开时（如终端、AI 助手等），可配置 `on-window-detected` 回调。

**配置步骤**:

1. **获取应用的 Bundle ID**
   ```bash
   aerospace list-apps --format "%{app-name} | %{app-bundle-id}"
   ```

2. **在 `aerospace.toml` 中添加配置**
   ```toml
   [[on-window-detected]]
       if.app-id = 'com.example.appname'
       run = ['layout floating']
   ```

**示例配置**（已包含在配置中）:
```toml
# Ghostty 终端
[[on-window-detected]]
    if.app-id = 'com.mitchellh.ghostty'
    run = ['layout floating']

# OpenCode AI 助手
[[on-window-detected]]
    if.app-id = 'ai.opencode.desktop'
    run = ['layout floating']
```

**相关快捷键**:
- `alt-j` - 在当前工作区快速切换 Ghostty 浮动窗口
- `alt-i` - 在当前工作区快速切换 OpenCode 浮动窗口

**文档参考**: [on-window-detected 回调](https://nikitabobko.github.io/AeroSpace/guide#on-window-detected-callback)

## 查询所有应用的

**see**: [commad/list-app](https://nikitabobko.github.io/AeroSpace/commands#list-apps)

`aerospace list-apps --format "%{app-name} | %{app-bundle-id}"`

## 参考资源

- [AeroSpace 官方仓库](https://github.com/nikitabobko/AeroSpace)
- [AeroSpace 官方指南](https://nikitabobko.github.io/AeroSpace/guide)
- [命令完整列表](https://nikitabobko.github.io/AeroSpace/commands)
