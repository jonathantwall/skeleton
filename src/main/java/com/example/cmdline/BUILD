load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "runner",
    srcs = ["Runner.java"],
    main_class = "com.example.cmdline.Runner",
    deps = [
        "//src/main/java/com/example",
        "@third_party_jvm//3rdparty/jvm/com/google/guava:guava",
        "@third_party_jvm//3rdparty/jvm/com/google/code/findbugs:jsr305",
        "@third_party_jvm//3rdparty/jvm/javax/annotation:jsr250_api",
    ],
)
