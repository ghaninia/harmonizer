CREATE TABLE IF NOT EXISTS a_profile (
                                         id INT PRIMARY KEY AUTO_INCREMENT,
                                         name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
