
CREATE DATABASE pharm_engine_test CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE pharm_engine_development CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE pharm_engine_production CHARACTER SET utf8 COLLATE utf8_general_ci;

use pharm_engine_development;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `is_locked` int(11) DEFAULT NULL,
  `archived` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_first_time` int(11) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `email`, `salt`, `is_locked`, `archived`, `created_at`, `updated_at`, `hashed_password`, `role_id`, `is_first_time`, `failed_attempts`) VALUES
(1, 'Test', 'User', 'TUser', NULL, 'tuser@email.com', NULL, NULL, NULL, '2014-02-02 14:42:14', '2014-02-02 14:42:14', NULL, NULL, NULL, NULL),
(2, 'sample', 'sample', 'sample', NULL, 'sample@email.com', 'V8MndoiFXo', NULL, NULL, '2014-02-08 10:07:30', '2014-02-08 10:07:30', 'f2a182d284d8f5ad5d71e213eece14c76242a654', NULL, NULL, NULL),
(3, 'favourite', 'admin', 'msieu', NULL, 'msieu@sage.co.ke', 'HNpXGrjClc', NULL, NULL, '2014-02-08 10:35:20', '2014-02-08 10:35:20', 'e331f83d5379d4363d3f91b53cbd2da890da311e', NULL, NULL, NULL),
(4, 'another', 'users', 'robot', NULL, 'robot@sage.co.ke', 'g7PQColOOu', NULL, NULL, '2014-02-08 10:52:11', '2014-02-08 10:52:11', '28f3c4e84200ae1031d185ae350c567e69b694a4', NULL, NULL, NULL),
(5, 'Rick', 'Dees', 'rickd', NULL, 'rickd@rick.com', 'TJuqDkaNUu', NULL, NULL, '2014-02-08 12:11:40', '2014-02-08 13:27:52', '09c19a9e42d55137fdeea7c834b0bdedf863fe47', NULL, 0, 0),
(6, 'sage_admin', 'sage_admin', 'sage_admin', NULL, 'sage@sage.com', '8AMf5klxLL', NULL, NULL, '2014-02-08 16:00:48', '2014-02-08 16:00:48', 'f91a4b8daca77ea0a4653c11612635701e60701e', NULL, 1, 0);
