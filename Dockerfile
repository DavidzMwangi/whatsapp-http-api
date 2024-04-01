FROM node:15


# Install fonts if using either chromium or chrome
RUN if [ "$USE_BROWSER" = "chromium" ] || [ "$USE_BROWSER" = "chrome" ]; then \
    apt-get update  \
    && apt-get install -y fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*; \
    fi

# Install Chromium
RUN if [ "$USE_BROWSER" = "chromium" ]; then \
        apt-get update  \
        && apt-get update \
        && apt-get install -y chromium \
          --no-install-recommends \
        && rm -rf /var/lib/apt/lists/*; \
    fi




# npm packages
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install



# App
WORKDIR /app
ADD . /app
#RUN npm run start:dev
#RUN npm run build
EXPOSE 3000

CMD npm run start:dev
