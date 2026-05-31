USE clothing;

CREATE VIEW v_ClothingOrderDetail AS(
    SELECT
        o.orderNo,
        o.status,
        o.orderDate,
        o.maker,
        o.customerId,
        c.customerName,
        c.phone,
        c.address,
        o.remark AS orderRemark,
        d.lineNo,
        d.productCode,
        p.productName,
        p.unitId,
        u.unitName,
        d.colorId,
        col.colorName,
        d.sizeId,
        s.sizeName,
        d.quantity,
        d.price,
        (d.quantity * d.price) AS amount,   -- 明细金额
        d.remark AS detailRemark
    FROM
        ClothingOrder o
            INNER JOIN ClothingOrderDetail d ON o.orderNo = d.orderNo
            LEFT JOIN Customer c ON o.customerId = c.customerId
            LEFT JOIN Product p ON d.productCode = p.productCode
            LEFT JOIN Unit u ON p.unitId = u.unitId
            LEFT JOIN Color col ON d.colorId = col.colorId
            LEFT JOIN Size s ON d.sizeId = s.sizeId
)