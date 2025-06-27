var builder = WebApplication.CreateBuilder(args);

// Add MVC support
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages(); // Keep if Razor Pages are needed

var app = builder.Build();

// Middleware setup
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

// app.UseHttpsRedirection();
// app.UseStaticFiles();

app.UseRouting();
app.UseAuthorization();

// Ensure MVC Controllers are mapped properly
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// app.MapRazorPages(); // Keep if Razor Pages are needed

app.Run();