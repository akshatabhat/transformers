FROM pytorch/pytorch:latest

WORKDIR /develop

#RUN pip install --editable .
RUN pip install tensorboardX