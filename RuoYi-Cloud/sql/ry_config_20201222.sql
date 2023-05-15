/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : ry-config

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 01/02/2021 20:32:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', 'c07e6f7321493f6d5390d0a08bffb75a', '2019-11-29 16:31:20', '2021-01-31 13:09:09', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (2, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 业务模块\n        - id: business\n          uri: lb://business\n          predicates:\n            - Path=/business/**\n          filters:\n            - StripPrefix=1\n\n# 不校验白名单\nignore:\n  whites:\n    - /auth/logout\n    - /auth/login\n    - /*/v2/api-docs\n    - /csrf\n    - /business/test', 'b19e448059121fc9a81c689be4134831', '2020-05-14 14:17:55', '2021-01-31 10:07:44', NULL, '0:0:0:0:0:0:0:1', '', '', '网关模块', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (3, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', 'spring: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n  redis:\n    host: localhost\n    port: 6379\n    password: \n', 'c85923677272e059ca95e1fa7d188e30', '2020-11-20 00:00:00', '2021-01-27 12:00:13', NULL, '0:0:0:0:0:0:0:1', '', '', '认证中心', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (4, 'ruoyi-monitor-dev.yml', 'DEFAULT_GROUP', '# spring\r\nspring: \r\n  security:\r\n    user:\r\n      name: ruoyi\r\n      password: 123456\r\n  boot:\r\n    admin:\r\n      ui:\r\n        title: 若依服务状态监控\r\n', 'd8997d0707a2fd5d9fc4e8409da38129', '2020-11-20 00:00:00', '2020-12-21 16:28:07', NULL, '0:0:0:0:0:0:0:1', '', '', '监控中心', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (5, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'f93fa9de25e32c46fb28cf07b54aa892', '2020-11-20 00:00:00', '2021-01-31 13:10:12', NULL, '0:0:0:0:0:0:0:1', '', '', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (6, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource: \n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n\n# 代码生成\ngen: \n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.ruoyi.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n', '8e35d6c424207ec67c775dd49b8597e1', '2020-11-20 00:00:00', '2021-01-27 12:01:15', NULL, '0:0:0:0:0:0:0:1', '', '', '代码生成', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (7, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: 123456\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.job.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 定时任务接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', '373abe9658b19535ca2a9ff37eb04a48', '2020-11-20 00:00:00', '2021-01-27 12:01:28', NULL, '0:0:0:0:0:0:0:1', '', '', '定时任务', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'ruoyi-file-dev.yml', 'DEFAULT_GROUP', '# 本地文件上传    \r\nfile:\r\n    domain: http://127.0.0.1:9300\r\n    path: D:/ruoyi/uploadPath\r\n    prefix: /statics\r\n\r\n# FastDFS配置\r\nfdfs:\r\n  domain: http://8.129.231.12\r\n  soTimeout: 3000\r\n  connectTimeout: 2000\r\n  trackerList: 8.129.231.12:22122\r\n\r\n# Minio配置\r\nminio:\r\n  url: http://8.129.231.12:9000\r\n  accessKey: minioadmin\r\n  secretKey: minioadmin\r\n  bucketName: test', '5382b93f3d8059d6068c0501fdd41195', '2020-11-20 00:00:00', '2020-12-21 21:01:59', NULL, '0:0:0:0:0:0:0:1', '', '', '文件服务', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (9, 'sentinel-ruoyi-gateway', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"resource\": \"ruoyi-auth\",\r\n        \"count\": 500,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-system\",\r\n        \"count\": 1000,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-gen\",\r\n        \"count\": 200,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    },\r\n	{\r\n        \"resource\": \"ruoyi-job\",\r\n        \"count\": 300,\r\n        \"grade\": 1,\r\n        \"limitApp\": \"default\",\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0\r\n    }\r\n]', '9f3a3069261598f74220bc47958ec252', '2020-11-20 00:00:00', '2020-11-20 00:00:00', NULL, '0:0:0:0:0:0:0:1', '', '', '限流策略', 'null', 'null', 'json', 'null');
INSERT INTO `config_info` VALUES (10, 'business-dev.yml', 'DEFAULT_GROUP', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.business\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', '4ca40b0d29189fed15cfe8113ebfef2f', '2021-01-31 09:48:59', '2021-01-31 09:51:17', NULL, '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (3, 1, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n', '868c15010a7a15c027d4c90a48aabb3e', '2021-01-27 20:00:13', '2021-01-27 12:00:13', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 2, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\r\nspring: \r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      druid:\r\n        initial-size: 5\r\n        min-idle: 5\r\n        maxActive: 20\r\n        maxWait: 60000\r\n        timeBetweenEvictionRunsMillis: 60000\r\n        minEvictableIdleTimeMillis: 300000\r\n        validationQuery: SELECT 1 FROM DUAL\r\n        testWhileIdle: true\r\n        testOnBorrow: false\r\n        testOnReturn: false\r\n        poolPreparedStatements: true\r\n        maxPoolPreparedStatementPerConnectionSize: 20\r\n        filters: stat,wall,slf4j\r\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\r\n      datasource:\r\n          # 主库数据源\r\n          master:\r\n            driver-class-name: com.mysql.cj.jdbc.Driver\r\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n            username: root\r\n            password: password\r\n          # 从库数据源\r\n          # slave:\r\n            # url: \r\n            # username: \r\n            # password: \r\n            # driver-class-name: \r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 系统模块接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n', 'c8eede0126999265ffb465a21502add7', '2021-01-27 20:00:53', '2021-01-27 12:00:54', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (6, 3, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\r\nspring: \r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  datasource: \r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.gen.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 代码生成接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n\r\n# 代码生成\r\ngen: \r\n  # 作者\r\n  author: ruoyi\r\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\r\n  packageName: com.ruoyi.system\r\n  # 自动去除表前缀，默认是false\r\n  autoRemovePre: false\r\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\r\n  tablePrefix: sys_\r\n', '5554d54c838876bf2372934c0631aa1b', '2021-01-27 20:01:15', '2021-01-27 12:01:15', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 4, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\r\nspring: \r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n\r\n# mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.job.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n', 'b187acdcbfb8be114f0570bc569ca96d', '2021-01-27 20:01:27', '2021-01-27 12:01:28', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'business-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'f93fa9de25e32c46fb28cf07b54aa892', '2021-01-31 17:48:58', '2021-01-31 09:48:59', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (10, 6, 'business-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'f93fa9de25e32c46fb28cf07b54aa892', '2021-01-31 17:51:17', '2021-01-31 09:51:17', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 7, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: ruoyi-auth\r\n          uri: lb://ruoyi-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            - CacheRequestFilter\r\n            - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 代码生成\r\n        - id: ruoyi-gen\r\n          uri: lb://ruoyi-gen\r\n          predicates:\r\n            - Path=/code/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 定时任务\r\n        - id: ruoyi-job\r\n          uri: lb://ruoyi-job\r\n          predicates:\r\n            - Path=/schedule/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: ruoyi-system\r\n          uri: lb://ruoyi-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 文件服务\r\n        - id: ruoyi-file\r\n          uri: lb://ruoyi-file\r\n          predicates:\r\n            - Path=/file/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 不校验白名单\r\nignore:\r\n  whites:\r\n    - /auth/logout\r\n    - /auth/login\r\n    - /*/v2/api-docs\r\n    - /csrf\r\n', 'ef4a58daf989827334b3aac1c9d68392', '2021-01-31 17:53:04', '2021-01-31 09:53:04', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 8, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 业务模块\n        - id: business\n          uri: lb://business\n          predicates:\n            - Path=/business/**\n          filters:\n            - StripPrefix=1\n\n# 不校验白名单\nignore:\n  whites:\n    - /auth/logout\n    - /auth/login\n    - /*/v2/api-docs\n    - /csrf\n', '1d906a6c74edc18f5094f990f119eace', '2021-01-31 18:06:35', '2021-01-31 10:06:35', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 9, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 业务模块\n        - id: business\n          uri: lb://business\n          predicates:\n            - Path=/business/**\n          filters:\n            - StripPrefix=1\n\n# 不校验白名单\nignore:\n  whites:\n    - /auth/logout\n    - /auth/login\n    - /*/v2/api-docs\n    - /csrf\n    - /business/test\n', 'ecb98fcd82aefb7b26de748727aa4caa', '2021-01-31 18:07:17', '2021-01-31 10:07:18', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 10, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password: \n  cloud:\n    gateway:\n      discovery:\n        locator:\n          lowerCaseServiceId: true\n          enabled: true\n      routes:\n        # 认证中心\n        - id: ruoyi-auth\n          uri: lb://ruoyi-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - CacheRequestFilter\n            - ValidateCodeFilter\n            - StripPrefix=1\n        # 代码生成\n        - id: ruoyi-gen\n          uri: lb://ruoyi-gen\n          predicates:\n            - Path=/code/**\n          filters:\n            - StripPrefix=1\n        # 定时任务\n        - id: ruoyi-job\n          uri: lb://ruoyi-job\n          predicates:\n            - Path=/schedule/**\n          filters:\n            - StripPrefix=1\n        # 系统模块\n        - id: ruoyi-system\n          uri: lb://ruoyi-system\n          predicates:\n            - Path=/system/**\n          filters:\n            - StripPrefix=1\n        # 文件服务\n        - id: ruoyi-file\n          uri: lb://ruoyi-file\n          predicates:\n            - Path=/file/**\n          filters:\n            - StripPrefix=1\n        # 业务模块\n        - id: business\n          uri: lb://business\n          predicates:\n            - Path=/business/**\n          filters:\n            - StripPrefix=1\n\n# 不校验白名单\nignore:\n  whites:\n    - /auth/logout\n    - /auth/login\n    - /*/v2/api-docs\n    - /csrf\n', '1d906a6c74edc18f5094f990f119eace', '2021-01-31 18:07:43', '2021-01-31 10:07:44', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 11, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'f93fa9de25e32c46fb28cf07b54aa892', '2021-01-31 21:04:49', '2021-01-31 13:04:49', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 12, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置1\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'a30a88e878d38b25468a77bdb7967594', '2021-01-31 21:04:58', '2021-01-31 13:04:58', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 13, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          # 主库数据源\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # 从库数据源\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.system\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'f93fa9de25e32c46fb28cf07b54aa892', '2021-01-31 21:05:56', '2021-01-31 13:05:56', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 14, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', 'spring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\nmybatis:\n    typeAliasesPackage: com.ruoyi.system\n    mapperLocations: classpath:mapper/**/*.xml\n\nswagger:\n  title: 系统模块接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 客户端授权范围\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'cf557467099f6785bad67eb272ea754a', '2021-01-31 21:06:37', '2021-01-31 13:06:37', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 15, 'application-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', 'c07e6f7321493f6d5390d0a08bffb75a', '2021-01-31 21:07:37', '2021-01-31 13:07:37', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 16, 'application-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  main:\n    allow-bean-definition-overriding: true\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n', '6af45a81f0bd76b94f352ce11766afa4', '2021-01-31 21:09:09', '2021-01-31 13:09:09', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (5, 17, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', 'spring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n          master:\n            driver-class-name: com.mysql.cj.jdbc.Driver\n            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n            username: root\n            password: 123456\n          # slave:\n            # url: \n            # username: \n            # password: \n            # driver-class-name: \n\nmybatis:\n    typeAliasesPackage: com.ruoyi.system\n    mapperLocations: classpath:mapper/**/*.xml\n\nswagger:\n  title: 1\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n  authorization:\n    name: RuoYi OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: 1\n    token-url-list:\n      - http://localhost:8080/auth/oauth/token\n', 'a667884cc0689226f8f974dc0696556e', '2021-01-31 21:10:12', '2021-01-31 13:10:12', NULL, '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
