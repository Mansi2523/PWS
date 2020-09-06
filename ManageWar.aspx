<%@ Page Title=" Manage Admin" Language="C#" MasterPageFile="~/Sitemaster/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageWar.aspx.cs" Inherits="Admin1_ManageWar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Save Area--%>
    <div class="saveactionarea">
        <asp:HiddenField runat="server" ID="hdnPrintname" />
        <a class="btn green-sharp" onclick="AddData()">Add War Title</a>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title ">
                    <div class="caption">
                        Search
                    </div>
                    <div class="tools">
                        <a href="javascript:;" data-original-title="" title="" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form" style="display: block">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Title</label>
                            <asp:TextBox ID="txtwartitle" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12" style="text-align: right;">
                        <div class="form-actions">
                            <asp:Button ID="btnSearch" class="btn green-sharp" Text="Search" runat="server" OnClick="btnSearch_Click" />
                            <asp:Button ID="btnClear" class="btn red-mint" Text="Clear" runat="server" OnClick="btnClear_Click" />

                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div class="col-md-12 dvlst" style="display: none">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title ">
                    <div class="caption">
                        List
                    </div>
                    <div class="tools">
                        <a href="javascript:;" data-original-title="" title="" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form" style="display: block">
                    <div class="col-md-12">
                        <div class="actioarea">
                            <div runat="server" id="pnlnoassign">
                                <%--Action Area============================================================================================================--%>
                                <div class="btn-group">
                                    <button runat="server" id="btndemo" class="btn red-mint dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Action</button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <asp:LinkButton runat="server" ID="btnDelete" OnClick="btnDelete_Click" data-apply="confirmation">Delete</asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <label id="lbltbldata wd100" style="width: 100%">
                            <table class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="sample_1" role="grid" aria-describedby="sample_1_info">
                                <thead>
                                    <tr>
                                        <th style="width: 10px;">
                                            <input id="ContentPlaceHolder1_gvAdmin_chkAll" type="checkbox" name="ctl00$ContentPlaceHolder1$gvAdmin$ctl00$chkAll">
                                        </th>
                                        <th style="width: 0px;">Title</th>
                                        <th>Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="ContentPlaceHolder1_gvAdmin_chkMember_0" type="checkbox" name="ctl00$ContentPlaceHolder1$gvAdmin$ctl01$chkMember">
                                        </td>
                                        <td>Boer War</td>
                                        <td class="va-mdl">
                                            <a title="Edit" class="btn btn-icon-only grey-cascade fancybox" onclick="EditData(1476)"><i class="fa fa-edit"></i></a>
                                            <a title="Permanently Delete" data-toggle="modal" href="#ConfirmDelete_1476" class="btn btn-icon-only grey-cascade"><i class="fa fa-times"></i></a>
                                            <div class="modal fade draggable-modal" id="ConfirmDelete_1476" tabindex="-1" role="basic" aria-hidden="true" style="left: 44%; width: 50%;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="margin-top: 80px; overflow: hidden">
                                                        <div class="modal-body mb28">
                                                            <div class="col-md-12 conf">
                                                                <img class="confimg" src="https://tfslms.com/Root/images/ConfrimDelete.png">
                                                                <span>Are you sure you want to delete this user: <b>Feby Basco?</b></span>
                                                            </div>
                                                            <div class="col-md-12 confaction">
                                                                <a id="ContentPlaceHolder1_gvAdmin_lkbDelete_0" title="Permanently Delete" class="btn green-sharp" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$gvAdmin$ctl01$lkbDelete','')">Delete</a>
                                                                <a title="No" data-dismiss="modal" class="btn red-mint">Cancel</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="fancybox-overlay fancybox-overlay-fixed" id="AddData" style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light portlet-fit bordered">
                        <div class="portlet-title ">
                            <div class="caption">
                                Add Admin
                            </div>
                        </div>
                        <div class="portlet-body form" id="divaddform">
                            <div class="alert alert-danger display-hide" id="Title">
                                <button class="close" data-close="alert"></button>
                                <span>Enter Title. </span>
                            </div>
                            <div class="alert alert-danger display-hide" id="Image">
                                <button class="close" data-close="alert"></button>
                                <span>Enter Image. </span>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div>
                                        <label for="exampleInputPassword1">Profile Pic</label>
                                    </div>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 175px; height: 133px;">
                                            <asp:Image runat="server" ID="Image1" alt="" ImageUrl="https://tfslms.com/Root/images/noimagemain.png" />
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 175px; max-height: 150px;"></div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new">Select Image </span>
                                                <span class="fileinput-exists">Change Image </span>
                                                <asp:FileUpload ID="FileUpload_Profile_Pic" runat="server" CssClass="form-control"></asp:FileUpload>
                                            </span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Title<span class="required">*</span></label>
                                    <asp:TextBox class="form-control" ID="txttitle" runat="server" placeholder="Title"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12">
                                <div class="form-actions">
                                    <a id="lkbSave" class="btn green">Submit</a>
                                    <a id="lnkclear" class="btn red-mint btn-sm" onclick="ClosePopup();">Cancel</a>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Student Info Change Message--%>
    <div class="jquery-notific8-notification teal" id="studichange">
        <div class="jquery-notific8-message">Admin Information Changed!</div>
    </div>
    <div class="jquery-notific8-notification teal" id="SuccessMessageHideshow">
        <div class="jquery-notific8-message">Action Triggered Successfully!</div>
    </div>
    <script type="text/javascript">
        //Validate Student Javascript
        var _0x7ce7 = ["\x76\x61\x6C\x75\x65", "\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", "", "\x66\x61\x64\x65\x49\x6E", "\x23\x66\x69\x72\x73\x74\x6E\x61\x6D\x65", "\x64\x69\x73\x70\x6C\x61\x79\x2D\x68\x69\x64\x65", "\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73", "\x66\x61\x64\x65\x4F\x75\x74", "\x23\x6C\x61\x73\x74\x6E\x61\x6D\x65", "\x23\x75\x73\x65\x72\x6E\x61\x6D\x65", "\x23\x70\x61\x73\x73\x77\x6F\x72\x64", "\x74\x72\x69\x6D", "\x5B\x20\x54\x6F\x6F\x20\x73\x68\x6F\x72\x74\x20\x5D", "\x5B\x20\x57\x65\x61\x6B\x20\x5D", "\x5B\x20\x47\x6F\x6F\x64\x20\x5D", "\x73\x6C\x6F\x77", "\x61\x6E\x69\x6D\x61\x74\x65", "\x68\x74\x6D\x6C\x2C\x20\x62\x6F\x64\x79", "\x23\x70\x61\x73\x73\x77\x6F\x72\x64\x73\x74\x72\x6F\x6E\x67", "\x23\x6E\x6F\x74\x6D\x61\x74\x63\x68", "\x23\x65\x6D\x61\x69\x6C", "\x74\x65\x73\x74", "\x66\x6F\x63\x75\x73"]; function Validate() { if (document[_0x7ce7[1]]('<%=txttitle.ClientID %>')[_0x7ce7[0]] == _0x7ce7[2]) { $(_0x7ce7[4])[_0x7ce7[3]](30); $(_0x7ce7[4])[_0x7ce7[6]](_0x7ce7[5]); $(_0x7ce7[4])[_0x7ce7[7]](3000); return false };  return false } } }
                        
        //Add Data
        function AddData() {
            $("#AddData").fadeIn();
        }

        //Add Data
        function EditData(sid) {
            $("#AddData").fadeIn();
        }

        function ClosePopup() {
            $("#AddData").fadeOut();
        }
    </script>
</asp:Content>

