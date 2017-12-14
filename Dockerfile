FROM ubuntu:16.04

MAINTAINER Marcelo Boeira "me+github@emarceloboeira.com"

# Install essential dependencies
RUN apt-get update && apt-get install -y \
      build-essential \
      curl \
      libcurl3-dev \
      libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install the TensorFlow Model Server
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list && \
    curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install tensorflow-model-server

# Copy the models to the image
WORKDIR /tensorflow
ADD models/ ./models

# GRPC port
EXPOSE 7000
CMD tensorflow_model_server --port=7000 --model_name=YOUR_MODEL_HERE --model_base_path=/tensorflow/models/YOUR_MODEL_HERE