# TensorFlow Model Server
> Docker image with a tensor model server running

## Motivation

In order to run TensorFlow predictions in production, it is recommended to use [TensorFlow Serving](https://www.tensorflow.org/serving/).

The problem is that there are no official docker images, standard ways of running it. Also, their documentation on "how to run" doesn't work properly.

## Models

### Exporting the model

In order to make TFS work, the models have to be exported with the [SavedModelBuilder](https://www.tensorflow.org/serving/serving_basic).

That will create a folder strucure similar to:

```
models/variables/     # variables folder
models/saved_model.pb # graph file
```

#### Folder structure

The folder strucure needs to follow this pattern:

```
models/config.tf            # config file
models/foo/                 # model
models/foo/1/               # version
models/foo/1/variables/     # variables folder exported from the SavedModelBuilder
models/foo/1/saved_model.pb # graph file exported from the SavedModelBuilder
...
```

[🌭](https://www.youtube.com/watch?v=ACmydtFDTGs)

### Config file

A basic map of the models folder with the name, path and platform of the models.

**Important**: The root path of the Docker image is `/tensorflow/`. Therefore, you need to prepend that to the models path, as the example:

```
model_config_list: {
  config: {
    name: "foo",
    base_path: "/tensorflow/models/foo",
    model_platform: "tensorflow"
  },
  config: {
    name: "bar",
    base_path: "/tensorflow/models/bar",
    model_platform: "tensorflow"
  }
}
```

## TODO

Open to contributors

- Add tests (Run a container with the inception or mnist server)
- Push a docker image on dockerhub
- Relase a 1.0 version
