FROM python:3.6
ENV PYTHON_UNBUFFERED 1
RUN pip install flake8

WORKDIR /flake8

ENTRYPOINT [ "flake8" ]
