CREATE SCHEMA IF NOT EXISTS data;
DROP TABLE IF EXISTS applicants;
CREATE TABLE applicants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  city VARCHAR(100),
  skills TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO applicants (name, email, city, skills) VALUES
('أحمد علي', 'ahmed@example.com', 'الرياض', 'JavaScript, Python, MySQL'),
('فاطمة محمد', 'fatima@example.com', 'جدة', 'JavaScript, React, HTML'),
('محمود سالم', 'mahmoud@example.com', 'الدمام', 'Python, Django, PostgreSQL'),
('نور خالد', 'noor@example.com', 'الرياض', 'JavaScript, Vue.js, CSS'),
('ليلى أحمد', 'layla@example.com', 'مكة', 'Java, Spring Boot, MySQL');

SELECT * FROM applicants ORDER BY created_at DESC;

SELECT * FROM applicants
WHERE skills LIKE '%JavaScript%';

SELECT city, COUNT(*) AS applicants_count
FROM applicants
GROUP BY city
ORDER BY applicants_count DESC;

