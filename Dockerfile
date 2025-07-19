FROM node:20-slim AS builder

WORKDIR /usr/src/app

# enable pnpm
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm install -g corepack@latest
RUN corepack enable

# run the build in the "builder" image
COPY package.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . /usr/src/app
RUN pnpm build

# create the "real" image, which only contains the files that should actually be
# deployed
FROM scratch

COPY --from=builder /usr/src/app/build /dist

# now all the files that need to be deployed (index.html, etc) are in the /dist
# folder of the image
