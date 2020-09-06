<%@ Page Title=" Manage Admin" Language="C#" MasterPageFile="~/Sitemaster/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAboutUs.aspx.cs" Inherits="Admin1_ManageAboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="assets/pages/scripts/Custom/CustomAboutUs.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Save Area--%>
    <div class="saveactionarea">
        <a id="btnadd" class="btn green-sharp">Submit</a>
        <a id="btnClear" class="btn red-mint">Clear</a>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title ">
                    <div class="caption">
                        Manage About Us
                    </div>
                    <div class="tools">
                        <a href="javascript:;" data-original-title="" title="" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form" style="display: block">
                    <div class="alert alert-success display-hide" id="Success">
                        <button class="close" data-close="alert"></button>
                        <span>Data Updated Successfully. </span>
                    </div>

                    <div class="alert alert-danger display-hide" id="sd">
                        <button class="close" data-close="alert"></button>
                        <span>Enter Short Description. </span>
                    </div>

                    <div class="alert alert-danger display-hide" id="ld">
                        <button class="close" data-close="alert"></button>
                        <span>Enter Description. </span>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Short Description</label>
                            <br />
                            <div class="summernote" id="ausd"></div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Description</label>
                            <br />
                            <div class="summernote" id="auld"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12" style="text-align: right;">
                        <div class="form-actions">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
</asp:Content>

