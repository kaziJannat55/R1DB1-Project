-- 1. Create the database
CREATE DATABASE IF NOT EXISTS tic_tac_toe;

-- 2. Use the created database
USE tic_tac_toe;

-- 3. Create the games table to store game information
CREATE TABLE IF NOT EXISTS games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    player_x VARCHAR(255) NOT NULL,
    player_o VARCHAR(255) NOT NULL,
    status ENUM('in progress', 'won', 'draw') NOT NULL,
    current_turn ENUM('X', 'O') NOT NULL
);

-- 4. Create the moves table to store each move made during the game
CREATE TABLE IF NOT EXISTS moves (
    move_id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT,
    player ENUM('X', 'O') NOT NULL,
    position INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

-- 5. Insert demo data into the games table
-- This creates a game between Player1 (X) and Player2 (O)
INSERT INTO games (player_x, player_o, status, current_turn)
VALUES ('Player1', 'Player2', 'in progress', 'X');

-- 6. Insert demo moves (Player1 and Player2 making moves)
-- Player1 makes a move at position 0
INSERT INTO moves (game_id, player, position)
VALUES (1, 'X', 0);

-- Player2 makes a move at position 1
INSERT INTO moves (game_id, player, position)
VALUES (1, 'O', 1);

-- Player1 makes a move at position 4 (center)
INSERT INTO moves (game_id, player, position)
VALUES (1, 'X', 4);

-- Player2 makes a move at position 3
INSERT INTO moves (game_id, player, position)
VALUES (1, 'O', 3);

-- Player1 makes a move at position 8 (bottom-right) - Player1 wins
INSERT INTO moves (game_id, player, position)
VALUES (1, 'X', 8);

-- 7. Sample Query 1: Get the current status of the game
SELECT player_x, player_o, status, current_turn
FROM games
WHERE game_id = 1;

-- 8. Sample Query 2: Get all moves made in the game
SELECT player, position
FROM moves
WHERE game_id = 1
ORDER BY move_id;

-- 9. Sample Query 3: Update the game status to "won" when Player1 wins
UPDATE games
SET status = 'won', current_turn = 'X'
WHERE game_id = 1;

-- 10. Sample Query 4: Reset the game by deleting the moves and game records
DELETE FROM moves WHERE game_id = 1;
DELETE FROM games WHERE game_id = 1;

-- 11. Insert a new game after reset (starting new game)
INSERT INTO games (player_x, player_o, status, current_turn)
VALUES ('Player1', 'Player2', 'in progress', 'X');
