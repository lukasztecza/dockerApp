CREATE TABLE IF NOT EXISTS `names` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(64) COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `items` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(64) COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
