@echo off
setlocal enabledelayedexpansion
set ADB=C:\Users\haiyan\Downloads\platform-tools\adb.exe
set ROOT_DIR=%~dp0recovery\root
set TMP=/data/local/tmp/_pull
set FOUND=0
set NOTFOUND=0

echo ============================================
echo  Nezha Full Binary Extraction Script
echo ============================================
echo.
echo [INIT] Requesting Root and creating temp dir...
"%ADB%" shell su -c "mkdir -p %TMP%"

echo.
echo ===== ODM binaries =====

call :PULL "/odm/bin/hw/android.hardware.security.keymint-service.strongbox-thales" "odm\bin\hw"
call :PULL "/odm/bin/hw/android.hardware.weaver-service" "odm\bin\hw"
call :PULL "/odm/bin/hw/android.hardware.weaver-service.thales" "odm\bin\hw"
call :PULL "/odm/bin/hw/vendor.xiaomi.hardware.vibratorfeature.service" "odm\bin\hw"
call :PULL "/odm/bin/se_omapi" "odm\bin"
call :PULL "/odm/bin/touch_report" "odm\bin"

echo.
echo ===== ODM lib64 =====

call :PULL "/odm/lib64/ese_weaver_thales.so" "odm\lib64"
call :PULL "/odm/lib64/libjc_keymint-thales.so" "odm\lib64"
call :PULL "/odm/lib64/libjc_keymint_transport-thales.so" "odm\lib64"
call :PULL "/odm/lib64/libtensorflowlite_touch_c.so" "odm\lib64"

echo.
echo ===== Vendor binaries =====

call :PULL "/vendor/bin/cnss-daemon" "vendor\bin"
call :PULL "/vendor/bin/hw/android.hardware.boot-service.qti" "vendor\bin\hw"
call :PULL "/vendor/bin/hw/android.hardware.gatekeeper-rust-service-qti" "vendor\bin\hw"
call :PULL "/vendor/bin/hw/android.hardware.health-service.qti" "vendor\bin\hw"
call :PULL "/vendor/bin/hw/android.hardware.secure_element-service.qti" "vendor\bin\hw"
call :PULL "/vendor/bin/hw/android.hardware.security.onekeymint-service-qti" "vendor\bin\hw"
call :PULL "/vendor/bin/pd-mapper" "vendor\bin"
call :PULL "/vendor/bin/pm-proxy" "vendor\bin"
call :PULL "/vendor/bin/pm-service" "vendor\bin"
call :PULL "/vendor/bin/qrtr-ns" "vendor\bin"
call :PULL "/vendor/bin/qseecomd" "vendor\bin"
call :PULL "/vendor/bin/rmt_storage" "vendor\bin"
call :PULL "/vendor/bin/ssgtzd" "vendor\bin"
call :PULL "/vendor/bin/wpa_supplicant" "vendor\bin"

echo.
echo ===== Vendor lib64 (key security libs) =====

call :PULL "/vendor/lib64/hw/libqtigatekeeper.so" "vendor\lib64\hw"
call :PULL "/vendor/lib64/hw/libEseUtils.so" "vendor\lib64\hw"
call :PULL "/vendor/lib64/libQSEEComAPI.so" "vendor\lib64"
call :PULL "/vendor/lib64/libGPTEE_vendor.so" "vendor\lib64"
call :PULL "/vendor/lib64/libGPMTEEC_vendor.so" "vendor\lib64"
call :PULL "/vendor/lib64/libGPQeSE.so" "vendor\lib64"
call :PULL "/vendor/lib64/libGPreqcancel.so" "vendor\lib64"
call :PULL "/vendor/lib64/libGPreqcancel_svc.so" "vendor\lib64"
call :PULL "/vendor/lib64/lib_android_keymaster_keymint_utils.so" "vendor\lib64"
call :PULL "/vendor/lib64/libdrmfs.so" "vendor\lib64"
call :PULL "/vendor/lib64/libdrmtime.so" "vendor\lib64"
call :PULL "/vendor/lib64/libkeymasterdeviceutils.so" "vendor\lib64"
call :PULL "/vendor/lib64/libkeymasterprovision.so" "vendor\lib64"
call :PULL "/vendor/lib64/libkeymasterutils.so" "vendor\lib64"
call :PULL "/vendor/lib64/libqcbor.so" "vendor\lib64"
call :PULL "/vendor/lib64/libqisl.so" "vendor\lib64"
call :PULL "/vendor/lib64/librpmb.so" "vendor\lib64"
call :PULL "/vendor/lib64/libseccam.so" "vendor\lib64"
call :PULL "/vendor/lib64/libsecureui.so" "vendor\lib64"
call :PULL "/vendor/lib64/libsecureui_svcsock.so" "vendor\lib64"
call :PULL "/vendor/lib64/libssd.so" "vendor\lib64"
call :PULL "/vendor/lib64/libdiag.so" "vendor\lib64"
call :PULL "/vendor/lib64/libconfigdb.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.security.keymint-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.security.keymint-V3-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.security.secureclock-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.security.sharedsecret-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.security.rkp-V3-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.gatekeeper-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.weaver-V2-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.secure_element-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.secure_element@1.0.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.secure_element@1.1.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.secure_element@1.2.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.se.omapi-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.system.keystore2-V1-ndk.so" "vendor\lib64"
call :PULL "/vendor/lib64/libcppbor.so" "vendor\lib64"
call :PULL "/vendor/lib64/libcppbor_external.so" "vendor\lib64"
call :PULL "/vendor/lib64/libcppcose_rkp.so" "vendor\lib64"
call :PULL "/vendor/lib64/libboot_control_qti.so" "vendor\lib64"
call :PULL "/vendor/lib64/libdmabufheap.so" "vendor\lib64"
call :PULL "/vendor/lib64/libdrm.so" "vendor\lib64"
call :PULL "/vendor/lib64/libion.so" "vendor\lib64"
call :PULL "/vendor/lib64/libnos.so" "vendor\lib64"
call :PULL "/vendor/lib64/libnl.so" "vendor\lib64"
call :PULL "/vendor/lib64/libqmi_cci.so" "vendor\lib64"
call :PULL "/vendor/lib64/libqmi_common_so.so" "vendor\lib64"
call :PULL "/vendor/lib64/libqmi_encdec.so" "vendor\lib64"
call :PULL "/vendor/lib64/android.hardware.nfc-V1-ndk.so" "vendor\lib64"

echo.
echo ===== System binaries =====

call :PULL "/system/bin/busybox" "system\bin"
call :PULL "/system/bin/dhcpcd" "system\bin"
call :PULL "/system/bin/wpa_cli" "system\bin"

echo.
echo ===== System lib64 =====

call :PULL "/system/lib64/libcert_parse.wpa_s.so" "system\lib64"
call :PULL "/system/lib64/libexpat.so" "system\lib64"
call :PULL "/system/lib64/libkeystore-engine-wifi-hidl.so" "system\lib64"
call :PULL "/system/lib64/libkeystore-wifi-hidl.so" "system\lib64"

echo.
echo ============================================
echo  DONE! Found: %FOUND%  Not Found: %NOTFOUND%
echo ============================================

echo.
echo Cleaning up temp dir on phone...
"%ADB%" shell su -c "rm -rf %TMP%"

pause
goto :EOF

:PULL
set SRC=%~1
set DST=%~2
for %%F in ("%SRC%") do set FNAME=%%~nxF
"%ADB%" shell su -c "test -f %SRC% && cp %SRC% %TMP%/%FNAME% && chmod 666 %TMP%/%FNAME% && echo EXISTS || echo MISSING" > "%TEMP%\_check.txt" 2>&1
set /p RESULT=<"%TEMP%\_check.txt"
if "!RESULT!"=="MISSING" (
    echo   [SKIP] %SRC% -- NOT FOUND on device
    set /a NOTFOUND+=1
) else (
    "%ADB%" pull "%TMP%/%FNAME%" "%ROOT_DIR%\%DST%\%FNAME%" >nul 2>&1
    echo   [OK]   %SRC%
    set /a FOUND+=1
    "%ADB%" shell su -c "rm -f %TMP%/%FNAME%"
)
goto :EOF
