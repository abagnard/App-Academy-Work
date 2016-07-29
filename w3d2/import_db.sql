CREATE TABLE users
(
id integer PRIMARY KEY,
fname varchar(255) NOT NULL,
lname varchar(255) NOT NULL
);

INSERT INTO
  users (fname,lname)
VALUES
  ('Joshua','Yang'),
  ('Alexa','Bagnard');

CREATE TABLE questions
(
  id integer PRIMARY KEY,
  title varchar(255) NOT NULL,
  body text NOT NULL,
  user_id integer NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  questions(title,body,user_id)
VALUES
  ('How to eat pie?','I tried to eat pie yesterday and I couldn''t do it, what should I try?',(SELECT id FROM users WHERE fname = 'Alexa')),
  ('Where are my pants?','I did my laundry and the machine my jeans. Where did it go?',(SELECT id FROM users WHERE fname = 'Joshua'));


CREATE TABLE question_follows
(
  id integer PRIMARY KEY,
  user_id integer NOT NULL,
  question_id integer NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Alexa"),
  (SELECT id FROM questions WHERE title = 'How to eat pie?')),

  ((SELECT id FROM users WHERE fname = "Joshua"),
  (SELECT id FROM questions WHERE title = 'How to eat pie?')
);

CREATE TABLE replies
(
  id integer PRIMARY KEY,
  question_id integer NOT NULL,
  reply_id integer,
  user_id integer NOT NULL,
  body text NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO
  replies (question_id, reply_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'How to eat pie?'),
  NULL,
  (SELECT id FROM users WHERE fname = "Joshua"),
  "Have you tried a fork?"
);

INSERT INTO
  replies (question_id, reply_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'How to eat pie?'),
  (SELECT id FROM replies WHERE body = "Have you tried a fork?"),
  (SELECT id FROM users WHERE fname = 'Alexa'),
  "Obviously."
);

CREATE TABLE question_likes
(
  id integer PRIMARY KEY,
  question_id integer NOT NULL,
  user_id integer NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (1, 2);
