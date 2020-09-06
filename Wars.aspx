<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Wars.aspx.cs" Inherits="Wars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="breadcrumb">
        <!-- Breadcrumb NavXT 6.1.0 -->
        <span><a title="Go to Home Page." href="Default.aspx" class="home"><span>Home</span></a></span> &gt; <span><span>Wars</span></span>
    </div>
    <section class="sec-100px gallery">
        <div class="container">
            <!-- Tittle -->
            <div class="tittle">
                <h2>List of Wars</h2>
                <hr>
            </div>
            <ul class="row">
                <li class="col-sm-3">
                    <div class="inn-sec">
                        <div class="hover-info">
                            <div class="position-center-center">
                                <a href="assets/wp-content/uploads/War/boer.jpg" data-rel="prettyPhoto" class="prettyPhoto lightzoom zoom">
                                    <i class="fa fa-image"></i>
                                </a>
                            </div>
                        </div>
                        <img width="360" height="278" src="assets/wp-content/uploads/War/boer.jpg" class="attachment-museumwp-360-278 size-museumwp-360-278 wp-post-image" alt="">
                        <div class="detail">
                            <a href="WarDetails.aspx" title="Boer War">Boer War</a>

                        </div>
                    </div>
                </li>
                <li class="col-sm-3">
                    <div class="inn-sec">
                        <div class="hover-info">
                            <div class="position-center-center">
                                <a href="assets/wp-content/uploads/War/ww1.jpg" data-rel="prettyPhoto" class="prettyPhoto lightzoom zoom">
                                    <i class="fa fa-image"></i>
                                </a>
                            </div>
                        </div>
                        <img width="360" height="278" src="assets/wp-content/uploads/War/ww1.jpg" class="attachment-museumwp-360-278 size-museumwp-360-278 wp-post-image" alt="" >
                        <div class="detail">
                            <a href="WarDetails.aspx" title="World War One">World War One</a>

                        </div>
                    </div>
                </li>
                <li class="col-sm-3">
                    <div class="inn-sec">
                        <div class="hover-info">
                            <div class="position-center-center">
                                <a href="assets/wp-content/uploads/War/ww2.jpg" data-rel="prettyPhoto" class="prettyPhoto lightzoom zoom">
                                    <i class="fa fa-image"></i>
                                </a>
                            </div>
                        </div>
                        <img width="360" height="278" src="assets/wp-content/uploads/War/ww2.jpg" class="attachment-museumwp-360-278 size-museumwp-360-278 wp-post-image" alt="" >
                        <div class="detail">
                            <a href="WarDetails.aspx" title="World War Two">World War Two</a>

                        </div>
                    </div>
                </li>
                <li class="col-sm-3">
                    <div class="inn-sec">
                        <div class="hover-info">
                            <div class="position-center-center">
                                <a href="assets/wp-content/uploads/War/Nelsonandothers.jpg" data-rel="prettyPhoto" class="prettyPhoto lightzoom zoom">
                                    <i class="fa fa-image"></i>
                                </a>
                            </div>
                        </div>
                        <img width="360" height="278" src="assets/wp-content/uploads/War/Nelsonandothers.jpg" class="attachment-museumwp-360-278 size-museumwp-360-278 wp-post-image" alt="" >
                        <div class="detail">
                            <a href="WarDetails.aspx" title="Nelson & Others">Nelson & Others</a>

                        </div>
                    </div>
                </li>
                <li class="clearfix"></li>
            </ul>
        </div>
    </section>
</asp:Content>

