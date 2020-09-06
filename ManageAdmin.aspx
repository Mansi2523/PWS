<%@ Page Title=" Manage Admin" Language="C#" MasterPageFile="~/Sitemaster/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="Admin1_ManageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Save Area--%>
    <div class="saveactionarea">
        <asp:HiddenField runat="server" ID="hdnPrintname" />
        <a class="btn green-sharp" onclick="AddData()">Add Admin</a>
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
                            <label>Name</label>
                            <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-control"></asp:TextBox>
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
                        <label id="lbltbldata"></label>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="fancybox-overlay fancybox-overlay-fixed" id="AddAdmin" style="display: none">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light portlet-fit bordered">
                        <div class="portlet-title ">
                            <div class="caption">
                                Add Admin
                            </div>
                        </div>
                        <div class="portlet-body form" id="divaddform">
                            <div class="alert alert-danger display-hide" id="firstname">
                                <button class="close" data-close="alert"></button>
                                <span>Enter First Name. </span>
                            </div>
                            <div class="alert alert-danger display-hide" id="lastname">
                                <button class="close" data-close="alert"></button>
                                <span>Enter Last Name. </span>
                            </div>
                            <div class="alert alert-danger display-hide" id="username">
                                <button class="close" data-close="alert"></button>
                                <span>Enter Username. </span>
                            </div>
                            <div class="alert alert-danger display-hide" id="password">
                                <button class="close" data-close="alert"></button>
                                <span>Enter Password. </span>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>First Name<span class="required">*</span></label>
                                    <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Last Name<span class="required">*</span></label>
                                    <asp:TextBox class="form-control" ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Email<span class="required">*</span></label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" onblur="UserCheck();"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Username<span class="required">*</span></label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" onblur="UserPassCheck();"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Password &nbsp;<a data-toggle="modal" href="#PasswordRules"><i class="fa fa-question-circle"></i></a> <span class="required">*</span>&nbsp;&nbsp;<b><asp:Label runat="server" ID="strength_message"></asp:Label></b></label>
                                    <%--Popup for Password Strenght--%>
                                    <div class="modal fade draggable-modal" id='PasswordRules' tabindex="-1" role="basic" aria-hidden="true" style="left: 40% !important">
                                        <div class="modal-dialog">
                                            <div class="modal-content" style="margin-top: 80px; overflow: hidden">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title"><b>Password Rules</b></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>An example of a secure password would be something like this: <b style="color: red">Hgs3@4</b></p>
                                                    <br />
                                                    <p>These rules are as follows:</p>
                                                    <ul>
                                                        <li>Passwords MUST be at least 6 characters long</li>
                                                        <li>Passwords MAY NOT contain your username or any part of your full name</li>
                                                        <li>Passwords MUST contain characters from at least three of the four class characteristics, which are listed below.</li>
                                                    </ul>
                                                    <br />
                                                    <p><b>Classes Characteristics:</b></p>
                                                    <ul>
                                                        <li>English Upper Case</li>
                                                        <li>English Lower Case</li>
                                                        <li>Numerals</li>
                                                        <li>Non-Alphanumeric (Punctuation marks and other symbols)</li>
                                                    </ul>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn red-mint btn-outline" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <div class="input-group">
                                        <div class="input-icon">

                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" onblur="UserPassCheck();"></asp:TextBox>
                                            <asp:TextBox ID="pwdstrht" runat="server" CssClass="form-control" Style="display: none" placeholder="Password"></asp:TextBox>
                                        </div>
                                        <span class="input-group-btn">
                                            <a class="btn btn-success" id="lnkchangetitle" style="margin-left: 10px; float: left;" onclick="generate();"><i class="fa fa-arrow-left fa-fw"></i>Generate Password</a>

                                        </span>
                                    </div>
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
        <%--Student Info Change Message--%>
        <div class="jquery-notific8-notification teal" id="studichange">
            <div class="jquery-notific8-message">Admin Information Changed!</div>
        </div>
        <div class="jquery-notific8-notification teal" id="SuccessMessageHideshow">
            <div class="jquery-notific8-message">Action Triggered Successfully!</div>
        </div>
        <script type="text/javascript">
            //Validate Student Javascript
            var _0x7ce7 = ["\x76\x61\x6C\x75\x65", "\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", "", "\x66\x61\x64\x65\x49\x6E", "\x23\x66\x69\x72\x73\x74\x6E\x61\x6D\x65", "\x64\x69\x73\x70\x6C\x61\x79\x2D\x68\x69\x64\x65", "\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73", "\x66\x61\x64\x65\x4F\x75\x74", "\x23\x6C\x61\x73\x74\x6E\x61\x6D\x65", "\x23\x75\x73\x65\x72\x6E\x61\x6D\x65", "\x23\x70\x61\x73\x73\x77\x6F\x72\x64", "\x74\x72\x69\x6D", "\x5B\x20\x54\x6F\x6F\x20\x73\x68\x6F\x72\x74\x20\x5D", "\x5B\x20\x57\x65\x61\x6B\x20\x5D", "\x5B\x20\x47\x6F\x6F\x64\x20\x5D", "\x73\x6C\x6F\x77", "\x61\x6E\x69\x6D\x61\x74\x65", "\x68\x74\x6D\x6C\x2C\x20\x62\x6F\x64\x79", "\x23\x70\x61\x73\x73\x77\x6F\x72\x64\x73\x74\x72\x6F\x6E\x67", "\x23\x6E\x6F\x74\x6D\x61\x74\x63\x68", "\x23\x65\x6D\x61\x69\x6C", "\x74\x65\x73\x74", "\x66\x6F\x63\x75\x73"]; function Validate() { if (document[_0x7ce7[1]]('<%=txtFirstName.ClientID %>')[_0x7ce7[0]] == _0x7ce7[2]) { $(_0x7ce7[4])[_0x7ce7[3]](30); $(_0x7ce7[4])[_0x7ce7[6]](_0x7ce7[5]); $(_0x7ce7[4])[_0x7ce7[7]](3000); return false }; if (document[_0x7ce7[1]]('<%=txtLastName.ClientID %>')[_0x7ce7[0]] == _0x7ce7[2]) { $(_0x7ce7[8])[_0x7ce7[3]](30); $(_0x7ce7[8])[_0x7ce7[6]](_0x7ce7[5]); $(_0x7ce7[8])[_0x7ce7[7]](3000); return false }; if (document[_0x7ce7[1]]('<%=txtEmail.ClientID %>')[_0x7ce7[0]] == _0x7ce7[2]) { $(_0x7ce7[20])[_0x7ce7[3]](30); $(_0x7ce7[20])[_0x7ce7[6]](_0x7ce7[5]); $(_0x7ce7[20])[_0x7ce7[7]](3000); return false }; var _0x3df2x2 = document[_0x7ce7[1]]('<%=txtEmail.ClientID %>'); var _0x3df2x3 = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm; if (_0x3df2x2[_0x7ce7[0]] != _0x7ce7[2]) { if (!_0x3df2x3[_0x7ce7[21]](_0x3df2x2[_0x7ce7[0]])) { $(_0x7ce7[20])[_0x7ce7[3]](30); $(_0x7ce7[20])[_0x7ce7[6]](_0x7ce7[5]); $(_0x7ce7[20])[_0x7ce7[7]](3000); _0x3df2x2[_0x7ce7[22]]; return false } } }

            //Close Popup
            var _0x1cd4 = ["\x63\x6C\x6F\x73\x65", "\x66\x61\x6E\x63\x79\x62\x6F\x78", "\x24", "\x72\x65\x6C\x6F\x61\x64", "\x6C\x6F\x63\x61\x74\x69\x6F\x6E", "\x70\x61\x72\x65\x6E\x74"]; function fancyboxclosewpl() { parent[_0x1cd4[2]][_0x1cd4[1]][_0x1cd4[0]](); window[_0x1cd4[5]][_0x1cd4[4]][_0x1cd4[3]]() }

            //Random Password
            var _0x3fc2 = ["\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6A\x6B\x6C\x6D\x6E\x6F\x70\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7A\x21\x40\x23\x24\x25\x5E\x26\x2A\x28\x29\x2D\x2B\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4A\x4B\x4C\x4D\x4E\x4F\x50\x31\x32\x33\x34\x35\x36\x37\x38\x39\x30", "", "\x72\x61\x6E\x64\x6F\x6D", "\x6C\x65\x6E\x67\x74\x68", "\x66\x6C\x6F\x6F\x72", "\x63\x68\x61\x72\x41\x74"]; function randomPassword(_0xf4b6x2) { var _0xf4b6x3 = _0x3fc2[0]; var _0xf4b6x4 = _0x3fc2[1]; for (var _0xf4b6x5 = 0; _0xf4b6x5 < _0xf4b6x2; _0xf4b6x5++) { var _0xf4b6x6 = Math[_0x3fc2[4]](Math[_0x3fc2[2]]() * _0xf4b6x3[_0x3fc2[3]]); _0xf4b6x4 += _0xf4b6x3[_0x3fc2[5]](_0xf4b6x6) }; return _0xf4b6x4 }

            //Check Password Strenghts
            var _0x3b32 = ["\x6C\x65\x6E\x67\x74\x68", "\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x73\x74\x72\x65\x6E\x67\x74\x68\x5F\x6D\x65\x73\x73\x61\x67\x65", "\x73\x68\x6F\x72\x74", "\x61\x64\x64\x43\x6C\x61\x73\x73", "\x5B\x20\x54\x6F\x6F\x20\x73\x68\x6F\x72\x74\x20\x5D", "\x6D\x61\x74\x63\x68", "\x77\x65\x61\x6B", "\x5B\x20\x57\x65\x61\x6B\x20\x5D", "\x67\x6F\x6F\x64", "\x5B\x20\x47\x6F\x6F\x64\x20\x5D", "\x73\x74\x72\x6F\x6E\x67", "\x5B\x20\x53\x74\x72\x6F\x6E\x67\x20\x5D"]; function checkStrength(_0x2286x2) { var _0x2286x3 = 0; if (_0x2286x2[_0x3b32[0]] < 6) { $(_0x3b32[2])[_0x3b32[1]](); $(_0x3b32[2])[_0x3b32[4]](_0x3b32[3]); return _0x3b32[5] }; if (_0x2286x2[_0x3b32[0]] > 7) { _0x2286x3 += 1 }; if (_0x2286x2[_0x3b32[6]](/([a-z].*[A-Z])|([A-Z].*[a-z])/)) { _0x2286x3 += 1 }; if (_0x2286x2[_0x3b32[6]](/([a-zA-Z])/) && _0x2286x2[_0x3b32[6]](/([0-9])/)) { _0x2286x3 += 1 }; if (_0x2286x2[_0x3b32[6]](/([!,%,&,@,#,$,^,*,?,_,~])/)) { _0x2286x3 += 1 }; if (_0x2286x2[_0x3b32[6]](/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) { _0x2286x3 += 1 }; if (_0x2286x3 < 2) { $(_0x3b32[2])[_0x3b32[1]](); $(_0x3b32[2])[_0x3b32[4]](_0x3b32[7]); return _0x3b32[8] } else { if (_0x2286x3 == 2) { $(_0x3b32[2])[_0x3b32[1]](); $(_0x3b32[2])[_0x3b32[4]](_0x3b32[9]); return _0x3b32[10] } else { $(_0x3b32[2])[_0x3b32[1]](); $(_0x3b32[2])[_0x3b32[4]](_0x3b32[11]); return _0x3b32[12] } } }

            //Generate
            var _0xaa66 = ["\x76\x61\x6C", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x74\x78\x74\x50\x61\x73\x73\x77\x6F\x72\x64", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x74\x78\x74\x43\x6F\x6E\x66\x69\x72\x6D", "\x68\x74\x6D\x6C", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x73\x74\x72\x65\x6E\x67\x74\x68\x5F\x6D\x65\x73\x73\x61\x67\x65", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x70\x77\x64\x73\x74\x72\x68\x74"]; function generate() { $(_0xaa66[1])[_0xaa66[0]](randomPassword(8)); $(_0xaa66[2])[_0xaa66[0]]($(_0xaa66[1])[_0xaa66[0]]()); $(_0xaa66[4])[_0xaa66[3]](checkStrength($(_0xaa66[1])[_0xaa66[0]]())); $(_0xaa66[5])[_0xaa66[0]](checkStrength($(_0xaa66[1])[_0xaa66[0]]())) }

            //Password Strenght Check
            var _0x52f6 = ["\x76\x61\x6C", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x74\x78\x74\x50\x61\x73\x73\x77\x6F\x72\x64", "\x68\x74\x6D\x6C", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x73\x74\x72\x65\x6E\x67\x74\x68\x5F\x6D\x65\x73\x73\x61\x67\x65", "\x23\x43\x6F\x6E\x74\x65\x6E\x74\x50\x6C\x61\x63\x65\x48\x6F\x6C\x64\x65\x72\x31\x5F\x70\x77\x64\x73\x74\x72\x68\x74", "\x6B\x65\x79\x75\x70", "\x72\x65\x61\x64\x79"]; $(document)[_0x52f6[6]](function () { $(_0x52f6[1])[_0x52f6[5]](function () { $(_0x52f6[3])[_0x52f6[2]](checkStrength($(_0x52f6[1])[_0x52f6[0]]())); $(_0x52f6[4])[_0x52f6[0]](checkStrength($(_0x52f6[1])[_0x52f6[0]]())) }) })

            //Add Data
            function AddData() {
                $("#AddAdmin").fadeIn();
            }

            function ClosePopup() {
                $("#AddAdmin").fadeOut();
            }
        </script>
</asp:Content>

