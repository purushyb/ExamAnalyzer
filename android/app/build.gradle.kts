import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val localProps = Properties().apply {
    load(rootProject.file("local.properties").inputStream())
}

android {
    namespace = "com.example.exam_analyzer"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = localProps["flutter.ndkVersion"]?.toString() ?: "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.exam_analyzer"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = localProps["flutter.minSdkVersion"]?.toString()?.toInt() ?: 23
        targetSdk = localProps["flutter.targetSdkVersion"]?.toString()?.toInt() ?: 35
        versionCode = localProps["flutter.versionCode"]?.toString()?.toInt() ?: 1
        versionName = localProps["flutter.versionName"]?.toString() ?: "1.0.0"
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
