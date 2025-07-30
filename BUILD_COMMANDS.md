# Flutter 应用打包命令手册

---

## Android 打包命令

### 1. APK 打包

#### 开发环境 APK
```bash
# Release APK (测试用)
flutter build apk --flavor dev --release
```

#### 生产环境 APK
```bash
# Release APK (正式发布用)
flutter build apk --flavor prod --release

# 指定目标架构的 APK
flutter build apk --flavor prod --release --target-platform android-arm64
```

### 2. AAB 打包 (Google Play 推荐)

#### 生产环境 AAB
```bash
flutter build appbundle --flavor prod --release
```

---

## iOS 打包命令

### 1. 构建 iOS 应用
```bash
# Release 模式构建
flutter build ios --release

# 指定配置文件构建
flutter build ios --release --flavor prod
```

### 2. 生成 IPA 文件
```bash
# 首先构建 iOS
flutter build ios --release --flavor prod

# 然后使用 Xcode 命令行工具打包
cd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -archivePath Runner.xcarchive archive

# 导出 IPA
xcodebuild -exportArchive -archivePath Runner.xcarchive -exportPath . -exportOptionsPlist ExportOptions.plist
```

---

## 预打包准备命令

### 1. 清理缓存
```bash
# 清理 Flutter 缓存
flutter clean

# 重新获取依赖
flutter pub get

# 重新生成启动图
dart run flutter_native_splash:create
```

---

## 快速打包命令 (一键复制)

### Android 生产环境完整流程
```bash
flutter clean && flutter pub get && dart run flutter_native_splash:create && flutter build apk --flavor prod --release
```

### Android AAB 生产环境完整流程
```bash
flutter clean && flutter pub get && dart run flutter_native_splash:create && flutter build appbundle --flavor prod --release
```

### Android 开发环境测试包
```bash
flutter clean && flutter pub get && flutter build apk --flavor dev --release
```

---

## 输出文件位置

### Android 输出路径
- **APK 文件**: `build/app/outputs/flutter-apk/`
- **AAB 文件**: `build/app/outputs/bundle/`

### iOS 输出路径
- **iOS 构建**: `build/ios/iphoneos/`
- **Archive 文件**: `ios/Runner.xcarchive`

---

## 签名配置命令

### 生成新的签名密钥

```bash
# 生成密钥库
keytool -genkey -v -keystore news.jks -alias bullet -keyalg RSA -keysize 2048 -validity 10000 -storepass newsabc2025 -keypass newsabc2025

# 查看密钥库信息
keytool -list -v -keystore news.jks -storepass newsabc2025

# 查看密钥库指纹信息（用于第三方服务配置）
keytool -list -v -keystore news.jks -alias bullet -storepass newsabc2025
```

### 验证现有签名
```bash
# 验证 APK 签名
jarsigner -verify -verbose -certs build/app/outputs/flutter-apk/app-prod-release.apk

# 查看 APK 签名信息
keytool -printcert -jarfile build/app/outputs/flutter-apk/app-prod-release.apk
```

---

## 常用调试命令

### 1. 设备调试
```bash
# 列出连接的设备
flutter devices

# 在指定设备上运行
flutter run -d <device_id>

# 热重载开发
flutter run --flavor dev
```

### 2. 性能分析
```bash
# 性能分析模式运行
flutter run --profile --flavor dev

# 构建性能分析版本
flutter build apk --profile --flavor dev
```

---
