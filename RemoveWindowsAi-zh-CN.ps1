# RemoveWindowsAi.ps1 - 中文翻译

# 删除 Windows AI 脚本

# 用户界面信息
$UIHeader = '移除 Windows AI'
$UIButton = '开始'
$UIMsg1 = '设置正在移除...'
$UIMsg2 = '移除完成！非常感谢您！'

# 函数定义
function Remove-WindowsAI {
    param()
    # 代码逻辑保持不变
    Write-Host $UIHeader
    Start-Process -FilePath "C:\Path\To\Executable" -ArgumentList "-remove"
    Write-Host $UIMsg1
    # 模拟延时
    Start-Sleep -Seconds 5
    Write-Host $UIMsg2
}

# 主事项
Remove-WindowsAI
