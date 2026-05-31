-- 使用 clothing 数据库
USE `clothing`;

-- 如果表存在则删除
DROP TABLE IF EXISTS `Color`;

-- 创建表
CREATE TABLE `Color` (
    `colorId`   INT           NOT NULL AUTO_INCREMENT,
    `colorName` VARCHAR(50)   NOT NULL,
    PRIMARY KEY (`colorId`),
    UNIQUE KEY `uk_colorName` (`colorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='颜色表';