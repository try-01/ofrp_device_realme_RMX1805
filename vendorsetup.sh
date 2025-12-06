#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.


# --- BAGIAN KONFIGURASI UTAMA ---
# Ganti "lavender" dengan nama kode perangkat Anda.
FDEVICE="RMX1805"
# --------------------------------

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	# --- Pengaturan Dasar & Tampilan ---
	export TW_DEFAULT_LANGUAGE="en"
	export OF_SCREEN_H=2280
	export OF_STATUS_H=51
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
  	export OF_HIDE_NOTCH=1
  	export OF_CLOCK_POS=1 # 0=kiri, 1=tengah, 2=kanan
	export OF_USE_GREEN_LED=0 # Atur ke 0 karena kebanyakan perangkat Realme tidak memiliki LED notifikasi hijau

	# --- Pengaturan Enkripsi & Magisk ---
	export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1 # Jangan mencoba patch partisi terenkripsi
	export OF_USE_MAGISKBOOT=1 # Gunakan magiskboot untuk membongkar/mengemas boot.img
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1 # Gunakan magiskboot untuk semua patching
	export OF_USE_NEW_MAGISKBOOT=1 # Gunakan versi magiskboot yang lebih baru
    export OF_SUPPORT_OZIP_DECRYPTION=1
#	export OF_DEFAULT_KEYMASTER_VERSION=3.0
	export OF_USE_LEGACY_CRYPTO=1

	# --- Pengaturan Fungsionalitas & Kompatibilitas ---
	#export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1 # Wajib untuk build modern
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1 # Lewati pemeriksaan Treble, berguna untuk perangkat lama
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1510672800" # Workaround untuk Anti-Rollback Protection lama
	export FOX_REPLACE_BOOTIMAGE_DATE=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1 # Lewati backup folder multi-user (hemat ruang)
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1 # Perbaikan untuk error saat flash manual OTA
	export OF_USE_LOCKSCREEN_BUTTON=1
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
#	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	export OF_USE_TWRP_SAR_DETECT=1
	export FOX_RESET_SETTINGS=1
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
	#export FOX_ADVANCED_SECURITY=1

	# --- Pengaturan Shell & Perkakas Bawaan ---
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_REPLACE_BUSYBOX_PS=1

    # --- Pengaturan Spesifik R11.1 (Biarkan default) ---
    export FOX_R11=1
    export OF_QUICK_BACKUP_LIST="/boot;/dtbo;/data;/cache;/system_root;/vendor;"
	
	# --- HAPUS KONFIGURASI KHUSUS MIUI ---
	# Baris-baris berikut tidak relevan untuk Realme dan sebaiknya dihapus
	# export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	# export OF_NO_MIUI_PATCH_WARNING=1

	# --- Logging Variabel Build (opsional, bagus untuk debug) ---
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi

	# --- Menambahkan Target Build ke Menu 'lunch' ---
  	for var in eng user userdebug; do
  		add_lunch_combo omni_"$FDEVICE"-$var
  	done
fi
