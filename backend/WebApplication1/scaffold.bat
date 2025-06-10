@echo off
echo === Scaffold starting ===

set /p DB_PASSWORD=Nhập mật khẩu PostgreSQL: 

dotnet ef dbcontext scaffold "Host=db.thmpdhrucfczexmfyxnl.supabase.co;Database=postgres;Username=postgres;Password=%DB_PASSWORD%" Npgsql.EntityFrameworkCore.PostgreSQL -o Database -f --schema phpcafe --context ApplicationDbContext

echo === Done! Press any key to exit ===
pause