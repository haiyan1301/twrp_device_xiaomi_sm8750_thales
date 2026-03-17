@echo off
set ADB=C:\Users\haiyan\Downloads\platform-tools\adb.exe
set ROOT_DIR=%~dp0recovery\root

echo ====================
echo Nezha Decryption Component Puller
echo ====================

echo [0/10] Requesting Root access, please click ALLOW on your phone...
"%ADB%" shell su -c "echo Root granted"

echo.
echo [1/10] Pulling android.hardware.security.keymint-service.strongbox-thales
"%ADB%" shell su -c "cp /odm/bin/hw/android.hardware.security.keymint-service.strongbox-thales /data/local/tmp/kmb"
"%ADB%" pull /data/local/tmp/kmb "%ROOT_DIR%\odm\bin\hw\android.hardware.security.keymint-service.strongbox-thales"

echo [2/10] Pulling android.hardware.weaver-service
"%ADB%" shell su -c "cp /odm/bin/hw/android.hardware.weaver-service /data/local/tmp/ws"
"%ADB%" pull /data/local/tmp/ws "%ROOT_DIR%\odm\bin\hw\android.hardware.weaver-service"

echo [3/10] Pulling android.hardware.weaver-service.thales
"%ADB%" shell su -c "cp /odm/bin/hw/android.hardware.weaver-service.thales /data/local/tmp/wsthales"
"%ADB%" pull /data/local/tmp/wsthales "%ROOT_DIR%\odm\bin\hw\android.hardware.weaver-service.thales"

echo [4/10] Pulling se_omapi
"%ADB%" shell su -c "cp /odm/bin/se_omapi /data/local/tmp/seom"
"%ADB%" pull /data/local/tmp/seom "%ROOT_DIR%\odm\bin\se_omapi"

echo [5/10] Pulling ese_weaver_thales.so
"%ADB%" shell su -c "cp /odm/lib64/ese_weaver_thales.so /data/local/tmp/ewt"
"%ADB%" pull /data/local/tmp/ewt "%ROOT_DIR%\odm\lib64\ese_weaver_thales.so"

echo [6/10] Pulling libjc_keymint-thales.so
"%ADB%" shell su -c "cp /odm/lib64/libjc_keymint-thales.so /data/local/tmp/ljkt"
"%ADB%" pull /data/local/tmp/ljkt "%ROOT_DIR%\odm\lib64\libjc_keymint-thales.so"

echo [7/10] Pulling android.hardware.gatekeeper-rust-service-qti
"%ADB%" shell su -c "cp /vendor/bin/hw/android.hardware.gatekeeper-rust-service-qti /data/local/tmp/gk"
"%ADB%" pull /data/local/tmp/gk "%ROOT_DIR%\vendor\bin\hw\android.hardware.gatekeeper-rust-service-qti"

echo [8/10] Pulling android.hardware.security.onekeymint-service-qti
"%ADB%" shell su -c "cp /vendor/bin/hw/android.hardware.security.onekeymint-service-qti /data/local/tmp/kms"
"%ADB%" pull /data/local/tmp/kms "%ROOT_DIR%\vendor\bin\hw\android.hardware.security.onekeymint-service-qti"

echo [9/10] Pulling qseecomd
"%ADB%" shell su -c "cp /vendor/bin/qseecomd /data/local/tmp/qsee"
"%ADB%" pull /data/local/tmp/qsee "%ROOT_DIR%\vendor\bin\qseecomd"

echo [10/10] Pulling libqtigatekeeper.so
"%ADB%" shell su -c "cp /vendor/lib64/hw/libqtigatekeeper.so /data/local/tmp/lqg"
"%ADB%" pull /data/local/tmp/lqg "%ROOT_DIR%\vendor\lib64\hw\libqtigatekeeper.so"

echo.
echo Cleaning up tmp files on phone...
"%ADB%" shell su -c "rm -f /data/local/tmp/kmb /data/local/tmp/ws /data/local/tmp/wsthales /data/local/tmp/seom /data/local/tmp/ewt /data/local/tmp/ljkt /data/local/tmp/gk /data/local/tmp/kms /data/local/tmp/qsee /data/local/tmp/lqg"

echo Removing incorrect old files...
del /q /f "%ROOT_DIR%\odm\bin\hw\android.hardware.security.keymint-service.strongbox" 2>nul
del /q /f "%ROOT_DIR%\vendor\bin\hw\android.hardware.gatekeeper-service-qti" 2>nul
del /q /f "%ROOT_DIR%\vendor\bin\hw\android.hardware.security.keymint-service-qti" 2>nul

echo ====================
echo Pull fully completed! Press any key to exit.
pause
