load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "ProjectRunner",
    srcs = ["src/main/java/com/sublime/ProjectRunner.java"],
    main_class = "com.sublime.ProjectRunner",
    deps = [":greeter"],
)

java_library(
    name = "greeter",
    srcs = ["src/main/java/com/sublime/Greeting.java"],
    visibility = ["//src/main/java/com/sublime/cmdline:__pkg__"],
)

