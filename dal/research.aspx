﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DalMasterPage.master" AutoEventWireup="true" CodeFile="research.aspx.cs" Inherits="research" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .type {
            float:left;
            width: 150px;
            display: block;
            margin:50px 40px 50px 0;
        }

            .type ul {
                float: left;
                width: 100%;
                margin: 0;
                padding: 0;
                border-bottom: solid;
                border-bottom-width: 2px;
            }

                .type ul li {
                    list-style-position: inside;
                    list-style: none;
                }

                    .type ul li a {
                        padding-left: 25px;
                        padding-right: 25px;
                        padding-top: 5px;
                        padding-bottom: 5px;
                        font-size: large;
                        display: block;
                        text-align: center;
                    }

            .type div {
                width: 100%;
                display: block;
                border-left: solid;
                border-left-width: 10px;
                border-bottom: solid;
                border-bottom-width: 2px;
                text-indent: 5px;
            }

        #color1 * {
            border-color: #0072FF;
        }
        #color2 * {
            border-color: #0bf2f2;
        }
        #color3 * {
            border-color: #1762bf;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Research Members & Achievement</h2>
    <div class="type" id="color1">
        <div>教師</div><ul>
            <li><a href="">時序時</a></li>
            <li><a href="">徐煥智</a></li>
            <li><a href="">周清江</a></li>
            <li><a href="">黃良志</a></li>
            <li><a href="">鄭啟斌</a></li>
        </ul>
    </div>
    <div class="type" id="color2">
        <div>研究生</div><ul>
            
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            
        </ul>
    </div>
    <div class="type" id="color3">
        <div>大學生</div><ul>


        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            

        </ul>
    </div>
</asp:Content>

