FROM conanio/gcc5:1.21.0

LABEL "name"="Conan Hooks"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Conan Hooks"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="blue"
LABEL "com.github.actions.description"="Validate your Conan recipe with Conan hooks"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


RUN pip install pylint astroid \
    && conan config install https://github.com/conan-io/hooks.git \
    && conan config set hooks.conan-center \
    && conan config set hooks.recipe_linter

ENTRYPOINT ["conan", "create", "."]
