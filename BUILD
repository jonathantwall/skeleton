load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "ProjectRunner",
    srcs = ["src/main/java/com/example/ProjectRunner.java"],
    main_class = "com.example.ProjectRunner",
    deps = [":greeter"],
)

java_library(
    name = "greeter",
    srcs = ["src/main/java/com/example/Greeting.java"],
    plugins = [
	    "//third_party:dagger_compiler_plugin",
    ],
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
