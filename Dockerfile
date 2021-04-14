FROM mcr.microsoft.com/dotnet/sdk:5.0-focal
WORKDIR /source

COPY . .
RUN dotnet publish -c release -o /app

WORKDIR /app
ENTRYPOINT ["dotnet", "vstest", "/app/dotnet-test-locale-test.dll"]
