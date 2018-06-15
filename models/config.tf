model_config_list: {
  config: {
    name: "foo",
    base_path: "/tensorflow/models/foo",
    model_platform: "tensorflow"
    model_version_policy: {latest{}},
  },
  config: {
    name: "bar",
    base_path: "/tensorflow/models/bar",
    model_platform: "tensorflow"
    model_version_policy: {all{}}
  },
  config: {
    name: "baz",
    base_path: "/tensorflow/models/baz",
    model_platform: "tensorflow"
    model_version_policy: {specific{versions:0,versions:1}}
  }
}
