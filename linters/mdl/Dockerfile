FROM ruby:alpine

WORKDIR /mdl
RUN gem install mdl

# Add our custom markdown rules.
COPY ./markdown /mdl/markdown
COPY .mdlrc /mdl/.mdlrc

ENTRYPOINT [ "mdl" ]