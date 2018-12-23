FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

COPY *.sln .
COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /nlogapp
EXPOSE 80
RUN mkdir LogFiles
RUN chmod 777 LogFiles
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "NLogApp.dll"]