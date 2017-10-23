FROM python:alpine
ENV PYTHON_UNBUFFERED 1
RUN pip install yamllint

WORKDIR /yamllint

# Add our custom yaml rules.
COPY .yamllintrc /yamllint

ENTRYPOINT [ "yamllint", "-c", "/yamllint/.yamllintrc" ]
