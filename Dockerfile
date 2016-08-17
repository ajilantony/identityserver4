FROM microsoft/dotnet 
 
COPY NuGet.Config /app/
COPY global.json /app/
 
COPY src/Host/project.json /app/src/Host/
COPY src/IdentityServer4/project.json  /app/src/IdentityServer4/
 

WORKDIR /app/src/IdentityServer4
RUN dotnet restore
RUN dotnet build

WORKDIR /app/src/Host
RUN dotnet restore
RUN dotnet build
 
COPY . /app
WORKDIR /app/src/Host
 
EXPOSE 5000
ENTRYPOINT ["dotnet", "run"]