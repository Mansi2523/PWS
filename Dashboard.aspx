<%@ Page Title="" Language="C#" MasterPageFile="~/Sitemaster/AdminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin1_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   
        <div class="row" id="MasterShow" runat="server">
            <div class="col-md-12 col-sm-12">
                <!-- BEGIN PORTLET-->
                <div class="portlet light calendar bordered">
                    <div class="portlet-title ">
                        <div class="caption">
                            <span class="caption-subject font-default-sharp bold ">Master</span>
                        </div>                        
                    </div>
                    <div class="portlet-body">                        
                        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" runat="server" id="masterOnlineCourse">
                            <div class="dashboard-stat yellow">
                                <div class="visual">
                                    <i class="fa fa-pagelines"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <asp:Label runat="server" ID="lblwar" data-counter="counterup"></asp:Label>
                                    </div>
                                    <div class="desc">War</div>
                                </div>
                                <a class="more" href="ManageWar.aspx">Click Here<i class="m-icon-swapright m-icon-white"></i></a>
                                
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" runat="server" id="masterUnit">
                            <div class="dashboard-stat purple">
                                <div class="visual">
                                    <i class="fa fa-pagelines"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <asp:Label runat="server" ID="lblwardetail" data-counter="counterup"></asp:Label>
                                    </div>
                                    <div class="desc">War Details</div>
                                </div>
                                <a class="more" href="ManageWarDetails.aspx">Click Here<i class="m-icon-swapright m-icon-white"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" runat="server" id="masterQuizzess">
                            <div class="dashboard-stat red" style="width: 100%">
                                <div class="visual">
                                    <i class="fa fa-bar-chart-o"></i>
                                </div>
                                <div class="details">
                                    <div class="number">
                                        <asp:Label runat="server" ID="lblwarstory" data-counter="counterup"></asp:Label>
                                    </div>
                                    <div class="desc">War Story </div>
                                </div>
                                <a class="more" href="ManageWarStories.aspx">Click Here<i class="m-icon-swapright m-icon-white"></i></a>
                            </div>
                        </div> 
                        <div class="clearfix"></div> 
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>    
</asp:Content>

