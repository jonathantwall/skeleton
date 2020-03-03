# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.google.code.findbugs:jsr305:3.0.2", "lang": "java", "sha1": "25ea2e8b0c338a877313bd4672d3fe056ea78f0d", "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar", "source": {"sha1": "b19b5927c2c25b6c70f093767041e641ae0b1b35", "sha256": "1c9e85e272d0708c6a591dc74828c71603053b48cc75ae83cce56912a2aa063b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2-sources.jar"} , "name": "com_google_code_findbugs_jsr305", "actual": "@com_google_code_findbugs_jsr305//jar", "bind": "jar/com/google/code/findbugs/jsr305"},
    {"artifact": "com.google.errorprone:error_prone_annotations:2.3.4", "lang": "java", "sha1": "dac170e4594de319655ffb62f41cbd6dbb5e601e", "sha256": "baf7d6ea97ce606c53e11b6854ba5f2ce7ef5c24dddf0afa18d1260bd25b002c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.4/error_prone_annotations-2.3.4.jar", "source": {"sha1": "950adf6dcd7361e3d1e544a6e13b818587f95d14", "sha256": "0b1011d1e2ea2eab35a545cffd1cff3877f131134c8020885e8eaf60a7d72f91", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.4/error_prone_annotations-2.3.4-sources.jar"} , "name": "com_google_errorprone_error_prone_annotations", "actual": "@com_google_errorprone_error_prone_annotations//jar", "bind": "jar/com/google/errorprone/error_prone_annotations"},
    {"artifact": "com.google.guava:failureaccess:1.0.1", "lang": "java", "sha1": "1dcf1de382a0bf95a3d8b0849546c88bac1292c9", "sha256": "a171ee4c734dd2da837e4b16be9df4661afab72a41adaf31eb84dfdaf936ca26", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar", "source": {"sha1": "1d064e61aad6c51cc77f9b59dc2cccc78e792f5a", "sha256": "092346eebbb1657b51aa7485a246bf602bb464cc0b0e2e1c7e7201fadce1e98f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1-sources.jar"} , "name": "com_google_guava_failureaccess", "actual": "@com_google_guava_failureaccess//jar", "bind": "jar/com/google/guava/failureaccess"},
    {"artifact": "com.google.guava:guava:28.2-jre", "lang": "java", "sha1": "8ec9ed76528425762174f0011ce8f74ad845b756", "sha256": "fc3aa363ad87223d1fbea584eee015a862150f6d34c71f24dc74088a635f08ef", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/28.2-jre/guava-28.2-jre.jar", "source": {"sha1": "79474f7d08b9a8d03f827161825711d9d62ef09a", "sha256": "e4a71a9d1f5f5f886a1802c257d3fcb78c6c234e2e183257f3ed1474802d077b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/28.2-jre/guava-28.2-jre-sources.jar"} , "name": "com_google_guava_guava", "actual": "@com_google_guava_guava//jar", "bind": "jar/com/google/guava/guava"},
    {"artifact": "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava", "lang": "java", "sha1": "b421526c5f297295adef1c886e5246c39d4ac629", "sha256": "b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar", "name": "com_google_guava_listenablefuture", "actual": "@com_google_guava_listenablefuture//jar", "bind": "jar/com/google/guava/listenablefuture"},
    {"artifact": "com.google.j2objc:j2objc-annotations:1.3", "lang": "java", "sha1": "ba035118bc8bac37d7eff77700720999acd9986d", "sha256": "21af30c92267bd6122c0e0b4d20cccb6641a37eaf956c6540ec471d584e64a7b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar", "source": {"sha1": "d26c56180205cbb50447c3eca98ecb617cf9f58b", "sha256": "ba4df669fec153fa4cd0ef8d02c6d3ef0702b7ac4cabe080facf3b6e490bb972", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3-sources.jar"} , "name": "com_google_j2objc_j2objc_annotations", "actual": "@com_google_j2objc_j2objc_annotations//jar", "bind": "jar/com/google/j2objc/j2objc_annotations"},
    {"artifact": "org.checkerframework:checker-qual:2.10.0", "lang": "java", "sha1": "5786699a0cb71f9dc32e6cca1d665eef07a0882f", "sha256": "d261fde25d590f6b69db7721d469ac1b0a19a17ccaaaa751c31f0d8b8260b894", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.10.0/checker-qual-2.10.0.jar", "source": {"sha1": "0e9cee84e891492970403d8bd7281dadeaaf11dd", "sha256": "aff9b7b482d65b947dfabf57c5fe5fc2b6d150b8583bdbc2308601eab6c9cede", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/2.10.0/checker-qual-2.10.0-sources.jar"} , "name": "org_checkerframework_checker_qual", "actual": "@org_checkerframework_checker_qual//jar", "bind": "jar/org/checkerframework/checker_qual"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
