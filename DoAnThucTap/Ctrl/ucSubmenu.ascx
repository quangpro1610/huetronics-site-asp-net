<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSubmenu.ascx.cs" Inherits="Ctrl_ucSubmenu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
  <style>
    a {
	font-family:Tahoma;
	font-size:13px;
	text-decoration: none;
 	color:#303030;
    }
    .divframe_headSelected
    {
	    background: #fff url(../Menu/Images/headselected.png);
	    line-height:24px;
	    height:25px;
	    padding-left:10px;
	    text-align:left;
	    border-bottom: 1px solid #CCC;
	    margin: 0px 0px 0px 0px;
	    font-weight:bold;
    }
    .accoditionContent
    {
	    border: 1px dashed #CCC;
	    border-top: none;
        padding: 5px;
        text-align:left;
        line-height:25px;
        padding-top: 10px;
        background-color: #DDD;
    }
    .accoditionHeader
    {
	    background: #fff url(../Menu/Images/Title_bg.jpg);
	    line-height:24px;
	    height:25px;
	    text-align:left;
	    padding-left:10px;
	    border-bottom: 1px solid #CCC;
	    margin: 0px 0px 0px 0px;
	    font-weight:bold;
    }
    </style>
    <div>
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <div>
    <cc1:Accordion ID="Accordion1" Width="200"
    AutoSize="None"
    HeaderCssClass="accoditionHeader" 
    HeaderSelectedCssClass="divframe_headSelected"
    FadeTransitions="true"
    SuppressHeaderPostbacks="true"
    ContentCssClass="accoditionContent"
    runat="server"></cc1:Accordion>
    </div>
    </div>