load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "runner",
    srcs = ["Runner.java"],
    main_class = "com.example.cmdline.Runner",
    deps = [
        "//:greeter",
        "@third_party_jvm//3rdparty/jvm/com/google/guava:guava",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_spi",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_compiler",
        "@third_party_jvm//3rdparty/jvm/com/google/dagger:dagger_producers",
        "@third_party_jvm//3rdparty/jvm/javax/annotation:jsr250_api",
#        "@third_party_jvm//3rdparty/jvm/javax/inject:javax_inject",
    ],
)
