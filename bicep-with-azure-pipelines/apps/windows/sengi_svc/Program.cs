var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
var counter = 0;

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.MapGet("/", (Func<string>)(() => " .NET 6 Minimal API"));
app.MapGet("/counter", (Func<int>)(() => ++counter ));
app.Run();
