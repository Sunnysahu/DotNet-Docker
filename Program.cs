var builder = WebApplication.CreateBuilder(args);

// Force port 5153 for example
builder.WebHost.ConfigureKestrel(serverOptions =>
{
    serverOptions.ListenAnyIP(5153); // or your preferred port
});
var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapGet("/hello", () => "Hello!");
app.MapGet("/sunny", () => "Hello sunny!");
app.MapGet("/sanjana", () => "Hello sanjana!");
app.MapGet("/dance", () => "Hello dance!");

app.Run();
