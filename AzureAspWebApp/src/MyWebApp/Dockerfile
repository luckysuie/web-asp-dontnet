# Use official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app/MyWebApp

# Copy the project file and restore dependencies
COPY src/MyWebApp/MyWebApp.csproj ./
RUN dotnet restore  # Removed the extra dot

# Copy the entire project and build the app
COPY src/MyWebApp/. ./
RUN dotnet publish -c Release -o /out

# Use a lightweight runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /out .

# Expose the port used in Program.cs (Ensure this matches your deployment.yaml)
EXPOSE 80  

# Start the application
CMD ["dotnet", "MyWebApp.dll"]



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
