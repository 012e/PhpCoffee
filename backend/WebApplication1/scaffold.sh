#!/bin/bash

echo "=== Scaffold starting ==="

# Nhập chuỗi kết nối
read -p "Nhập chuỗi kết nối PostgreSQL: " CONNECTION_STRING

# Thực thi scaffold
dotnet ef dbcontext scaffold \
  "$CONNECTION_STRING" \
  Npgsql.EntityFrameworkCore.PostgreSQL \
  -o Database \
  -f \
  --schema phpcafe \
  --context ApplicationDbContext

echo "=== Done! Press any key to exit ==="
read -n 1 -s