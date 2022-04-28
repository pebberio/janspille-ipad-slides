FROM node:10-alpine

# https://github.com/hakimel/reveal.js/pull/2271/files

# Set environment variables for reveal.js GitHub repo
ENV VERSION=3.7.0 \
    REPO=https://github.com/hakimel/reveal.js
#    SHA1=b444529be8a1041942f3f30ae4f626e10497498c

RUN apk -U add curl

RUN curl -SLO "${REPO}/archive/${VERSION}.tar.gz" \
    && tar xzf ${VERSION}.tar.gz \
    && mv /reveal.js-${VERSION} /revealjs \
    && rm *.tar.gz

RUN npm config set unsafe-perm true
RUN npm install grunt-cli -g

WORKDIR /revealjs

#RUN groupadd -r slides && useradd -r -g slides slides
#RUN chown -R slides /revealjs
#USER node

RUN npm install

EXPOSE 8000

CMD ["grunt", "serve"]