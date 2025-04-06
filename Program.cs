var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapGet("/hello", () => "Hello!");
app.MapGet("/sunny", () => "Hello sunny!");
app.MapGet("/sanjana", () => "Hello sanjana!");

app.Run();
