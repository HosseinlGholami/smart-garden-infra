-- Smart Garden Database Initialization Script
-- This script sets up the database and user with proper permissions

-- Create the database if it doesn't exist (will be created by MYSQL_DATABASE env var)
-- CREATE DATABASE IF NOT EXISTS smart_garden CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Grant permissions to the user created by MYSQL_USER env var
-- The user is automatically created by MySQL when MYSQL_USER and MYSQL_PASSWORD are set

-- Grant test database permissions (Django creates test_* databases)
GRANT ALL PRIVILEGES ON test_smart_garden.* TO 'django_user'@'%';
GRANT ALL PRIVILEGES ON `test\_%`.* TO 'django_user'@'%';

-- Grant root access from any host for development
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- Grant django_user access from any host
GRANT ALL PRIVILEGES ON *.* TO 'django_user'@'%' WITH GRANT OPTION;

-- Flush privileges to ensure they take effect
FLUSH PRIVILEGES;

-- Show created databases and users for verification
SHOW DATABASES;
SELECT User, Host FROM mysql.user WHERE User IN ('root', 'django_user'); 