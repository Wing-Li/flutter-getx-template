plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_getx_template"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.flutter_getx_template"
        minSdk = 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        
        multiDexEnabled = true
    }

    signingConfigs {
        create("dev") {
            keyAlias = "lyl"
            keyPassword = "123456"
            storeFile = file("lyl.jks")
            storePassword = "123456"
        }
        create("release") {
            keyAlias = "lyl"
            keyPassword = "123456"
            storeFile = file("lyl.jks")
            storePassword = "123456"
        }
    }

    // 定义产品风味
    flavorDimensions.add("app")
    productFlavors {
        create("dev") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "App Dev")
        }
        
        create("prod") {
            dimension = "app"
            resValue("string", "app_name", "App Pro")
        }
    }

    // 为不同环境配置资源目录
    // sourceSets {
    //     getByName("dev") {
    //         res.srcDirs("src/dev/res")
    //         resources.srcDirs("src/dev")
    //     }
    //     getByName("prod") {
    //         res.srcDirs("src/prod/res")
    //         resources.srcDirs("src/prod")
    //     }
    // }

    buildTypes {
        getByName("debug") {
            isMinifyEnabled = false
            isZipAlignEnabled = true
            // 移除无用的resource文件
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("release")
        }
        getByName("release") {
            isMinifyEnabled = false
            isZipAlignEnabled = true
            // 移除无用的resource文件
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")
    // 添加核心库脱糖依赖
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.3")
    
}
