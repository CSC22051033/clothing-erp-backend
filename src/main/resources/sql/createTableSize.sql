USE clothing;     -- 使用 clothing 数据库

DROP TABLE IF EXISTS `Size`;    -- 如果表存在则删除

-- 创建表
CREATE TABLE `Size` (
    `sizeId`   INT           NOT NULL AUTO_INCREMENT,
    `sizeName` VARCHAR(50)   NOT NULL,
    PRIMARY KEY (`sizeId`),
    UNIQUE KEY `uk_sizeName` (`sizeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='尺码表';