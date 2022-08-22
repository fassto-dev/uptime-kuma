FROM louislam/uptime-kuma:base-alpine AS build
WORKDIR /app

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1

COPY . .
RUN npm i &&\
    npm run build &&\
    rm -rf node_modules &&\
    chmod +x /app/extra/entrypoint.sh


FROM louislam/uptime-kuma:base-alpine AS release
WORKDIR /app

COPY --from=build /app /app
RUN npm ci --omit dev

EXPOSE 3001
VOLUME ["/app/data"]
HEALTHCHECK --interval=60s --timeout=30s --start-period=180s --retries=5 CMD node extra/healthcheck.js
ENTRYPOINT ["/usr/bin/dumb-init", "--", "extra/entrypoint.sh"]
CMD ["node", "server/server.js"]
