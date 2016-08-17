FROM microsoft/dotnet 
 
COPY NuGet.config /app/
COPY global.json /app/
 
COPY src/Host/project.json /app/src/Host/
COPY src/IdentityServer4/project.json  /app/src/IdentityServer4/
 
WORKDIR /app/src/IdentityServer4
RUN ["dnu", "restore"]

WORKDIR /app/src/Host
RUN ["dnu", "restore"]
 
COPY . /app
WORKDIR /app/src/Host
 
EXPOSE 5000
ENTRYPOINT ["dnx", "kestrel"]