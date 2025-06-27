# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY src/MyWebApp/MyWebApp.csproj ./MyWebApp/
RUN dotnet restore ./MyWebApp/MyWebApp.csproj

# Copy the entire project and build
COPY src/MyWebApp/ ./MyWebApp/
WORKDIR /src/MyWebApp
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Run the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Expose the default HTTP port
EXPOSE 80

# Start the application
ENTRYPOINT ["dotnet", "MyWebApp.dll"]



# ---
# # Use official .NET SDK image to build the app
# FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# WORKDIR /app

# # Copy project files and restore dependencies
# COPY *.csproj ./
# RUN dotnet restore
# #
# # Copy the entire project and build the app
# COPY . ./
# RUN dotnet publish -c Release -o /out

# # Use a lightweight runtime image
# FROM mcr.microsoft.com/dotnet/aspnet:8.0
# WORKDIR /app
# COPY --from=build /out .

# # Expose the port used in Program.cs
# EXPOSE 8080

# # Start the application
# CMD ["dotnet", "MyWebApp.dll"]
