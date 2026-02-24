-- Database schema for Learning and Jobs modules

-- Learning Module Schema
CREATE TABLE Courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Enrollments (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    course_id INT REFERENCES Courses(id),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, course_id)
);

CREATE TABLE LearningMaterials (
    id SERIAL PRIMARY KEY,
    course_id INT REFERENCES Courses(id),
    material_type VARCHAR(50),
    url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Jobs Module Schema
CREATE TABLE Jobs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    company VARCHAR(255),
    location VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Applications (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES Jobs(id),
    user_id INT REFERENCES Users(id),
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(job_id, user_id)
);

CREATE TABLE JobSkills (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES Jobs(id),
    skill VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);