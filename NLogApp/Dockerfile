FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /nlogapp
EXPOSE 80

# copy csproj and restore as distinct layers
COPY *.sln .
COPY *.csproj ./aspnetapp/
RUN dotnet restore

# copy everything else and build app
COPY aspnetapp/. ./aspnetapp/
WORKDIR /app/aspnetapp
RUN dotnet publish -c Release -o out

