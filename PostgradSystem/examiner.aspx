<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examiner.aspx.cs" Inherits="PostgradSystem.examiner" MasterPageFile="~/Base.Master" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <script language="javascript">

        $(document).ready(function () {
            var tab = document.getElementById('<%= hidTAB.ClientID%>').value;
            $('#' + tab).addClass('active');
            $('#' + tab).addClass('show');
            $('#' + tab + '-tab').addClass('active');
            console.log("Went back to " + tab);

            $('#v-pills-info-tab').click(() => {
                document.getElementById('<%=hidTAB.ClientID %>').value = 'v-pills-info';
            });
            $('#v-pills-list-tab').click(() => {
                document.getElementById('<%=hidTAB.ClientID %>').value = "v-pills-list";
            });
            $('#v-pills-addComment-tab').click(() => {
                document.getElementById('<%=hidTAB.ClientID %>').value = "v-pills-addComment";
            });
            $('#v-pills-addGrade-tab').click(() => {
                document.getElementById('<%=hidTAB.ClientID %>').value = "v-pills-addGrade";
            });
            $('#v-pills-search-tab').click(() => {
                document.getElementById('<%=hidTAB.ClientID %>').value = "v-pills-search";
            });
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="BodyContent" runat="server">
    <div class="d-flex align-items-start p-2 h-100" style="background-color: #eee;">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link" id="v-pills-info-tab" data-bs-toggle="pill" data-bs-target="#v-pills-info" type="button" role="tab" aria-controls="v-pills-info" aria-selected="true">My Information</button>
            <button class="nav-link" id="v-pills-list-tab" data-bs-toggle="pill" data-bs-target="#v-pills-list" type="button" role="tab" aria-controls="v-pills-list" aria-selected="false">List my defenses data</button>
            <button class="nav-link" id="v-pills-addComment-tab" data-bs-toggle="pill" data-bs-target="#v-pills-addComment" type="button" role="tab" aria-controls="v-pills-addComment" aria-selected="false">Add comment to defense</button>
            <button class="nav-link" id="v-pills-addGrade-tab" data-bs-toggle="pill" data-bs-target="#v-pills-addGrade" type="button" role="tab" aria-controls="v-pills-addGrade" aria-selected="false">Add grade to defense</button>
            <button class="nav-link" id="v-pills-search-tab" data-bs-toggle="pill" data-bs-target="#v-pills-search" type="button" role="tab" aria-controls="v-pills-search" aria-selected="false">Search for thesis</button>
        </div>
        <form runat="server" class="w-100 h-100">
            <asp:Button ID="logOutButton" class="btn btn-primary me-2 mb-2 align-self-end" Text="Log Out" OnClick="logOutButton_OnClick" runat="server"/>
            <asp:Button ID="managePhonesButton" class="btn btn-primary me-2 mb-2 align-self-end" Text="Manage Phones" OnClick="managePhonesButton_OnClick" runat="server"/>
            <asp:HiddenField ID="hidTAB" runat="server" Value="v-pills-info" />
            <div class="tab-content h-100" id="v-pills-tabContent">
                <div class="tab-pane fade h-100" id="v-pills-info" role="tabpanel" aria-labelledby="v-pills-info-tab">
                    <div class="card p-2 h-100">
                        <div class="mb-3 d-flex">
                            <div class="w-50 me-2">
                                <label for="examinerFirstName" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="examinerFirstName" runat="server" />
                            </div>
                            <div class="w-50">
                                <label for="examinerLastName" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="examinerLastName" runat="server" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="exmainerEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exmainerEmail" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="examinerPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="examinerPassword" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="examinerField" class="form-label">Field of Work</label>
                            <input type="text" class="form-control" id="examinerField" runat="server" />
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exmainerIsNational" runat="server" />
                            <label class="form-check-label" for="exmainerIsNational">Is National ?</label>
                        </div>
                        <asp:Button ID="examinerRegister" type="submit" CssClass="btn btn-primary w-25" OnClick="examinerRegister_OnClick" Text="Save Data" runat="server" />
                        <asp:Label runat="server" ID="errorLabel" CssClass="alert alert-success d-block mt-2" role="alert" Visible="false"/>             
                    </div>
                </div>
                <div class="tab-pane fade h-100" id="v-pills-list" role="tabpanel" aria-labelledby="v-pills-list-tab">
                    <div class="card p-2 h-100">
                        <asp:Button CssClass="btn btn-primary" Text="Refresh" ID="refreshListBtn" OnClick="refreshListBtn_OnClick" runat="server"/>
                        <asp:GridView CssClass="table table-borderless table-striped mt-2" style="max-height: 600px" runat="server" ID="lstGrid"></asp:GridView>
                        <h3>Thesis Supervisors: </h3>
                        <asp:GridView CssClass="table table-borderless table-striped mt-2" runat="server" ID="supList"/>
                    </div>
                </div>
                <div class="tab-pane fade h-100" id="v-pills-addComment" role="tabpanel" aria-labelledby="v-pills-addComment-tab">
                    <div class="card p-2 h-100">
                        <div class="mb-3">
                            <label for="commentThesisInput" class="form-label">Thesis Serial</label>
                            <input type="number" class="form-control" id="commentThesisInput" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="commentDateTimeInput" class="form-label">Defense Date</label>
                            <input type="date" class="form-control" id="commentDateTimeInput" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="commentsTextArea" class="form-label">Comments</label>
                            <textarea class="form-control" id="commentsTextArea" rows="3" runat="server"></textarea>
                        </div>
                        <asp:Button ID="SaveCommentBtn" type="submit" CssClass="btn btn-primary w-25" Text="Save Comment" OnClick="SaveCommentBtn_OnClick" runat="server" />
                        <asp:Label runat="server" ID="addCommentLabel" CssClass="alert alert-success d-block mt-2" role="alert" Visible="false"/> 

                    </div>
                </div>
                <div class="tab-pane fade h-100" id="v-pills-addGrade" role="tabpanel" aria-labelledby="v-pills-addComment-tab">
                    <div class="card p-2 h-100">
                        <div class="mb-3">
                            <label for="gradeThesisInput" class="form-label">Thesis Serial</label>
                            <input type="number" class="form-control" id="gradeThesisInput" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="gradeDefenseDate" class="form-label">Defense Date</label>
                            <input type="date" class="form-control" id="gradeDefenseDate" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="gradeValueInput" class="form-label">Grade</label>
                            <input type="number" step="0.01" min="0" max="100.00" class="form-control" id="gradeValueInput" runat="server" />
                        </div>
                        <asp:Button ID="saveGradeBtn" type="submit" CssClass="btn btn-primary w-25" Text="Save Grade" OnClick="saveGradeBtn_OnClick" runat="server" />
                        <asp:Label runat="server" ID="gradeLabel" CssClass="alert alert-success d-block mt-2" role="alert" Visible="false"/> 

                    </div>
                </div>
                <div class="tab-pane fade h-100" id="v-pills-search" role="tabpanel" aria-labelledby="v-pills-search-tab">
                    <div class="card p-2 h-100">
                        <div class="d-flex flex-column">
                            <div class="h-25">
                                <label for="searchText" class="form-label">Search For: </label>
                                <div class="d-flex">
                                    <input type="text" class="form-control w-75 me-2" id="searchText" runat="server" />
                                    <asp:Button ID="searchBtn" type="submit" CssClass="btn btn-primary w-25" OnClick="searchBtn_OnClick" Text="Search" runat="server" />
                                </div>
                            </div>
                            <div class="mt-2">
                                <asp:GridView CssClass="table table-borderless table-striped" runat="server" ID="searchResults"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>