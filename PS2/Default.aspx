<%@ Page Title="PS2 Stations 2012" Language="C#" MasterPageFile="~/MasterPage.master"
	AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PS2List_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<%--Scripts moved to bottom--%>
	<style type="text/css">
		#PS2Link
		{
			display: none;
		}
		td
		{
			padding-left: 10px;
		}
		.HideMe
		{
			overflow: hidden;
			width: 244px;
		}
		.hideMe
		{
			display: none;
		}
		.highlight
		{
			background-color: yellow;
			box-shadow: 2px 2px 2px #888;
			padding: 1px;
			border-radius: 3px;
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
		}
		tr:nth-child(2n)
		{
			background-color: #CCC;
		}
		
		#FilterMe th
		{
			padding: 10px 0;
		}
		#FilterMe td
		{
			padding: 5px;
			font-size: 14px;
		}
		.col0
		{
			width: 50px !important;
		}
		.col1
		{
			width: 200px !important;
		}
		.col2
		{
			width: 100px !important;
		}
		.col3
		{
			width: 85px !important;
		}
		.hcol
		{
			display: none;
			width: 0;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
	<input id="StationsList" type="hidden" runat="server" />
	<div style="background: #FFF; padding: 20px; margin-top: 10px; -moz-border-radius: 10px;
		border-radius: 10px">
		<h2 style="margin: 0px auto 10px auto;">
			List of all PS2 Stations as on 3 May, 2012... (Company list is updated everyday @ 10:00 am in the morning)
		</h2>
        <h2 style="color: Red; text-align: center; margin: 10px 0;">
            PS2 2012 stations preference list is up!!! Check your bits mail :)
        </h2>
		<br />
		Filter &rarr;
		<input id="Filter_Text" type="text" onkeyup="updateTable()" runat="server" />
		(E.g. Zynga or Computer Science) <b id="res_count"></b>
		<br />
		<br />
		<b style="text-align: center;">Stipend is averaged, if there are multiple values and
			0/- for those who havent mentioned!</b>
		<br />
		<br />
		<em>Click on Column headers to sort (Ascending / Descending)</em>
		<table id="FilterMe" border="1" width="100%">
			<thead>
				<tr>
					<th class="col0">
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="0">Sno</a>
					</th>
					<th>
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="1">Station</a>
					</th>
					<th class="col2">
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="2">Location</a>
					</th>
					<th class="col3">
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="3">Stipend</a>
					</th>
					<th class="col4">
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="4">Branches</a>
					</th>
					<th class="hcol">
						<a href="javascript:void(0)" class="sort" data-currsortorder="asc" data-icol="5">Links
							- Hidden ;)</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6" style="text-align: center; font-weight: bold; padding: 10px;">
						Loading Data...
					</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center; margin-top: 15px;">
			<b>** Caution: All this data generation is automated (done by scripts). To the best
				of my knowledge, there shouldn't be any mistake. Please let me know if there are
				any @ <a href="../Misc%20Pages/FeedBack_Contact.aspx#Feedback" target="_blank">Feedback</a>
			</b>
			<p style="text-align: right;">
				<em>- Nitin Pasumarthy, Developer, Campus eBay</em></p>
		</div>
	</div>
	<div id="FillStipendWorkingDiv" style="display: none;">
	</div>
	<div id="StationsListWorkingDiv" style="display: none;">
	</div>
	<script src="../JQuery.js" type="text/javascript"></script>
	<script src="../_scripts/HighlightMe.js" type="text/javascript"></script>
	<script src="../_scripts/createLink.js" type="text/javascript"></script>
	<script src="scripts/com_nitin.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/ScriptsOfThisPage.js"></script>
	<%--<script src="scripts/scripts.js" type="text/javascript"></script>--%>
</asp:Content>
