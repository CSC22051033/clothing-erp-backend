USE clothing;     -- 使用 clothing 数据库
DROP TABLE IF EXISTS `Customer`;    -- 如果表存在则删除
CREATE TABLE Customer (
    customerId INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL
);