<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminSettings.aspx.cs" Inherits="ProjectSem6.AdminSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 id="settingsTitle">Settings</h2>
        <div class="theme-toggle-container">
            <label class="switch">
                <input type="checkbox" id="themeToggle">
                <span class="slider round"></span>
            </label>
            <span id="themeLabel">Light Mode</span>
        </div>
    </div>
  <script>
      document.addEventListener("DOMContentLoaded", function () {
          const themeToggle = document.getElementById("themeToggle");
          const body = document.body;

          if (localStorage.getItem("theme") === "dark") {
              body.classList.add("dark-mode");
              themeToggle.checked = true;
          }

          themeToggle.addEventListener("change", function () {
              if (themeToggle.checked) {
                  body.classList.add("dark-mode");
                  localStorage.setItem("theme", "dark");
                  document.dispatchEvent(new CustomEvent("themeChanged", { detail: "dark" }));
              } else {
                  body.classList.remove("dark-mode");
                  localStorage.setItem("theme", "light");
                  document.dispatchEvent(new CustomEvent("themeChanged", { detail: "light" }));
              }
          });
      });
  </script>
</asp:Content>
