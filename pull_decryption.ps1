$ErrorActionPreference = "Stop"
$ADB = "C:\Users\haiyan\Downloads\platform-tools\adb.exe"

Write-Host "===================="
Write-Host "Nezha 解密组件提取脚本"
Write-Host "===================="

# 检查设备连接
$devices = & $ADB devices
if ($devices -notmatch "device`r?`n") {
    Write-Host "[错误] 找不到连接的设备，请插入手机并确保开启了 USB 调试！" -ForegroundColor Red
    exit
}

Write-Host "[!] 正在请求 Root 权限，请留意手机屏幕并点击允许..." -ForegroundColor Yellow
& $ADB shell su -c "echo 'Root granted'"

$rootDir = "c:\Users\haiyan\Downloads\twrp_device_xiaomi_sm8750_thales-twrp-16.0\twrp_device_xiaomi_sm8750_thales-twrp-16.0\recovery\root"

# 要提取的文件列表 (手机绝对路径 -> 本地相对路径)
$filesToPull = @(
    # ODM 组件
    @{ Source="/odm/bin/hw/android.hardware.security.keymint-service.strongbox"; Dest="$rootDir\odm\bin\hw\" },
    @{ Source="/odm/bin/hw/android.hardware.weaver-service"; Dest="$rootDir\odm\bin\hw\" },
    @{ Source="/odm/bin/se_omapi"; Dest="$rootDir\odm\bin\" },
    @{ Source="/odm/lib64/ese_weaver_thales.so"; Dest="$rootDir\odm\lib64\" },
    @{ Source="/odm/lib64/libjc_keymint-thales.so"; Dest="$rootDir\odm\lib64\" },
    @{ Source="/odm/lib64/libjc_keymint_transport-thales.so"; Dest="$rootDir\odm\lib64\" },
    
    # Vendor 组件
    @{ Source="/vendor/bin/hw/android.hardware.gatekeeper-service-qti"; Dest="$rootDir\vendor\bin\hw\" },
    @{ Source="/vendor/bin/hw/android.hardware.security.keymint-service-qti"; Dest="$rootDir\vendor\bin\hw\" },
    @{ Source="/vendor/bin/qseecomd"; Dest="$rootDir\vendor\bin\" },
    @{ Source="/vendor/lib64/hw/libqtigatekeeper.so"; Dest="$rootDir\vendor\lib64\hw\" }
)

Write-Host "`n[开始提取文件]" -ForegroundColor Cyan
foreach ($file in $filesToPull) {
    $src = $file.Source
    $dst = $file.Dest
    
    # 确保存放的文件夹存在
    if (-Not (Test-Path $dst)) {
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
    }

    Write-Host "-> 复制 $src"
    # 先用 su 复制到 /sdcard 作为中转，因为直接 pull /odm, /vendor 可能权限不足
    $tempFile = "/sdcard/Download/temp_pull_" + ($src -replace "/", "_")
    & $ADB shell su -c "cp $src $tempFile && chmod 666 $tempFile"
    
    # 本地执行 pull
    $fileName = Split-Path $src -Leaf
    & $ADB pull $tempFile "$dst\$fileName" | Out-Null
    
    # 清理手机上的中转文件
    & $ADB shell rm $tempFile
}

Write-Host "`n===================="
Write-Host "🎉 提取完成！" -ForegroundColor Green
Write-Host "所有所需文件已经覆盖到 recovery/root 目录下。"
Write-Host "你可以执行 git status 确认修改，然后 commit 并推送了！"
