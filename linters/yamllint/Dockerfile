FROM python:alpine
ENV PYTHON_UNBUFFERED 1
RUN pip install yamllint
WORKDIR /workspace

# Add our custom yaml rules.
COPY .yamllintrc /workspace

ENTRYPOINT ["yamllint", "-c", ".yamllintrc"]
