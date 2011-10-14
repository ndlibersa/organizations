<?php

/*
**************************************************************************************************************************
** CORAL Organizations Module v. 1.0
**
** Copyright (c) 2010 University of Notre Dame
**
** This file is part of CORAL.
**
** CORAL is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
**
** CORAL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License along with CORAL.  If not, see <http://www.gnu.org/licenses/>.
**
**************************************************************************************************************************
*/

include_once 'directory.php';

$pageTitle='Administration';
include 'templates/header.php';

//set referring page
$_SESSION['ref_script']=$currentPage;

//ensure user has admin permissions
if ($user->isAdmin()){
	?>
	<table class="headerTable">
	<tr><td align='left'>
	<span class="headerText">Users</span>&nbsp;&nbsp;<span id='span_User_response'></span>
	<br /><span id='span_newUser' class='adminAddInput'><a href='ajax_forms.php?action=getAdminUserUpdateForm&height=185&width=250&modal=true' class='thickbox' id='expression'>add new user</a></span>
	<br /><br />
	<div id='div_User'>
	<img src = "images/circle.gif">Loading...
	</div>
	</td></tr>
	</table>

	<br />
	<br />


	<table class="headerTable">
	<tr><td align='left'>
	<span class="headerText">Organization Role</span>&nbsp;&nbsp;<span id='span_OrganizationRole_response'></span>
	<br /><span id='span_newOrganizationRole' class='adminAddInput'><a href='javascript:showAdd("OrganizationRole");'>add new organization role</a></span>
	<br /><br />
	<div id='div_OrganizationRole'>
	<img src = "images/circle.gif">Loading...
	</div>
	</td></tr>
	</table>

	<br />
	<br />

	<table class="headerTable">
	<tr><td align='left'>
	<span class="headerText">Contact Role</span>&nbsp;&nbsp;<span id='span_ContactRole_response'></span>
	<br /><span id='span_newContactRole' class='adminAddInput'><a href='javascript:showAdd("ContactRole");'>add new contact role</a></span>
	<br />
	<div id='div_ContactRole'>
	<img src = "images/circle.gif">Loading...
	</div>
	</td></tr>
	</table>


	<br />
	<br />

	<table class="headerTable">
	<tr><td align='left'>
	<span class="headerText">Alias Type</span>&nbsp;&nbsp;<span id='span_AliasType_response'></span>
	<br /><span id='span_newAliasType' class='adminAddInput'><a href='javascript:showAdd("AliasType");'>add new alias type</a></span>
	<br />
	<div id='div_AliasType'>
	<img src = "images/circle.gif">Loading...
	</div>
	</td></tr>
	</table>

	<br />
	<br />

	<table class="headerTable">
	<tr><td align='left'>
	<span class="headerText">External Login Type</span>&nbsp;&nbsp;<span id='span_ExternalLoginType_response'></span>
	<br /><span id='span_newExternalLoginType' class='adminAddInput'><a href='javascript:showAdd("ExternalLoginType");'>add new external login type</a></span>
	<br />
	<div id='div_ExternalLoginType'>
	<img src = "images/circle.gif">Loading...
	</div>
	</td></tr>
	</table>

	<script type="text/javascript" src="js/admin.js"></script>
	<?php

//end else for admin
}else{
	echo "You do not have permissions to access this screen.";
}

include 'templates/footer.php';
?>


