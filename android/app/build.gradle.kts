plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.e_commerce_app"
    compileSdk = flutter.compileSdkVersion
   // compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
       jvmTarget = JavaVersion.VERSION_11.toString()
    }

    packaging {
        jniLibs {
            useLegacyPackaging = false
        }
    }



    defaultConfig {
        applicationId = "com.example.e_commerce_app"
        minSdk = 23
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        multiDexEnabled = true

        ndk {
            abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86_64")
        }


        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    //applicationId = "com.example.e_commerce_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
    // minSdk = flutter.minSdkVersion
    // targetSdk = flutter.targetSdkVersion
    // versionCode = flutter.versionCode
    //  versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    implementation("androidx.multidex:multidex:2.0.1")

    // باقي المكتبات بتاعتك
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}


flutter {
    source = "../.."
}

