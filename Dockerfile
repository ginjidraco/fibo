# Étape 1 : Construction
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copier les fichiers source
COPY ./src ./src

# Publier l'application
RUN dotnet publish "./src/Fibo.Web/Fibo.Web.csproj" -c Release -r linux-musl-x64 \
    /p:PublishAot=true /p:PublishTrimmed=true /p:PublishReadyToRun=true -o /publish

# Étape 2 : Exécution
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0 AS runtime
WORKDIR /app
COPY --from=build /publish .

ENTRYPOINT ["./Fibo.Web"]
