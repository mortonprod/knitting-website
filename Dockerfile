# DO NOT COPY ANYTHING AFTER RESTORE OR IS MAY HAVE PARENT FILE SYSTEM PATHS.
FROM microsoft/aspnetcore-build:1.1.2
WORKDIR /app

COPY . ./
RUN dotnet restore

RUN dotnet publish -c Release -o out
# This does not expose the port but lets the person creating the container know these ports in the app are exposed.
EXPOSE 80
EXPOSE 433
ENTRYPOINT ["dotnet", "run"]