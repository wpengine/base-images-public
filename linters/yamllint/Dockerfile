FROM python:alpine
ENV PYTHON_UNBUFFERED 1
RUN pip install yamllint
WORKDIR /workspace
ENTRYPOINT ["yamllint"]
