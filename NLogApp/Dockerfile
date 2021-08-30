FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

COPY *.sln .
COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /nlogapp
EXPOSE 80
RUN mkdir LogFiles
RUN chmod 777 LogFiles
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "NLogApp.dll"]