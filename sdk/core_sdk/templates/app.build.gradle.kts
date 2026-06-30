plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

val localProperties = java.util.Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val keystoreProperties = java.util.Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use { fis ->
        keystoreProperties.load(fis)
    }
}

val flutterRoot = localProperties.getProperty("flutter.sdk") ?: 
    throw GradleException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val dartDefines = mutableMapOf<String, String>()

// 1. Load from .env/production.env in repo root
val envFile = rootProject.file("../.env/production.env")
if (envFile.exists()) {
    envFile.forEachLine { line ->
        val trimmed = line.trim()
        if (trimmed.isNotEmpty() && !trimmed.startsWith("#")) {
            val parts = trimmed.split("=", limit = 2)
            if (parts.size == 2) {
                dartDefines[parts[0].trim()] = parts[1].trim()
            }
        }
    }
}

// 2. Load from flutter.dart-defines (CLI / IDE injection) - Highest priority
if (project.hasProperty("flutter.dart-defines")) {
    val defines = project.property("flutter.dart-defines") as String
    defines.split(",").forEach { entry ->
        val pair = String(java.util.Base64.getDecoder().decode(entry), Charsets.UTF_8).split("=")
        dartDefines[pair[0]] = if (pair.size > 1) pair[1] else ""
    }
}

android {
    namespace = "com.foodyman.demo"
    compileSdk = 36
    ndkVersion = "29.0.14206865"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
    }

    defaultConfig {
        applicationId = dartDefines["CUSTOMER_ANDROID_PACKAGE_NAME"] ?: "com.foodyman.demo"
        minSdk = 24
        multiDexEnabled = true
        targetSdk = 36
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
        
        resValue("string", "google_maps_api_key", dartDefines["GOOGLE_MAPS_API_KEY"] ?: "")
        resValue("string", "facebook_app_id", dartDefines["FACEBOOK_APP_ID"] ?: "")
        resValue("string", "facebook_client_token", dartDefines["FACEBOOK_CLIENT_TOKEN"] ?: "")
        resValue("string", "fb_login_protocol_scheme", dartDefines["FB_LOGIN_PROTOCOL_SCHEME"] ?: "")
        resValue("string", "deep_link_host", dartDefines["DEEP_LINK_URL"] ?: "")
        resValue("string", "app_name", dartDefines["CUSTOMER_APP_NAME"] ?: "")
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }
    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
            minifyEnabled = false
            isDebuggable = true
        }
        
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            minifyEnabled = true
            setProguardFiles(listOf(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro"))
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
}
