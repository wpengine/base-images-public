FROM python:3.6
ENV PYTHON_UNBUFFERED 1
RUN pip install pylint

WORKDIR /pylint

# Add wrapper script for running pylint against all python files.
COPY ./bin/run_pylint.sh /pylint

# Add our custom pylint rules.
COPY ./.pylintrc /pylint

ENTRYPOINT [ "/pylint/run_pylint.sh" ]