FROM python:3.6
ENV PYTHON_UNBUFFERED 1

RUN pip install flake8

COPY .flake8 /

ENTRYPOINT ["flake8", "--config=/.flake8"]
