# Build stage

# 1. Use official .NET SDK image (for build only)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy all source code from your local project to container
COPY . ./

# 4. Restore NuGet packages (dependencies)
RUN dotnet restore

# 5. Build and publish the project to a folder
RUN dotnet publish -c Release -o out

# Runtime stage
# 6. Use lightweight runtime image (no SDK, just enough to run .NET app)
# Container: New image, empty
FROM mcr.microsoft.com/dotnet/aspnet:8.0			

# 7. Set runtime working directory
WORKDIR /app

# 8. Copy published files from build stage to runtime stage
COPY --from=build /app/out .

# CMD dir

# 9. Command to run the application when container starts
ENTRYPOINT ["dotnet", "test.dll"]
# ENTRYPOINT ["dir"]
