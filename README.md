# OFRP device tree for Realme RMX1805 (Realme 2)

## About Device

Basic   | Spec Sheet
-------:|:----------
CPU     | 8x ARM Cortex A53, 1.8GHz
Chipset | Qualcomm Snapdragon 450
GPU     | Adreno 506, Full HD 1080p 60fps
ROM     | 32/64GB
RAM     | 3/4GB
Android | 9.0
Battery | 4230 mAh
Display | 1520x720 pixels, 6.2
Rear Camera  | 13MP, PDAF
Front Camera | 8 MP

## Device picture

![Realme 2](https://fdn2.gsmarena.com/vv/pics/oppo/oppo-realme-2-2.jpg)

**This device tree can be used to build OFRP for Realme RMX1805 (Realme 2)**

## Build Instructions
```sh
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch omni_RMX1811-eng
mka recoveryimage
```
