FROM tensorflow/serving:2.1.0

MAINTAINER Robin Henniges <team-engineering@hey.car>

# Mount the models
RUN mkdir /tensorflow/
RUN mkdir /tensorflow/models
ADD models/ /tensorflow/models

# GRPC port
EXPOSE 8500
EXPOSE 8501

#CMD tensorflow_model_server --port=8500 --rest_api_port=8501 --model_config_file=/tensorflow/models/config.tf --model_name=banner --model_base_path=/tensorflow/models/banner

entrypoint tensorflow_model_server --port=8500 --rest_api_port=8501 --model_config_file=/tensorflow/models/config.tf
