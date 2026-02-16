# 删除 Windows AI
## 为什么？
当前的 Windows 11 25H2 版本和未来的版本将包含越来越多的 AI 功能和组件。本脚本旨在删除所有这些功能，以改善用户体验、隐私和安全性。

<img width="150" alt="AI-Explorer-icon" src="https://github.com/zoicware/RemoveWindowsAI/assets/118035521/33efb033-c935-416c-977d-777bb69a3737">


----------------------



### 脚本功能
 - **禁用注册表键** 
   - 禁用 Copilot
   - 禁用 Recall（回忆）
   - 禁用输入洞察和打字数据收集 
   - Edge 中的 Copilot
   - 画图中的图像创建器
   - 删除 AI Fabric 服务
   - 禁用 AI 操作
   - 禁用画图中的 AI
   - 禁用语音访问
   - 禁用 AI 语音效果
   - 禁用设置搜索中的 AI
 - **防止重新安装 AI 包**
   - 安装自定义 Windows 更新包，以防止在 CBS（基于组件的服务）存储中重新安装 AI 包 
 - **禁用 Copilot 策略** 
   - 在 IntegratedServicesRegionPolicySet.json 中禁用与 Copilot 和 Recall 相关的策略
 - **删除 AI Appx 包**
   - 删除所有 AI appx 包，包括 `不可删除` 包和 WindowsWorkload 
 - **删除 Recall 可选功能**
 - **删除 CBS 中的 AI 包**
   - 这将删除 CBS（基于组件的服务）存储中隐藏和锁定的 AI 包 
 - **删除 AI 文件**
   - 这将执行完整的系统清理，删除所有剩余的 AI 安装程序、注册表键和包文件 
 - **隐藏 AI 组件**
   - 这将隐藏设置页面 `AI 组件` 
 - **禁用记事本中的 AI 重写功能**
 - **删除 Recall 任务**
   - 强制删除所有 Recall 的计划任务实例

 - #### 安装经典应用
   - 这些选项允许您将现代的充满 AI 的应用程序替换为其经典版本
   - **选项：** 替换记事本、画图、截图工具、照片查看器，并安装传统照片应用
 
#### 手动禁用 AI
- 不幸的是，并非所有功能和设置都可以通过脚本禁用。本指南将展示需要手动禁用的其他 AI 功能。
> **[禁用其他 AI 功能](https://github.com/zoicware/RemoveWindowsAI/blob/main/OtherAIFeatures.md)**
  
### 在此阅读脚本文档
  > **[文档](https://github.com/zoicware/RemoveWindowsAI/blob/main/Documentation.md)**

  > [!WARNING]
  > 某些第三方杀毒软件会错误地将脚本检测为恶意软件，这显然是误报，需要临时禁用杀毒软件或将脚本设置为排除项。
  >
  > 由于对系统进行高级更改的性质，许多精简工具/脚本会被误报为恶意软件...如果您对脚本不确定，我总是建议先在虚拟机中测试任何软件

---


 ### 如何使用
 
 #### 以管理员身份从 Powershell 控制台运行
 ---

 > [!WARNING]
 > 不再支持使用 PowerShell 7 运行脚本，这将导致问题，为避免这种情况，请确保您运行的是 Windows PowerShell (5.1)
 >

 ### 使用 UI 启动
 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1")))
 ```
 ### 简洁命令：
 ##### 使用开源链接缩短器缩短的链接：https://kutt.it/
 ```PowerShell
 & ([scriptblock]::Create((irm 'https://kutt.it/RWAI')))
 ```



 <details>  
  <summary>点击查看 UI</summary>
  <img width="586" height="693" alt="Capture2" src="https://github.com/user-attachments/assets/fa105ba5-c1dc-447c-ae2e-7ee373291042" />
  <img width="586" height="693" alt="Capture2" src="https://github.com/user-attachments/assets/8a446a23-7c47-468e-856b-1e783205c511" />
</details>

&nbsp;

### 命令行选项

**使用所有选项以非交互模式运行**
 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -AllOptions
 ```

--- 

**使用特定选项运行示例**
 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -Options DisableRegKeys,RemoveAppxPackages,DisableCopilotPolicies 
 ```

**所有可能的选项：**
```
DisableRegKeys          
PreventAIPackageReinstall     
DisableCopilotPolicies       
RemoveAppxPackages        
RemoveRecallFeature 
RemoveCBSPackages         
RemoveAIFiles               
HideAIComponents            
DisableRewrite      
RemoveRecallTasks
```

**运行安装经典应用**
 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -InstallClassicApps photoviewer,mspaint,snippingtool,notepad  
 ```

**所有可能的选项：**
```
photoviewer          
mspaint     
snippingtool       
notepad        
photoslegacy 
```


**Run with Backup Mode Enabled**

> [!NOTE]
> Backup Mode needs to be enabled to be able to fully revert
> 
 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -backupMode -AllOptions
 ```

---

**Revert Changes**

 ```PowerShell
 & ([scriptblock]::Create((irm "https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1"))) -nonInteractive -revertMode -AllOptions
 ```

---

### Updates

Given that Microsoft are continually updating and adding new AI features this script will attempt to stay updated for the newest stable build.

You can view the newest updates to the script here:
https://github.com/zoicware/RemoveWindowsAI/commits/main/

 > [!NOTE]  
> Any feature added to an Insider build will not be added to this script till it's added to the latest stable release

 
> [!TIP]
> **Submitting an AI Feature**
>
> If you find an AI feature or registry key that is not currently removed or disabled by the script submit an issue with as much information as possible and I will add it to the script.


### 捐赠 

如果您想支持我的工作，请考虑捐赠 :)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/zoicware)


### 加入 Discord

[![Discord](https://discordapp.com/api/guilds/1173717737017716777/widget.png?style=banner1)](https://discord.gg/VsC7XS5vgA)


### YouTube 指南
#### [如何删除所有 Windows AI 功能](https://youtu.be/j5_eEBWGHFw)

















