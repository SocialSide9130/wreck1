FROM pt9999/fixlang

RUN apt-get update && apt-get install -y \
    software-properties-common \
    fish \
    curl \
    git \
    locales \
    less \
    nano \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:fish-shell/release-3 && \
    apt-get update && \
    apt-get install -y fish && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

RUN mkdir -p /root/.config/fish && \
    echo "starship init fish | source" >> /root/.config/fish/config.fish && \
    echo "alias ls='ls --color=auto'" >> /root/.config/fish/config.fish && \
    echo "alias ll='ls -alF'" >> /root/.config/fish/config.fish

ENTRYPOINT ["/usr/bin/fish"]