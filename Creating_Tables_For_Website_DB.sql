CREATE TABLE visitors (
    visitor_id INT PRIMARY KEY,
    first_visit_date DATE,
    country VARCHAR(50),
    city VARCHAR(50),
    user_type VARCHAR(20)
);

CREATE TABLE devices (
    device_id INT PRIMARY KEY,
    device_type VARCHAR(50),
    os VARCHAR(50),
    browser VARCHAR(50)
);

CREATE TABLE traffic_sources (
    source_id INT PRIMARY KEY,
    medium VARCHAR(50),
    source_name VARCHAR(100),
    campaign VARCHAR(100)
);

CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    visitor_id INT,
    device_id INT,
    source_id INT,
    session_start DATETIME,
    session_end DATETIME,
    session_duration INT,
    FOREIGN KEY (visitor_id) REFERENCES visitors(visitor_id),
    FOREIGN KEY (device_id) REFERENCES devices(device_id),
    FOREIGN KEY (source_id) REFERENCES traffic_sources(source_id)
);

CREATE TABLE page_views (
    page_view_id INT PRIMARY KEY,
    session_id INT,
    page_url VARCHAR(255),
    view_timestamp DATETIME,
    time_spent_seconds INT,
    page_title VARCHAR(255),
    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    session_id INT,
    event_type VARCHAR(50),
    event_timestamp DATETIME,
    element_clicked VARCHAR(100),
    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

