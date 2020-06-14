<?php
// Project relative definitions
\define("PRJ_ROOT",\dirname(__FILE__));
\define("PRJ_LIBRARY",PRJ_ROOT . "/vendor"); //composer directory
\define("PRJ_APP_DIR",PRJ_ROOT . "/dev"); // /dev for development | /vendor for production
\define ("PRJ_ENABLE_ACCESS_GROUP", true); // Whether or not to switch user access group when logged in
\define("PRJ_DOMAIN","admin-base");
\define("PRJ_BASE_DOMAIN","admin-base"); // Project base/primary domain
\define("PRJ_NAME","admin-base-sosprj");
\define("PRJ_TITLE","Admin Management Portal");
\define("PRJ_DESCRIPTION","Admin Management Portal base app template for 7 OS.");
\define("PRJ_KEYWORDS","tym, frontiers, 7, seven, os, operating, system"); // separate with comma
\define("PRJ_AUTHOR","Ikechukwu Okalia <dev@sirlouis.io>");
\define("PRJ_PUBLISHER","Publisher's Name");
\define("PRJ_CREATOR","Tym Frontiers Ltd <dev@tymfrontiers.com>");
// API app info
\define ("API_APP_NAME","admin-base");
\define ("API_APP_PUKEY","puk-");
\define ("API_APP_PRKEY","prk-");
// project icon check/generate from: https://realfavicongenerator.net/
// path should be relative to domain/project root
\define("PRJ_PRIMARY_COLOUR","#000");
\define("PRJ_SECONDARY_COLOUR","#ffffff");
\define("PRJ_THEME","light"); //7 OS web-theme /theme: dark, light

\define("PRJ_ICON_SVG","/assets/img/icon.svg"); //
\define("PRJ_MS_CONFIG","/msconfig.xml"); //
\define("PRJ_WEB_MANIFEST","/site.webmanifest"); //
\define("PRJ_MS_TILE_COLOUR",PRJ_PRIMARY_COLOUR); // for windows 10 shortcut tile
\define("PRJ_MS_THEME_COLOUR",PRJ_SECONDARY_COLOUR); // for Windows theme
\define("PRJ_ICON_16X16","/assets/img/icon-16x16.png");
\define("PRJ_ICON_32X32","/assets/img/icon-32x32.png");
\define("PRJ_ICON_150X150","/assets/img/icon-150x150.png");
\define("PRJ_ICON_180X180","/assets/img/icon-180x180.png");
\define("PRJ_ICON_192X192","/assets/img/icon-192x192.png");
\define("PRJ_ICON_512X512","/assets/img/icon-180x180.png");
// template
\define("PRJ_INC_ICONSET",PRJ_ROOT . "/src/inc-iconset.php"); // include file
\define("PRJ_INC_HEADER",PRJ_ROOT . "/src/inc-header.php"); // include file
\define("PRJ_INC_FOOTER",PRJ_ROOT . "/src/inc-footer.php"); // include file
\define("PRJ_INC_SIDEBAR",PRJ_ROOT . "/src/inc-aside.php"); // include file
\define("PRJ_SIDEBAR_POS","off"); // position of side bar: "left", "right", "off"
\define("PRJ_HEADER_HEIGHT", 100); // Height of header pane in px
// Robots
\define("PRJ_BOT_WELCOME", "Dimma"); // Robot: welcomes new users
\define("PRJ_BOT_AUTH", "Agu"); // Robot: authentications etc
\define("PRJ_BOT_Help", "Mmasi"); // Robot: support robot
\define("PRJ_SUPPORT_EMAIL", "support@" . PRJ_DOMAIN); // support email
\define("PRJ_AUTO_EMAIL", "no_reply@" . PRJ_DOMAIN); // Email for sending random message
\define("PRJ_ADMIN_EMAIL", "admin@" . PRJ_DOMAIN); // Admin Email
// MySQL Server
\define("MYSQL_SERVER","localhost");
// MySQL Databases
\define("MYSQL_PREFIX","sos_"); //
\define("MYSQL_BASE_DB",MYSQL_PREFIX . "base"); // primary storage database
\define("MYSQL_ADMIN_DB",MYSQL_PREFIX . "admin"); // admin info database
\define("MYSQL_LOG_DB",MYSQL_PREFIX . "log"); // log database
\define("MYSQL_DATA_DB",MYSQL_PREFIX . "data"); // database for storing generic data
\define("MYSQL_FILE_DB", MYSQL_PREFIX . "files"); // database for storing file data
\define("MYSQL_FILE_TBL", "file_meta"); // table for storing file data
// MySQL Users
\define("MYSQL_GUEST_USERNAME", MYSQL_PREFIX . "GUEST");
\define("MYSQL_GUEST_PASS","7OSpwd1234Pass");
\define("MYSQL_USER_USERNAME", MYSQL_PREFIX . "USER");
\define("MYSQL_USER_PASS","7OSpwd1234Pass");
\define("MYSQL_ANALYST_USERNAME", MYSQL_PREFIX . "ANALYST");
\define("MYSQL_ANALYST_PASS","7OSpwd1234Pass");
\define("MYSQL_ADVERTISER_USERNAME", MYSQL_PREFIX . "ADVERTISER");
\define("MYSQL_ADVERTISER_PASS","7OSpwd1234Pass");
\define("MYSQL_MODERATOR_USERNAME", MYSQL_PREFIX . "MODERATOR");
\define("MYSQL_MODERATOR_PASS","7OSpwd1234Pass");
\define("MYSQL_EDITOR_USERNAME", MYSQL_PREFIX . "EDITOR");
\define("MYSQL_EDITOR_PASS","7OSpwd1234Pass");
\define("MYSQL_ADMIN_USERNAME", MYSQL_PREFIX . "ADMIN");
\define("MYSQL_ADMIN_PASS","7OSpwd1234Pass");
\define("MYSQL_DEVELOPER_USERNAME", MYSQL_PREFIX . "DEVELOPER");
\define("MYSQL_DEVELOPER_PASS","7OSpwd1234Pass");
\define("MYSQL_SUPERADMIN_USERNAME", MYSQL_PREFIX . "SUPERADMIN");
\define("MYSQL_SUPERADMIN_PASS","7OSpwd1234Pass");
\define("MYSQL_OWNER_USERNAME", MYSQL_PREFIX . "OWNER");
\define("MYSQL_OWNER_PASS","7OSpwd1234Pass");

// generic definition
\define('REQUEST_SCHEME',(
    ( !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] =='on'  )
      OR
    (  $_SERVER['REQUEST_SCHEME'] === 'https'	|| (int)$_SERVER['SERVER_PORT'] === 443 )
  ) ? "https://" : "http://");
\define('WHOST',REQUEST_SCHEME . PRJ_DOMAIN);
\define('THIS_PAGE',WHOST . $_SERVER['REQUEST_URI']);
