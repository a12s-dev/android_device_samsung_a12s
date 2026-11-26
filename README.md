# Samsung Galaxy A12 (SM-A127F) - a12s

LineageOS 23.2 device tree for the Samsung Galaxy A12 (SM-A127F), Exynos 850.

## Device

- SoC: Samsung Exynos 850 (8x Cortex-A55, Mali-G52)
- Display: 720x1600 (panels: NT36525B / ILI9882Q / TD4150 / TD4375 / TD4160 / ILI7807S)
- No NFC on A127F
- No A/B (standard partitions)

## Build

```
source build/envsetup.sh
breakfast a12s userdebug
m bacon
```

## Notes

- `local_manifests/a12s.xml` documents the exact roomservice manifest used.
