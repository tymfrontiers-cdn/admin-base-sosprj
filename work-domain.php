<?php
namespace TymFrontiers;
require_once ".baseinit.php";
\require_login(true);
$page_name = "work-domain";
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta>
    <title>Work Domains -<?php echo PRJ_TITLE; ?></title>
    <?php include PRJ_INC_ICONSET; ?>
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'>
    <meta name="author" content="<?php echo PRJ_AUTHOR; ?>">
    <meta name="creator" content="<?php echo PRJ_CREATOR; ?>">
    <meta name="publisher" content="<?php echo PRJ_PUBLISHER; ?>">
    <meta name="robots" content='nofollow'>
    <!-- Theming styles -->
    <link rel="stylesheet" href="/app/soswapp/font-awesome.soswapp/css/font-awesome.min.css">
    <link rel="stylesheet" href="/app/soswapp/theme.soswapp/css/theme.min.css">
    <link rel="stylesheet" href="/app/soswapp/theme.soswapp/css/theme-<?php echo PRJ_THEME; ?>.min.css">
    <!-- optional plugin -->
    <link rel="stylesheet" href="/app/soswapp/plugin.soswapp/css/plugin.min.css">
    <link rel="stylesheet" href="/app/soswapp/dnav.soswapp/css/dnav.min.css">
    <link rel="stylesheet" href="/app/soswapp/faderbox.soswapp/css/faderbox.min.css">
    <!-- Project styling -->
    <link rel="stylesheet" href="<?php echo \html_style("base.min.css"); ?>">
  </head>
  <body>
    <?php Helper\setup_page("work-domain", "base", false, PRJ_HEADER_HEIGHT); ?>
    <!-- page header -->
    <?php include PRJ_INC_HEADER; ?>
    <section id="main-content">
      <div class="view-space">
        <div class="grid-8-tablet grid-6-desktop center-tablet">
          <div class="sec-div padding -p20">
            <h2>Welcome!</h2>
            <p>To get started, choose a work domain</p>
            <ul class="wk-domain-list">
            <?php if ($domains = (new MultiForm(MYSQL_ADMIN_DB, "work_domain", "name"))->findAll()): foreach($domains as $domain) { ?>
              <li>
                <span class="fa-stack fa-2x">
                  <i class="fas fa-octagon fa-stack-2x"></i>
                  <?php echo \str_replace("fas fa-", "fas fa-stack-1x fa-inverse fa-",\html_entity_decode($domain->icon)); ?>
                </span>
                <h3> <a href="<?php echo WHOST . $domain->path ?>"><?php echo $domain->name; ?></a></h3>
                <p><?php echo $domain->description; ?></p>
              </li>
            <?php } endif; ?>
            </ul>
          </div>
        </div>
        <br class="c-f">
      </div>
      <br class="c-f">
    </section>

    <?php include PRJ_INC_FOOTER; ?>
    <!-- Required scripts -->
    <script src="/app/soswapp/jquery.soswapp/js/jquery.min.js">  </script>
    <script src="/app/soswapp/js-generic.soswapp/js/js-generic.min.js">  </script>
    <script src="/app/soswapp/theme.soswapp/js/theme.min.js"></script>
    <!-- optional plugins -->
    <script src="/app/soswapp/plugin.soswapp/js/plugin.min.js"></script>
    <script src="/app/soswapp/dnav.soswapp/js/dnav.js"></script>
    <script src="/app/soswapp/faderbox.soswapp/js/faderbox.min.js"></script>
    <!-- project scripts -->
    <script src="<?php echo \html_script ("base.min.js"); ?>"></script>
    <script type="text/javascript">
    </script>
  </body>
</html>
