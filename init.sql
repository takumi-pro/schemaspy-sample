CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "email" VARCHAR(255) NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "articles" (
  "id" uuid PRIMARY KEY,
  "title" VARCHAR(255) NOT NULL,
  "body" TEXT,
  "user_id" uuid REFERENCES users(id),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "comments" (
  "id" uuid PRIMARY KEY,
  "article_id" uuid REFERENCES articles(id),
  "user_id" uuid REFERENCES users(id),
  "body" TEXT,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);