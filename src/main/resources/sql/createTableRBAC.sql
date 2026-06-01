USE clothing;     -- 使用 clothing 数据库
-- RBAC（基于角色的访问控制）

-- 先删除有外键依赖的子表
DROP TABLE IF EXISTS `RolePermission`;
DROP TABLE IF EXISTS `UserRole`;

-- 再删除父表
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `Role`;
DROP TABLE IF EXISTS `Permission`;

CREATE TABLE `User` (
    `userId`   INT          NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50)  NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `realName` VARCHAR(50)  NULL,
    `status`   TINYINT      NOT NULL,
    PRIMARY KEY (`userId`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Role` (
    `roleId`   INT         NOT NULL AUTO_INCREMENT,
    `roleName` VARCHAR(50) NOT NULL,
    `roleCode` VARCHAR(50) NOT NULL,
    `status`   TINYINT     NOT NULL,
    PRIMARY KEY (`roleId`),
    UNIQUE KEY `uk_roleName` (`roleName`),
    UNIQUE KEY `uk_roleCode` (`roleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Permission` (
    `permId`   INT          NOT NULL AUTO_INCREMENT,
    `permCode` VARCHAR(100) NOT NULL,
    `permName` VARCHAR(50)  NOT NULL,
    PRIMARY KEY (`permId`),
    UNIQUE KEY `uk_permCode` (`permCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `UserRole` (
    `userId` INT NOT NULL,
    `roleId` INT NOT NULL,
    PRIMARY KEY (`userId`, `roleId`),
    KEY `fk_userrole_roleId` (`roleId`),
    CONSTRAINT `fk_userrole_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_userrole_roleId` FOREIGN KEY (`roleId`) REFERENCES `Role` (`roleId`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `RolePermission` (
    `roleId` INT NOT NULL,
    `permId` INT NOT NULL,
    PRIMARY KEY (`roleId`, `permId`),
    KEY `fk_rolepermission_permId` (`permId`),
    CONSTRAINT `fk_rolepermission_roleId` FOREIGN KEY (`roleId`) REFERENCES `Role` (`roleId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_rolepermission_permId` FOREIGN KEY (`permId`) REFERENCES `Permission` (`permId`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

