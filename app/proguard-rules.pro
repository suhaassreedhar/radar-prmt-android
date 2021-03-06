# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/andrea/Library/Android/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keep public class * implements org.radarbase.android.device.DeviceServiceProvider

# Native methods: https://www.guardsquare.com/en/products/proguard/manual/examples#native
# note that <methods> means any method
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
    static native <methods>;
}

# Avro
-keep class org.apache.avro.** { *; }
-keep @org.apache.avro.specific.AvroGenerated class * {
    public <fields>;
    public <methods>;
}
-keep class org.codehaus.jackson.** { *; }
-dontwarn org.apache.avro.**
-dontwarn org.codehaus.jackson.map.ext.**


# ==== OkHttp3 ==== #
# JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform
