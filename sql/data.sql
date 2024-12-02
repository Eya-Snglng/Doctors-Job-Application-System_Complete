CREATE TABLE job_applicants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    specialization VARCHAR(100) NOT NULL,
    experience INT NOT NULL,
    hospital VARCHAR(150) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    date_applied DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert 35 sample records with unique names and different dates
INSERT INTO job_applicants (first_name, last_name, email, specialization, experience, hospital, phone_number, date_applied) 
VALUES
("John", "Doe", "johndoe@example.com", "Cardiology", 5, "Saint Mary''s Hospital", "123-456-7890", "2024-11-01 09:15:30"),
("Jane", "Smith", "janesmith@example.com", "Neurology", 7, "General Hospital", "234-567-8901", "2024-11-01 10:10:45"),
("Alice", "Johnson", "alicejohnson@example.com", "Pediatrics", 3, "Children''s Health Center", "345-678-9012", "2024-11-02 08:00:10"),
("David", "Brown", "davidbrown@example.com", "Orthopedics", 10, "City Health Center", "456-789-0123", "2024-11-02 12:45:20"),
("Emma", "Wilson", "emmawilson@example.com", "Dermatology", 4, "Skin Care Clinic", "567-890-1234", "2024-11-03 14:25:35"),
("Chris", "Taylor", "christaylor@example.com", "Cardiology", 8, "Heart & Vascular Center", "678-901-2345", "2024-11-03 15:30:50"),
("Sophia", "Martinez", "sophiamartinez@example.com", "Gynecology", 6, "Women''s Health Center", "789-012-3456", "2024-11-04 11:00:15"),
("Michael", "Garcia", "michaelgarcia@example.com", "Oncology", 12, "Cancer Treatment Center", "890-123-4567", "2024-11-04 13:10:40"),
("Olivia", "Anderson", "oliviaanderson@example.com", "Neurology", 2, "NeuroCare Hospital", "901-234-5678", "2024-11-05 07:50:05"),
("Ethan", "Thomas", "ethanthomas@example.com", "Radiology", 9, "Radiology Experts", "123-345-6789", "2024-11-05 09:35:55"),
("Isabella", "White", "isabellawhite@example.com", "Orthopedics", 3, "Orthopedic Specialists", "234-456-7890", "2024-11-06 10:15:20"),
("Liam", "Harris", "liamharris@example.com", "Gastroenterology", 15, "Digestive Health Center", "345-567-8901", "2024-11-06 13:00:30"),
("Ava", "Lewis", "avalewis@example.com", "Cardiology", 7, "Heart Specialists", "456-678-9012", "2024-11-07 11:10:00"),
("William", "Walker", "williamwalker@example.com", "Pulmonology", 5, "Respiratory Center", "567-789-0123", "2024-11-07 16:20:25"),
("Emily", "Hall", "emilyhall@example.com", "Pediatrics", 8, "Children''s Clinic", "678-890-1234", "2024-11-08 09:45:55"),
("James", "Young", "jamesyoung@example.com", "Orthopedics", 4, "Orthopedic Health Center", "789-901-2345", "2024-11-08 10:55:10"),
("Charlotte", "King", "charlotteking@example.com", "Oncology", 6, "Cancer Care Center", "890-012-3456", "2024-11-09 12:30:20"),
("Benjamin", "Scott", "benjaminscott@example.com", "Dermatology", 3, "Skin Solutions Clinic", "901-123-4567", "2024-11-09 14:00:35"),
("Amelia", "Green", "ameliagreen@example.com", "Neurology", 11, "Brain & Spine Institute", "123-234-5678", "2024-11-10 16:10:50"),
("Lucas", "Adams", "lucasadams@example.com", "Gynecology", 2, "Women''s Wellness Center", "234-345-6789", "2024-11-10 17:25:05"),
("Harper", "Baker", "harperbaker@example.com", "Pulmonology", 9, "Lung Specialists", "345-456-7890", "2024-11-11 18:00:00"),
("Henry", "Gonzalez", "henrygonzalez@example.com", "Pediatrics", 10, "Kids'' Health Center", "456-567-8901", "2024-11-12 09:15:10"),
("Evelyn", "Nelson", "evelynnelson@example.com", "Cardiology", 5, "Heart Institute", "567-678-9012", "2024-11-12 10:45:50"),
("Alexander", "Carter", "alexandercarter@example.com", "Neurology", 4, "NeuroSpecialists", "678-789-0123", "2024-11-13 12:30:40"),
("Mia", "Mitchell", "miamitchell@example.com", "Dermatology", 6, "Dermatology Experts", "789-890-1234", "2024-11-13 13:05:15"),
("Daniel", "Perez", "danielperez@example.com", "Orthopedics", 8, "Bone & Joint Center", "890-901-2345", "2024-11-14 14:10:30"),
("Aria", "Roberts", "ariaroberts@example.com", "Gastroenterology", 7, "Digestive Wellness", "901-012-3456", "2024-11-14 15:25:45"),
("Matthew", "Turner", "matthewturner@example.com", "Oncology", 5, "Cancer Specialists", "123-123-4567", "2024-11-15 16:00:10"),
("Scarlett", "Phillips", "scarlettphillips@example.com", "Pediatrics", 3, "Pediatric Care", "234-234-5678", "2024-11-16 07:30:50"),
("Joseph", "Campbell", "josephcampbell@example.com", "Pulmonology", 10, "Breathing Wellness Center", "345-345-6789", "2024-11-16 10:05:15"),
("Luna", "Parker", "lunaparker@example.com", "Dermatology", 4, "Skin Health Specialists", "456-456-7890", "2024-11-17 09:15:35"),
("Elijah", "Evans", "elijahevans@example.com", "Neurology", 12, "NeuroHealth Center", "567-567-8901", "2024-11-17 11:50:25"),
("Grace", "Edwards", "graceedwards@example.com", "Oncology", 2, "Cancer Care Specialists", "678-678-9012", "2024-11-18 12:30:00"),
("Mason", "Collins", "masoncollins@example.com", "Cardiology", 6, "Heart Care Center", "789-789-0123", "2024-11-19 13:40:15");

CREATE TABLE user_accounts (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	password TEXT,
	date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE activity_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    username VARCHAR(255),
    actions VARCHAR(255),
    action_details TEXT,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_accounts(user_id)
);

ALTER TABLE activity_logs MODIFY user_id INT NULL;
