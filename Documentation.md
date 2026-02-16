## 删除 Windows AI 文档
---
### 操作系统支持

- 该脚本适用于任何版本的 Windows 10 和 Windows 11 最新稳定版本
- 为获得最佳效果，请使用专业版、企业版、服务器版或教育版。我无法保证家庭版能 100% 删除
  - 如果您使用的是家庭版并想转换为专业版，我推荐使用 massgrave：https://github.com/massgravel/Microsoft-Activation-Scripts
> [!NOTE]
> 该脚本可在内部预览版上运行，但是，添加到内部预览版的任何新 AI 功能都不会添加到脚本中，直到它们在最新稳定版本中发布
>

---

### 代码审查

- 鉴于微软真的不希望用户删除所有 AI 功能，该脚本在 PowerShell 中使用了一些高级技术

#### Run-Trusted 函数

- 此函数利用了一个漏洞，允许在 `TrustedInstaller.exe` 服务（也称为 `Windows 模块安装程序`）下执行代码
  - 各种 PowerShell 命令将在用户看不到的情况下运行，允许脚本删除通过系统权限锁定的项目和包
 
#### 注册表键
- 我收集了有关 AI 禁用的所有注册表键，包括记事本、画图和 Edge。
  - 其中一些是组策略，所以如果您看到任何 AI 功能设置变灰并显示消息 `某些设置由您的组织管理`，这就是原因
 
#### 防止重新安装 AI 包
- 此选项将安装自定义 Windows 更新包，使 Windows 认为已经安装了较新版本的 AI 包。
- 来自 Atlas 和 Revi OS 的方法，因为它们使用这些方法

#### 在 IntegratedServicesRegionPolicySet 中禁用 Copilot
- 此 JSON 文件包含根据您的区域决定是否启用某些应用程序和设置的规则
  - 这主要用于 EEA [欧洲经济区]
- 脚本会找到所有与 Copilot 相关的策略，并将默认状态设置为禁用


#### Appx 包删除
- 虽然主 Copilot 包可以在不使用任何特殊技巧的情况下删除（Remove-AppxPackage），但大多数 AI 包被标记为 `不可删除`，因此，脚本需要使用多个漏洞来删除这些包
 - 脚本在 `%TEMP%` 中创建一个子脚本，在上述函数 `Run-Trusted` 下运行
   - **执行的漏洞利用**
     
     - **生命周期结束**：欺骗 Windows 认为可以删除锁定包的一种方法是将其包系列名称添加到 `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\USERSID`
       - 为避免 Windows 更新失败，一旦确认卸载包，这些注册表条目就会被删除
     - **取消配置**：这会将包系列名称添加到 `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned`，这将防止 Windows 更新重新安装该包
     - **Set-NonRemovableAppsPolicy**：此 dism 命令将尝试删除上述 `不可删除` 属性，需要系统权限才能工作
     - **删除收件箱应用**：某些包被标记为 `InboxApps`，这会阻止用户删除它们，但是，当通过 Run-Trusted 从 `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications` 中删除包时，Windows 将不再将其识别为收件箱应用

#### Recall 可选功能
- 在大多数系统上，Recall 将通过可选功能安装，脚本将禁用并删除它，导致状态为：`DisabledWithPayloadRemoved`

#### 隐藏的 AI CBS 包
- Windows CBS [基于组件的服务] 包含 Windows 包，其中一些可以通过 `get-windowspackage` 和 `remove-windowspackage` 分别查看和删除
  - 默认情况下，大多数包对 dism 命令不可见，因此需要一些技巧来启用此功能并允许删除
- 脚本将在 `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages` 中搜索包含各种 AI 关键字的包
  - 要启用可视化并允许删除，需要将 `Visibility` 键设置为 1，并且需要删除子键 `Owners` 和 `Updates`
 
#### 删除 AI 文件和文件夹
- 脚本将强制删除 Appx 包安装位置，删除机器学习 DLL 和隐藏的 Copilot 安装程序。
- 此外，还会删除各种其他注册表键和文件，以确保正确清理 AI 功能

#### 在记事本中禁用重写
- 有两种方法可以做到这一点，第一种方法是将 settings.dat 文件从记事本的 appdata 目录加载到注册表中，并将 `RewriteEnabled` 键设置为 false
- 后来微软添加了一个更简单的策略来禁用此功能，脚本执行两种方法以确保其被禁用

#### 删除 Recall 计划任务
- 这将在 `%TEMP%` 中创建另一个子脚本，以便以系统权限运行
  - 脚本将通过删除文件以及注册表条目来积极删除 Recall 的计划任务
 
#### 安装经典应用
- 这将允许您替换/安装记事本、画图、照片查看器和传统照片应用（uwp 商店应用）的经典版本
  - 存储库中的画图和截图工具文件是从 Windows Server 2025 ISO 中提取的，因为服务器的桌面体验版使用这些经典应用
