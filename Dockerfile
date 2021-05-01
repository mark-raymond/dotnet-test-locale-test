FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install apt-utils -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install locales -y && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

WORKDIR /source
COPY *.csproj *.cs /source/
RUN dotnet publish -c release -o /app

ARG LOCALE
RUN locale-gen $LOCALE && update-locale LANG=$LOCALE LC_ALL=$LOCALE
ENV LANG $LOCALE
ENV LC_ALL $LOCALE

WORKDIR /app
ENTRYPOINT ["dotnet", "vstest", "/app/dotnet-test-locale-test.dll"]
