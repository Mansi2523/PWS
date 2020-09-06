<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin1_Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="Page-Enter" content="blenTrans(Duration=0)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)" />
    <!--No Caching-->
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/pages/css/lock.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/jquery-minicolors/jquery.minicolors.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
    <link href="assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
    <%--For Notificatrion--%>
    <link rel="shortcut icon" href="favicon.ico" />
    <!-- BEGIN Customized MANDATORY STYLES -->
    <link href="assets/layouts/layout/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color">
    <link href="assets/pages/css/CustomAdmin.css" rel="stylesheet" type="text/css" />
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-closed" id="mainbody">
    <form runat="server" id="Form1">
        <asp:HiddenField ID="hdnusername" runat="server" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <!-- BEGIN HEADER ============================================================================================================================================ -->
        <asp:HiddenField runat="server" ID="hdnURL" />
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    Porirua War Stories
                    
                </div>

                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-reorder"></i></a>

                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- Admin Settings Area ============================================================================================================================ -->
                        <li class="dropdown dropdown-user">
                            <asp:HiddenField ID="hfUserID" runat="server" />
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <asp:Image runat="server" ID="imguser" class="avatar" ImageUrl="~/assets/Images/NoImg.png" />
                                <span runat="server" class="username username-hide-on-mobile" id="lblUser">Hi Admin</span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a title="Force Signout" data-toggle="modal" href="#divSignOut"><i class="icon-key"></i>Sign Out </a>
                                    <div class="modal fade draggable-modal" id='divSignOut' tabindex="-1" role="basic" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content" style="margin-top: 80px; overflow: hidden">
                                                <div class="modal-body mb28">
                                                    <div class="col-md-12 conf">
                                                        <h4><b>Are you sure you want to Sign Out?</b></h4>
                                                    </div>
                                                    <br />
                                                    <hr />
                                                    <br />
                                                    <div class="col-md-12 confaction">
                                                        <a title="Cancel" data-dismiss="modal" class="btn red-mint pull-right">No</a>
                                                        <asp:LinkButton ID="lkbLogoff" ToolTip="Signout" runat="server" CssClass="btn green pull-right mgr5" OnClick="lkbLogoff_Click">Yes</asp:LinkButton>&nbsp;&nbsp;
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- END HEADER ============================================================================================================================================ -->

        <div class="clearfix"></div>
        <div class="page-container">

            <!-- BEGIN SIDE BAR ============================================================================================================================================ -->
            <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse">                    
                    <ul id="menu" class="page-sidebar-menu page-header-fixed page-sidebar-menu-closed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 10px; height: 200px">
                        <li class="nav-item start" id="main_lihome">
                            <input type="hidden" id="id" class="reply-id" value="Dashboard.aspx" />
                            <a id="linkhome" runat="server" class="nav-link nav-toggle" commandname="Navigate" onclick="calliframe(this.id)">
                                <i class="icon-home"></i>
                                <span class="title">Home</span>
                                <span id="spanhome"></span>
                            </a>
                        </li>
                        <li class="heading">
                            <h3 class="uppercase">Features</h3>
                        </li>
                        <%--Student Menu ====================================================================================================--%>
                        <li class="nav-item " id="main_1">
                            <a href="#" class="nav-link nav-toggle">
                                <i class="fa fa-user"></i>
                                <span class="title">User</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item  " id="Level1">
                                    <input type="hidden" class="reply-id" value="ManageAdmin.aspx" />
                                    <a onclick="calliframe(this.id)" id="ULmain_11" class="nav-link nav-toggle">
                                        <i class="fa fa-arrow-circle-o-right"></i>
                                        <span class="title">Manage Admin(s)</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <%--Student Menu ====================================================================================================--%>
                        <li class="nav-item ">
                            <a href="#" class="nav-link nav-toggle">
                                <i class="fa fa-list"></i>
                                <span class="title">About Us</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item">
                                    <input type="hidden" class="reply-id" value="ManageAboutUs.aspx" />
                                    <a onclick="calliframe(this.id)" id="ULmain_31" class="nav-link nav-toggle">
                                        <i class="fa fa-arrow-circle-o-right"></i>
                                        <span class="title">Manage About Us</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <%--War Stories ====================================================================================================--%>
                        <li class="nav-item " id="Li1">
                            <a href="#" class="nav-link nav-toggle">
                                <i class="fa fa-book"></i>
                                <span class="title">War Stories Content</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item">
                                    <input type="hidden" class="reply-id" value="ManageWar.aspx" />
                                    <a onclick="calliframe(this.id)" id="ULmain_21" class="nav-link nav-toggle">
                                        <i class="fa fa-arrow-circle-o-right"></i>
                                        <span class="title">Manage War(s)</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <input type="hidden" class="reply-id" value="ManageWarDetails.aspx" />
                                    <a onclick="calliframe(this.id)" id="ULmain_22" class="nav-link nav-toggle">
                                        <i class="fa fa-arrow-circle-o-right"></i>
                                        <span class="title">Manage Details</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <input type="hidden" class="reply-id" value="ManageWarStories.aspx" />
                                    <a onclick="calliframe(this.id)" id="ULmain_23" class="nav-link nav-toggle">
                                        <i class="fa fa-arrow-circle-o-right"></i>
                                        <span class="title">Manage Story</span>
                                    </a>
                                </li>
                            </ul>
                        </li>                        
                    </ul>
                </div>
            </div>
            <!-- END SIDE BAR ============================================================================================================================================ -->

            <!-- BEGIN IFRAME ============================================================================================================================================ -->
            <div class="page-content-wrapper">
                <div class="page-content mainpc">
                    <div id="wrapper">
                        <style type="text/css">
                            #wrapper .ifrme-main {
                                width: 100%;
                                height: 670px;
                                background-color: #fff;
                            }
                        </style>
                        <iframe frameborder="0" class="ifrme-main" runat="server" id="I1" name="I1" src="Dashboard.aspx"></iframe>
                        <div class="fancybox-overlay fancybox-overlay-fixed" style="width: auto; height: auto; display: none">
                        </div>
                    </div>
                    <a href="javascript:;" class="page-quick-sidebar-toggler">
                        <i class="icon-login"></i>
                    </a>
                </div>
            </div>
            <!-- END IFRAME ============================================================================================================================================ -->
        </div>

        <!-- BEGIN POPUP AREA ============================================================================================================================================ -->
        <!-- END POPUP AREA ============================================================================================================================================ -->
    </form>
    <script type="text/javascript" src="../assets/Plugins/FancyBox/lib/jquery-1.10.1.min.js"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>    
    <script src="assets/global/plugins/highcharts/js/highcharts.js" type="text/javascript"></script>
    <script src="assets/global/plugins/highcharts/js/highcharts-3d.js" type="text/javascript"></script>
    <script src="assets/global/plugins/highcharts/js/highcharts-more.js" type="text/javascript"></script>
    <script src="assets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
    <script src="assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
    <script src="assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
    <script src="assets/global/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
    <script src="assets/global/plugins/fullcalendar/moment.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
    <script src="//cdn.datatables.net/plug-ins/1.10.11/sorting/date-eu.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-minicolors/jquery.minicolors.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.input-ip-address-control-1.0.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-sessiontimeout/bootstrap-session-timeout.min.js" type="text/javascript"></script>
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <script src="assets/pages/scripts/ui-confirmations.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/ui-extended-modals.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/components-color-pickers.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/ui-tree.min.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/table-datatables-responsive.js" type="text/javascript"></script>
    <script src="assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <%--<script src="assets/pages/scripts/ui-session-timeout.js" type="text/javascript"></script>--%>
    <script src="assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
    <script src="assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
    <script src="assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
    <!-- END THEME LAYOUT SCRIPTS -->
    <script src="assets/pages/scripts/form-input-mask.js" type="text/javascript"></script>
    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="../assets/Plugins/FancyBox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="../assets/Plugins/FancyBox/source/jquery.fancybox.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="../assets/Plugins/FancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
    <!-- Add Button helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="../assets/Plugins/FancyBox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <script type="text/javascript" src="../assets/Plugins/FancyBox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <!-- Add Thumbnail helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="../assets/Plugins/FancyBox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="../assets/Plugins/FancyBox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    <!-- Add Media helper (this is optional) -->
    <script type="text/javascript" src="../assets/Plugins/FancyBox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
    <script type="text/javascript" src="assets/Login/scripts/CustomAdmin.js"></script>
</body>
</html>
