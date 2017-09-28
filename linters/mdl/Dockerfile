FROM ruby:alpine

WORKDIR /workspace
RUN gem install mdl

# Add our custom markdown rules.
COPY ./markdown /workspace/markdown
COPY .mdlrc /workspace/

ENTRYPOINT [ "mdl" ]