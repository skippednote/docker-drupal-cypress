FROM hussainweb/drupal-base:php8.1

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - &&\
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
