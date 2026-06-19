# Keep Yoco SDK classes
-keep class com.yoco.** { *; }
-keep class com.yoco.ono.common.miura.** { *; }
-keep class com.yoco.ono.android.miura.** { *; }
-keep class com.yoco.ono.common.dspread.** { *; }
-keep class com.yoco.ono.android.dspread.** { *; }
-keep class com.yoco.ono.common.datecs.** { *; }
-keep class com.yoco.ono.android.datecs.** { *; }
-keep class com.yoco.ono.common.bluetooth.** { *; }
-keep class com.yoco.ono.android.bluetooth.** { *; }
-keep class com.yoco.ono.common.cloud.** { *; }
-keep class com.yoco.ono.android.cloud.** { *; }
-keep class com.yoco.ono.common.modules.sdk.models.** { *; }
-keep class com.yoco.ono.android.modules.** { *; }

# Material Design Library
-keep class com.google.android.material.** { *; }
-dontwarn com.google.android.material.**
-dontnote com.google.android.material.**

# Kotlin Serialization
-keep @kotlinx.serialization.Serializable class *

# Koin workmanager
-keep class com.birbit.android.jobqueue.** { *; }
-dontwarn com.birbit.android.jobqueue.scheduling.Gcm*

# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.messaging.** { *; }

# AndroidX
-keep class androidx.** { *; }
-keep interface androidx.** { *; }
-keep class androidx.lifecycle.** { *; }
-keep class androidx.work.** { *; }

# Multidex
-keep class androidx.multidex.MultiDexApplication { *; }

# Data Binding
-keep class * extends androidx.databinding.DataBinderMapper { *; }
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep Parcelable classes
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

# Keep custom exceptions
-keep public class * extends java.lang.Exception

# JSR 305 annotations
-dontwarn javax.annotation.**

# Keep gson stuff
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.** { *; }

# Retrofit rules
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**

# Keep Enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep R
-keep class **.R
-keep class **.R$* {
    <fields>;
}