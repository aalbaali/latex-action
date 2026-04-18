FROM aalbaali/latex:full

RUN sudo sudo apt-get update -y \
        && sudo apt-get install -y \
            xdotool

# Install the custom classes
RUN mkdir -p /tmp/custom_latex \
    && cd /tmp/custom_latex \
    &&  echo $(ls .) && echo "$PWD" \
    && wget -c https://raw.githubusercontent.com/aalbaali/latex_classes/master/install.sh -O install_tex.sh \
    && chmod +x install_tex.sh \
    && ./install_tex.sh

COPY \
  LICENSE \
  README.md \
  entrypoint.sh \
  /root/

ENTRYPOINT ["/root/entrypoint.sh"]
