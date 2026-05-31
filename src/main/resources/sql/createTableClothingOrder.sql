-- 使用 clothing 数据库
USE `clothing`;

-- 如果表存在则删除
DROP TABLE IF EXISTS `ClothingOrder`;

CREATE TABLE ClothingOrder (
    orderNo VARCHAR(32) PRIMARY KEY,
    status TINYINT NOT NULL,
    orderDate DATETIME NOT NULL,
    maker VARCHAR(50) NOT NULL,
    customerId INT NOT NULL,
    remark TEXT NULL,
    createdDate DATETIME NOT NULL,
    updatedDate DATETIME NULL,
    deletedDate DATETIME NULL,
    createdUser VARCHAR(50) NOT NULL,
    updatedUser VARCHAR(50) NULL,
    FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);