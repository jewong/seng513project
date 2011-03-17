DROP TABLE IF EXISTS users; 
CREATE TABLE users (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		name TEXT NOT NULL,
		email TEXT NOT NULL,
		facebook_account TEXT,
		twitter_account TEXT,
		password TEXT NOT NULL,
		neighborhood TEXT,
		postal_code TEXT,
		created DATETIME DEFAULT CURRENT_TIMESTAMP,
		reputation_score INTEGER,
		isEditor INTEGER
		);

DROP TABLE IF EXISTS issues;
CREATE TABLE issues (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		user_id INTEGER NOT NULL,
		created DATETIME DEFAULT CURRENT_TIMESTAMP,
		lastModified DATETIME DEFAULT CURRENT_TIMESTAMP,
		status TEXT,
		title TEXT,
		description TEXT,
		link TEXT,
		location TEXT
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		user_id INTEGER NOT NULL,
		issue_id INTEGER NOT NULL,
		created DATETIME DEFAULT CURRENT_TIMESTAMP,
		content TEXT,
		likes INTEGER DEFAULT 0,
		dislikes INTEGER DEFAULT 0
		);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	tag TEXT UNIQUE
);

DROP TABLE IF EXISTS issuetags;
CREATE TABLE issuetags (
	issue_id INTEGER,
	tag_id INTEGER
);

DROP TABLE IF EXISTS votes;		
CREATE TABLE votes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	issue_id INTEGER NOT NULL,
	vote INTEGER NOT NULL
);
		
DROP TABLE IF EXISTS follows;
CREATE TABLE follows (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	issue_id INTEGER NOT NULL
);
		
DROP TABLE IF EXISTS interests; 
CREATE TABLE interests (
	user_id INTEGER NOT NULL,
	interest_topic TEXT,
	interest_location TEXT
);


-- Table used for storing the user votes on comments
DROP TABLE IF EXISTS cmntvotes;		
CREATE TABLE cmntvotes (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		user_id INTEGER NOT NULL,
		comment_id INTEGER NOT NULL
		);