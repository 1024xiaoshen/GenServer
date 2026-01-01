DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    avatar TEXT NOT NULL,
    role TEXT NOT NULL,
    status TEXT NOT NULL,
    gender TEXT NOT NULL,
    country TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL
);
-- Insert sample data
INSERT INTO users (
        name,
        email,
        phone,
        password,
        created_at,
        updated_at,
        avatar,
        role,
        status,
        gender,
        country,
        address,
        city
    )
VALUES (
        'Alice Johnson',
        'alice@example.com',
        '1234567890',
        'password123',
        '2024-01-15',
        '2024-01-15',
        'avatar.png',
        'user',
        'active',
        'female',
        'United States',
        '123 Main St',
        'New York'
    ),
    (
        'Bob Smith',
        'bob@example.com',
        '1234567890',
        'password123',
        '2024-02-20',
        '2024-02-20',
        'avatar.png',
        'user',
        'active',
        'male',
        'United States',
        '123 Main St',
        'New York'
    ),
    (
        'Carol Williams',
        'carol@example.com',
        '1234567890',
        'password123',
        '2024-03-10',
        '2024-03-10',
        'avatar.png',
        'user',
        'active',
        'female',
        'United States',
        '123 Main St',
        'New York'
    );