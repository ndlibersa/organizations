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

 $(document).ready(function(){
 	updateOrganization();
 	updateAliases();
 	updateContacts();
 	updateArchivedContacts(0);
 	updateAccount();
 	updateIssues();
 	updateLicenses();
 
 });
 
 
var showArchivedContacts = 0;

function updateOrganization(){
  $("#div_organizationDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getOrganizationDetails&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
	 	updateOrganizationName();
		$("#div_organizationDetails").html(html);
	 }


  });

}
 
function updateOrganizationName(){
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getOrganizationName&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
		$("#span_orgName").html(html);
	 }


  });

}
 
 
function updateAliases(){
  $("#div_aliasDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getAliasDetails&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
		$("#div_aliasDetails").html(html);
	 }


  });

}

 
 
function updateContacts(){
  $("#div_contactDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getContactDetails&organizationID=" + $("#organizationID").val() + "&archiveInd=0",
	 success:    function(html) {
		$("#div_contactDetails").html(html);
	 }


  });

}


 
function updateArchivedContacts(showArchivedPassed){
  if (typeof(showArchivedPassed) != 'undefined'){
	showArchivedContacts = showArchivedPassed;
  }

  
  $("#div_archivedContactDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getContactDetails&organizationID=" + $("#organizationID").val() + "&archiveInd=1&showArchivesInd=" + showArchivedContacts,
	 success:    function(html) {
		$("#div_archivedContactDetails").html(html);
	 }


  });

}
 
 
function updateAccount(){
  $("#div_accountDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getAccountDetails&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
		$("#div_accountDetails").html(html);
	 }


  });

}

 
function updateIssues(){
  $("#div_issueDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getIssueDetails&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
		$("#div_issueDetails").html(html);
	 }


  });

}

 
function updateLicenses(){
  $("#div_licenseDetails").append("<img src='images/circle.gif'>  Refreshing Contents...");
  $.ajax({
	 type:       "GET",
	 url:        "ajax_htmldata.php",
	 cache:      false,
	 data:       "action=getLicenseDetails&organizationID=" + $("#organizationID").val(),
	 success:    function(html) {
		$("#div_licenseDetails").html(html);
	 }


  });

}
