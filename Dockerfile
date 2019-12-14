FROM conanio/gcc5:1.21.0

LABEL "name"="Conan Hooks" \
      "version"="1.0.0" \
      "com.github.actions.name"="Conan Hooks" \
      "com.github.actions.icon"="zap" \
      "com.github.actions.color"="blue" \
      "com.github.actions.description"="Validate your Conan recipe with Conan hooks"

ENV LC_ALL=C.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    CONAN_USER_HOME=/tmp/conan

RUN pip install pylint astroid \
    && conan profile new default --detect \
    && conan config install https://github.com/conan-io/hooks.git \
    && conan config set hooks.conan-center \
    && conan config set hooks.recipe_linter

ENTRYPOINT ["conan", "create", "."]
