-- 使用 clothing 数据库
USE `clothing`;

-- 如果表存在则删除
DROP TABLE IF EXISTS `ClothingOrderDetail`;

CREATE TABLE ClothingOrderDetail (
    orderNo VARCHAR(32) NOT NULL,
    lineNo INT NOT NULL,
    productCode VARCHAR(32) NOT NULL,
    colorId INT NOT NULL,
    sizeId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    remark VARCHAR(255) NULL,
    createdDate DATETIME NOT NULL,
    updatedDate DATETIME NULL,
    deletedDate DATETIME NULL,
    createdUser VARCHAR(50) NOT NULL,
    updatedUser VARCHAR(50) NULL,
    PRIMARY KEY (orderNo, lineNo),
    FOREIGN KEY (orderNo) REFERENCES ClothingOrder(orderNo),
    FOREIGN KEY (productCode) REFERENCES Product(productCode),
    FOREIGN KEY (colorId) REFERENCES Color(colorId),
    FOREIGN KEY (sizeId) REFERENCES Size(sizeId)
);