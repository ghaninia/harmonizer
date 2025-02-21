CREATE TABLE IF NOT EXISTS profiles (
                                        id INT PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
