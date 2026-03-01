<%@ Page Title="Quizzes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quizzes.aspx.cs" Inherits="WAPPAssignment.Member.Quizzes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h1>?? Test Your Knowledge</h1>
        <p class="lead" style="color: var(--moon-silver);">Challenge yourself with our cosmic quizzes!</p>
    </div>

    <div class="row g-4">
        <asp:Repeater ID="rptQuizzes" runat="server">
            <ItemTemplate>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h3><%# Eval("Title") %></h3>
                        </div>
                        <div class="card-body">
                            <p class="card-text"><%# Eval("Description") %></p>
                            <hr />
                            <div style="font-size: 0.9rem; color: var(--moon-silver);">
                                <p>?? <strong>Category:</strong> <%# Eval("Category") %></p>
                                <p>? <strong>Difficulty:</strong> 
                                    <span class='<%# GetDifficultyClass(Eval("DifficultyLevel").ToString()) %>'>
                                        <%# Eval("DifficultyLevel") %>
                                    </span>
                                </p>
                                <p>?? <strong>Time Limit:</strong> <%# Eval("TimeLimit") %> minutes</p>
                                <p>? <strong>Passing Score:</strong> <%# Eval("PassingScore") %>%</p>
                            </div>
                            <asp:HyperLink runat="server" 
                                NavigateUrl='<%# "~/Member/TakeQuiz.aspx?id=" + Eval("QuizID") %>' 
                                CssClass="btn btn-success w-100">
                                Start Quiz
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="card mt-5">
        <div class="card-header">
            <h3>?? Your Quiz History</h3>
        </div>
        <div class="card-body">
            <asp:GridView ID="gvQuizHistory" runat="server" 
                CssClass="table GridView" 
                AutoGenerateColumns="False"
                EmptyDataText="You haven't taken any quizzes yet. Start learning!">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Quiz Title" />
                    <asp:BoundField DataField="Score" HeaderText="Your Score" />
                    <asp:BoundField DataField="TotalQuestions" HeaderText="Total Questions" />
                    <asp:BoundField DataField="Percentage" HeaderText="Percentage" DataFormatString="{0:F1}%" />
                    <asp:TemplateField HeaderText="Result">
                        <ItemTemplate>
                            <span class='<%# (decimal)Eval("Percentage") >= Convert.ToDecimal(Eval("PassingScore")) ? "badge bg-success" : "badge bg-danger" %>'>
                                <%# (decimal)Eval("Percentage") >= Convert.ToDecimal(Eval("PassingScore")) ? "Passed" : "Failed" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="AttemptDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy HH:mm}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
