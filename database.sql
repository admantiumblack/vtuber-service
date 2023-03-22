-- Create Company table

CREATE TABLE company(
    id INT NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Populate company table

INSERT INTO company(name) VALUES
(),
(),
();

-- Create vtuber table

CREATE TABLE vtuber(
    id INT NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    channel_name varchar(255) NOT NULL, 
    PRIMARY KEY (id)
);

-- Populate vtuber table

INSERT INTO vtuber() VALUES 
(),
(),
();

-- Create company mapping table

CREATE TABLE company_mapping(
    id INT NOT NULL AUTO_INCREMENT,
    company_id INT NOT NULL,
    vtuber_id INT NOT NULL,
    begin_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id),
    index(company_id),
    index(vtuber_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (vtuber_id) REFERENCES vtuber(id)
);

-- Populate company mapping table

INSERT INTO company_mapping() VALUES
(),
(),
();


-- Create stream platform table

CREATE TABLE stream_platform(
    id INT NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);


-- Populate stream platform table

INSERT INTO stream_platform(name) VALUES
(),
(),
();

-- Create platfrom mapping table 

CREATE TABLE platform_mapping(
    id INT NOT NULL AUTO_INCREMENT,
    -- this one rol idk rada weird channel ID dri mana also Platform ID dari mana juga 
    -- also manggil channel name di table ini tpi dia bukan PK di table vtuber
);

-- Populate platform_mapping table 

INSERT INTO platform_mapping() VALUES 
(),
(),
();

-- Create spotify table 

CREATE TABLE spotify(
    id INT NOT NULL AUTO_INCREMENT,
    vtuber_id INT NOT NULL,
    PRIMARY KEY(id),
    index(vtuber_id),
    FOREIGN KEY (vtuber_id) REFERENCES vtuber(id)
);

-- Populate spotify table 

INSERT INTO spotify() VALUES
(),
(),
();

-- Create playlist table 

CREATE TABLE playlist(
    id INT NOT NULL AUTO_INCREMENT,
    type text,
    -- again channel id come from where? 
    PRIMARY KEY (id)
);

-- Populate playlist table

INSERT INTO playlist() VALUES 
(),
(),
();