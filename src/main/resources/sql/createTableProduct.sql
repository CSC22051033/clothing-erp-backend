USE clothing;     -- 使用 clothing 数据库
DROP TABLE IF EXISTS `Product`;    -- 如果表存在则删除
CREATE TABLE Product (
    productCode VARCHAR(32) PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    unitId INT NOT NULL,
    FOREIGN KEY (unitId) REFERENCES Unit(unitId)
);