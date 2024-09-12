
/* DROP DATABASE MML;

DROP TABLE elencofilme;

DROP TABLE generoFilme;

DROP TABLE pretendeassistirfilme;

DROP TABLE listaFilme;

DROP TABLE filme;

DROP TABLE genero; 

*/

INSERT INTO genero (Nome) VALUES 
('Ação'),('Aventura'),('Comédia'),('Drama'),('Ficção Científica'),('Romance'),('Terror'),('Fantasia'),('Mistério'),('Musical'),
('Documentário'),('Biografia'),('Animação'),('Western'),('Suspense'),('Policial'),('Espionagem'),('Zumbi'),('Pós-apocalíptico'),
('Comédia Romântica');

INSERT INTO filme (Titulo, Sinopse, Lancamento, NotaGeral, IdadeIndicativa, Imagem) VALUES 
('Aventura nas Montanhas', 'Um grupo de amigos enfrenta desafios em uma jornada nas montanhas.', '2024-05-15', 0, 1, 'imagem1.jpg'),
('Mistério na Cidade Antiga', 'Um detetive desvenda segredos em uma cidade histórica cheia de mistérios.', '2024-06-10', 0, 3, 'imagem2.jpg'),
('O Grande Show', 'Uma comédia musical sobre um grupo de artistas em busca do estrelato.', '2024-07-20', 0, 2, 'imagem3.jpg'),
('Noite no Museu', 'Uma aventura mágica em um museu onde os artefatos ganham vida.', '2024-08-25', 0, 1, 'imagem4.jpg'),
('O Último Guerreiro', 'Um épico de ação onde um herói luta contra forças malignas para salvar seu reino.', '2024-09-30', 0, 4, 'imagem5.jpg'),
('Segredos do Espaço', 'Uma ficção científica sobre a exploração do espaço e seus mistérios.', '2024-10-15', 0, 3, 'imagem6.jpg'),
('O Mistério do Castelo', 'Um grupo de jovens investiga eventos sobrenaturais em um antigo castelo.', '2024-11-01', 0, 2, 'imagem7.jpg'), 
('A Jornada do Herói', 'Um jovem herói embarca em uma missão épica para salvar seu reino.', '2024-11-15', 0, 4, 'imagem8.jpg'), 
('A Festa de Aniversário', 'Uma comédia leve sobre uma festa de aniversário que sai do controle.', '2024-12-01', 0, 1, 'imagem9.jpg'), 
('O Tesouro Perdido', 'Uma emocionante busca por um tesouro escondido em uma ilha misteriosa.', '2024-12-15', 0, 3, 'imagem10.jpg'), 
('O Resgate na Selva', 'Uma aventura emocionante de um grupo de amigos resgatando um animal selvagem.', '2025-01-10', 0, 2, 'imagem11.jpg'),
('A Última Fronteira', 'Um drama épico sobre a luta por sobrevivência em um planeta distante.', '2025-01-25', 0, 5, 'imagem12.jpg'), 
('Segredos do Fundo do Mar', 'Uma aventura subaquática em busca de um artefato perdido.', '2025-02-10', 0, 3, 'imagem13.jpg'), 
('A Casa das Sombras', 'Um suspense psicológico envolvendo mistérios em uma casa assombrada.', '2025-02-25', 0, 6, 'imagem14.jpg'), 
('O Dia da Invasão', 'Uma trama de ação e ficção científica sobre uma invasão alienígena.', '2025-03-15', 0, 4, 'imagem15.jpg'); 

INSERT INTO usuario (Usuario, Nome, DtNasc, senha, email, ISAdmin, imagem) VALUES 
('jdoe', 'John Doe', '1990-01-15', 'senha123', 'jdoe@example.com', 0, 'john_doe.jpg'),
('asmith', 'Alice Smith', '1985-07-30', 'senha456', 'asmith@example.com', 1, 'alice_smith.jpg'),
('bgarcia', 'Bob Garcia', '1992-11-22', 'senha789', 'bgarcia@example.com', 0, 'bob_garcia.jpg');

