# WSL has performance issues
# use a native linux machine + Docker for better results

FROM alpine:3.17
RUN apk add gcc g++ make erlang rust cargo cabal wget nodejs npm bash perl go openjdk17 luajit

RUN cabal update

# .NET
RUN wget https://dot.net/v1/dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --version latest
ENV PATH="/root/.dotnet:${PATH}"

# Python 3.11
COPY --from=python:3.11.0-alpine3.17 usr/local/bin/ usr/local/bin/
COPY --from=python:3.11.0-alpine3.17 /usr/local/lib/ /usr/local/lib/
ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH}"

# Coffe script
RUN npm install --global coffeescript

COPY . .

# Prebuilt everything
RUN make LENGTH=1
CMD [ "/bin/bash" ]