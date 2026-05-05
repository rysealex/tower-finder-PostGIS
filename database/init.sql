-- enable PostGIS extension first
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS cell_towers (
    node_id SERIAL PRIMARY KEY,
    node_name VARCHAR(100) NOT NULL,
    ip_address INET UNIQUE,
    status VARCHAR(20) DEFAULT 'active',
    location GEOMETRY(Point, 4326),
    last_checked TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS maintenance_logs (
    log_id SERIAL PRIMARY KEY,
    node_id INTEGER REFERENCES cell_towers(node_id) ON DELETE CASCADE,
    issue_description TEXT,
    service_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO cell_towers (node_name, ip_address, status, location)
VALUES 
('Tower-107811856', '10.0.0.0', 'active', ST_SetSRID(ST_MakePoint(-122.3371, 47.7082), 4326)),
('Tower-108193807', '10.0.0.1', 'active', ST_SetSRID(ST_MakePoint(-122.2887, 47.8087), 4326)),
('Tower-107919376', '10.0.0.2', 'active', ST_SetSRID(ST_MakePoint(-122.012, 47.7227), 4326)),
('Tower-108299024', '10.0.0.3', 'active', ST_SetSRID(ST_MakePoint(-122.4482, 47.161), 4326)),
('Tower-108297745', '10.0.0.4', 'active', ST_SetSRID(ST_MakePoint(-122.4853, 47.1676), 4326)),
('Tower-108293905', '10.0.0.5', 'active', ST_SetSRID(ST_MakePoint(-122.5507, 47.1238), 4326)),
('Tower-108315408', '10.0.0.6', 'active', ST_SetSRID(ST_MakePoint(-122.5044, 47.2569), 4326)),
('Tower-107880977', '10.0.0.7', 'active', ST_SetSRID(ST_MakePoint(-121.8327, 47.5141), 4326)),
('Tower-107884303', '10.0.0.8', 'active', ST_SetSRID(ST_MakePoint(-121.8349, 47.5355), 4326)),
('Tower-107883535', '10.0.0.9', 'active', ST_SetSRID(ST_MakePoint(-121.8466, 47.5319), 4326)),
('Tower-107982865', '10.0.0.10', 'active', ST_SetSRID(ST_MakePoint(-122.3099, 47.2906), 4326)),
('Tower-107982864', '10.0.0.11', 'active', ST_SetSRID(ST_MakePoint(-122.3186, 47.2859), 4326)),
('Tower-108307985', '10.0.0.12', 'active', ST_SetSRID(ST_MakePoint(-122.4584, 47.2309), 4326)),
('Tower-108306448', '10.0.0.13', 'active', ST_SetSRID(ST_MakePoint(-122.4702, 47.1988), 4326)),
('Tower-107883023', '10.0.0.14', 'active', ST_SetSRID(ST_MakePoint(-121.9929, 47.5358), 4326)),
('Tower-107629329', '10.0.0.15', 'active', ST_SetSRID(ST_MakePoint(-119.1236, 46.2169), 4326)),
('Tower-84655121', '10.0.0.16', 'active', ST_SetSRID(ST_MakePoint(-122.61, 45.5646), 4326)),
('Tower-108199185', '10.0.0.17', 'active', ST_SetSRID(ST_MakePoint(-122.1926, 47.8307), 4326)),
('Tower-107810833', '10.0.0.18', 'active', ST_SetSRID(ST_MakePoint(-122.3442, 47.7081), 4326)),
('Tower-107810832', '10.0.0.19', 'active', ST_SetSRID(ST_MakePoint(-122.3484, 47.7017), 4326)),
('Tower-108196113', '10.0.0.20', 'active', ST_SetSRID(ST_MakePoint(-122.2779, 47.8236), 4326)),
('Tower-109936916', '10.0.0.21', 'active', ST_SetSRID(ST_MakePoint(-122.26, 47.5917), 4326)),
('Tower-26201', '10.0.0.22', 'active', ST_SetSRID(ST_MakePoint(-118.6216, 45.5898), 4326)),
('Tower-108196112', '10.0.0.23', 'active', ST_SetSRID(ST_MakePoint(-122.2921, 47.8193), 4326)),
('Tower-108199184', '10.0.0.24', 'active', ST_SetSRID(ST_MakePoint(-122.1767, 47.8128), 4326)),
('Tower-31211', '10.0.0.25', 'active', ST_SetSRID(ST_MakePoint(-122.3967, 47.2385), 4326)),
('Tower-2723', '10.0.0.26', 'active', ST_SetSRID(ST_MakePoint(-122.355, 47.6219), 4326)),
('Tower-3251', '10.0.0.27', 'active', ST_SetSRID(ST_MakePoint(-122.3713, 47.5715), 4326)),
('Tower-108091920', '10.0.0.28', 'active', ST_SetSRID(ST_MakePoint(-122.2637, 47.3823), 4326)),
('Tower-16191', '10.0.0.29', 'active', ST_SetSRID(ST_MakePoint(-122.4969, 45.5217), 4326)),
('Tower-16192', '10.0.0.30', 'active', ST_SetSRID(ST_MakePoint(-122.4777, 45.5102), 4326)),
('Tower-26341', '10.0.0.31', 'active', ST_SetSRID(ST_MakePoint(-122.5216, 45.5586), 4326)),
('Tower-30992', '10.0.0.32', 'active', ST_SetSRID(ST_MakePoint(-122.4, 48.9468), 4326)),
('Tower-59211', '10.0.0.33', 'active', ST_SetSRID(ST_MakePoint(-122.4415, 48.9616), 4326)),
('Tower-59213', '10.0.0.34', 'active', ST_SetSRID(ST_MakePoint(-122.496, 48.9572), 4326)),
('Tower-3603', '10.0.0.35', 'active', ST_SetSRID(ST_MakePoint(-122.4934, 48.9168), 4326)),
('Tower-3601', '10.0.0.36', 'active', ST_SetSRID(ST_MakePoint(-122.4839, 48.9456), 4326)),
('Tower-108009744', '10.0.0.37', 'active', ST_SetSRID(ST_MakePoint(-122.4567, 47.5403), 4326)),
('Tower-8371', '10.0.0.38', 'active', ST_SetSRID(ST_MakePoint(-122.2937, 47.6582), 4326)),
('Tower-107625489', '10.0.0.39', 'active', ST_SetSRID(ST_MakePoint(-119.2627, 46.2628), 4326)),
('Tower-108232969', '10.0.0.40', 'active', ST_SetSRID(ST_MakePoint(-122.239, 48.5061), 4326)),
('Tower-107626776', '10.0.0.41', 'active', ST_SetSRID(ST_MakePoint(-119.1774, 46.1875), 4326)),
('Tower-107626768', '10.0.0.42', 'active', ST_SetSRID(ST_MakePoint(-119.2947, 46.207), 4326)),
('Tower-107633431', '10.0.0.43', 'active', ST_SetSRID(ST_MakePoint(-119.1433, 46.2498), 4326)),
('Tower-107634191', '10.0.0.44', 'active', ST_SetSRID(ST_MakePoint(-119.2442, 46.2057), 4326)),
('Tower-108231432', '10.0.0.45', 'active', ST_SetSRID(ST_MakePoint(-122.2992, 48.4466), 4326)),
('Tower-108231433', '10.0.0.46', 'active', ST_SetSRID(ST_MakePoint(-122.3277, 48.4288), 4326)),
('Tower-108229898', '10.0.0.47', 'active', ST_SetSRID(ST_MakePoint(-122.3354, 48.4481), 4326)),
('Tower-107625487', '10.0.0.48', 'active', ST_SetSRID(ST_MakePoint(-119.2398, 46.2394), 4326)),
('Tower-107810057', '10.0.0.49', 'active', ST_SetSRID(ST_MakePoint(-122.328, 47.6943), 4326))
ON CONFLICT (ip_address) DO NOTHING;