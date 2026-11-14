-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);



-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES organization(organization_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
);



INSERT INTO service_project (organization_id, title, description, location, project_date)
VALUES
-- BrightFuture Builders (Organization ID: 1)
(1, 'Community Park Pavilion Build', 'Constructing a shaded wooden pavilion and picnic area using reclaimed timber.', 'Central Community Park', '2026-12-05'),
(1, 'Solar Streetlight Installation', 'Installing off-grid solar LED lighting along the main neighborhood walking trail.', 'Oakridge Greenway', '2026-12-12'),
(1, 'Accessible Playground Ramp', 'Building an ADA-compliant wooden wheelchair ramp for the neighborhood playground.', 'Sunset Community Center', '2026-12-19'),
(1, 'Community Garden Toolshed', 'Framing and roofing a weather-resistant storage shed for community gardening tools.', 'Northside Plots', '2027-01-10'),
(1, 'Youth Carpentry Bench Workshop', 'Instructing teenagers on basic woodworking safety while building community benches.', 'BrightFuture Workshop Space', '2027-01-22'),

-- GreenHarvest Growers (Organization ID: 2)
(2, 'Southside Urban Garden Prep', 'Building raised cedar garden beds and preparing organic compost for spring planting.', '412 Southside Ave', '2026-11-28'),
(2, 'School Hydroponics Workshop', 'Setting up indoor hydroponic towers and teaching basic plant science to students.', 'Lincoln Elementary School', '2026-12-10'),
(2, 'Compost Management Seminar', 'Hosting a hands-on community workshop on backyard composting and soil health.', 'GreenHarvest Urban Farm', '2026-12-15'),
(2, 'Orchard Tree Pruning & Care', 'Pruning fruit trees and applying organic mulch to prepare the neighborhood orchard for winter.', 'East End Orchard', '2027-01-08'),
(2, 'Seed Saving & Exchange Fair', 'Collecting, labeling, and packaging heirloom seeds for the upcoming spring growing season.', 'Civic Public Library', '2027-01-30'),

-- UnityServe Volunteers (Organization ID: 3)
(3, 'Winter Coat & Food Drive', 'Sorting donated winter clothing and packing non-perishable food boxes for local families.', 'Downtown Civic Center', '2026-12-02'),
(3, 'Senior Center Tech Literacy Day', 'Helping senior citizens set up smartphones, tablets, and learn basic digital safety.', 'Golden Age Senior Center', '2026-12-14'),
(3, 'Holiday Meal Packing & Delivery', 'Preparing and packaging holiday food boxes for homebound community members.', 'UnityServe Headquarters', '2026-12-23'),
(3, 'Neighborhood River Cleanup', 'Removing plastic waste and debris along the riverbanks to protect local wildlife habitats.', 'Riverside Park Trailhead', '2027-01-14'),
(3, 'After-School Homework Tutoring Hub', 'Volunteering to assist elementary school students with math and reading assignments.', 'Westside Community Club', '2027-01-28');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE service_project_category (
    project_id INT NOT NULL REFERENCES service_project(project_id) ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, category_id)
);

INSERT INTO category (name)
VALUES 
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');


INSERT INTO service_project_category (project_id, category_id)
VALUES
-- BrightFuture Builders (1-5)
(1, 1), (1, 3), -- Community Park Pavilion Build
(2, 1), (2, 3), -- Solar Streetlight Installation
(3, 3), (3, 4), -- Accessible Playground Ramp
(4, 1), (4, 3), -- Community Garden Toolshed
(5, 2), (5, 3), -- Youth Carpentry Bench Workshop

-- GreenHarvest Growers (6-10)
(6, 1), (6, 4), -- Southside Urban Garden Prep
(7, 1), (7, 2), -- School Hydroponics Workshop
(8, 1), (8, 2), -- Compost Management Seminar
(9, 1), (9, 4), -- Orchard Tree Pruning & Care
(10, 1), (10, 3), -- Seed Saving & Exchange Fair

-- UnityServe Volunteers (11-15)
(11, 3), (11, 4), -- Winter Coat & Food Drive
(12, 2), (12, 3), -- Senior Center Tech Literacy Day
(13, 3), (13, 4), -- Holiday Meal Packing & Delivery
(14, 1), (14, 3), -- Neighborhood River Cleanup
(15, 2), (15, 3); -- After-School Homework Tutoring Hub

