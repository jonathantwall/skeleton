load("@rules_java//java:defs.bzl", "java_binary")

java_library(
    name = "example",
    srcs = ["src/main/java/com/example/Greeting.java"],
    visibility = ["//src/main/java/com/example/cmdline:__pkg__"],
    deps = [
        "@third_party_jvm//3rdparty/jvm/com/google/guava:guava",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_spi",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_compiler",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_producers",
        "@third_party_jvm//3rdparty/jvm/com/google/code/findbugs:jsr305",
        "@third_party_jvm//3rdparty/jvm/javax/annotation:jsr250_api",
        "@third_party_jvm//3rdparty/jvm/javax/inject:javax_inject",
    ],
)
