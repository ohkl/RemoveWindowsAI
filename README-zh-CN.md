# RemoveWindowsAI 中文版

这是 RemoveWindowsAI 的完整中文汉化版本。

## 文件说明

- `RemoveWindowsAi-zh-CN.ps1` - 完整的中文版主脚本
- 所有用户界面、提示信息、错误消息均已翻译为中文
- 保持与原版完全相同的功能

## 使用方法

```powershell
# 以管理员权限运行 PowerShell 5.1,然后执行:
.\RemoveWindowsAi-zh-CN.ps1

# 或使用非交互模式:
.\RemoveWindowsAi-zh-CN.ps1 -AllOptions -backupMode
```

## 主要功能

1. **禁用注册表项** - 通过注册表修改禁用 Copilot 和 Recall
2. **防止AI包重新安装** - 安装自定义 Windows 更新包
3. **禁用 Copilot 策略** - 修改系统策略文件
4. **移除 AppX 包** - 删除 AI 相关应用包
5. **移除 Recall 功能** - 完全删除 Recall 可选功能
6. **移除 CBS 包** - 删除隐藏的 AI 组件
7. **移除 AI 文件** - 删除系统中的 AI 相关文件
8. **隐藏 AI 组件** - 在设置中隐藏 AI 选项
9. **禁用重写功能** - 禁用记事本的 AI 重写功能
10. **移除 Recall 任务** - 删除计划任务

## 注意事项

- 必须使用 Windows PowerShell 5.1 (powershell.exe)
- 需要管理员权限
- 建议使用备份模式以便还原