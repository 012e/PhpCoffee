@echo off

echo === Scaffold starting ===

dotnet ef dbcontext scaffold "Host=db.thmpdhrucfczexmfyxnl.supabase.co;Database=postgres;Username=postgres;Password=dYrvfTcxqbdrFCMz" Npgsql.EntityFrameworkCore.PostgreSQL -o Database -f --schema phpcafe --context ApplicationDbContext

echo === Done! Press any key to exit ===
pause