# TensorFlow Model Server
> Docker image with a tensor model server running

## Motivation

In order to run TensorFlow predictions in production, it is recommended to use [TensorFlow Serving](https://www.tensorflow.org/serving/).

The problem is that there are no official docker images, standard ways of running it. Also, their documentation on "how to run" doesn't work properly.

## TODO

Open to contributors

- [] Make it multi model (using a config file) [More](https://github.com/tensorflow/serving/blob/a35d47239f6de954892f5fdf6ac5172ef2d5a790/tensorflow_serving/model_servers/tensorflow_model_server_test.py#L83)
- [] Add documentation on how to run (Folder structure, models, ...)
- [] Add tests (Run a container with the inception or mnist server)
- [] Push a docker image on dockerhub
- [] Relase a 1.0 version
