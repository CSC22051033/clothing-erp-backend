USE clothing;     -- 使用 clothing 数据库

DROP TABLE IF EXISTS `Unit`;    -- 如果表存在则删除

-- 创建表
CREATE TABLE `Unit` (
    `unitId`   INT           NOT NULL AUTO_INCREMENT,
    `unitName` VARCHAR(50)   NOT NULL,
    PRIMARY KEY (`unitId`),
    UNIQUE KEY `uk_unitName` (`unitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单位表';