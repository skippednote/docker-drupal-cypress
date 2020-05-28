ARG DRUPALBASE_VERSION
ARG NODE_VERSION
ARG CYPRESS_VERSION
ARG LIGHTHOUSE_VERSION

FROM hussainweb/drupal-base:${DRUPALBASE_VERSION}

ENV TERM xterm
ENV QT_X11_NO_MITSHM 1
ENV _X11_NO_MITSHM 1
ENV _MITSHM 0
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true
ENV NPM_PACKAGE_CONFIG_PUPPETEER_SKIP_CHROMIUM_DOWNLOAD 1
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
ENV PUPPETEER_EXECUTABLE_PATH "/usr/bin/google-chrome"

RUN ls -la /root
RUN chmod 755 /root

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - &&\
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    libgtk2.0-0 \
    libgtk-3-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb \
    dbus-x11 \
    nodejs \
    google-chrome-stable \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

RUN npm config -g set user $(whoami)
RUN npm install -g "npm@latest" "cypress@${CYPRESS_VERSION}" "@lhci/cli@${LIGHTHOUSE_VERSION}"