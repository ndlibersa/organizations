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
 


	viewAll=0;

	 $(".showOrganization").click(function () {
		if (viewAll == 0){
			$('#div_organization').show();
			$('#div_aliases').hide();
			$('#div_contacts').hide();
			$('#div_account').hide();
			$('#div_issues').hide();
			$('#div_licenses').hide();
		}
		return false;
	 });


	 $(".showAliases").click(function () {
		if (viewAll == 0){
			$('#div_organization').hide();
			$('#div_aliases').show();
			$('#div_contacts').hide();
			$('#div_account').hide();
			$('#div_issues').hide();
			$('#div_licenses').hide();
		}
		return false;

	 });

	  $(".showContacts").click(function () {
		if (viewAll == 0){
			$('#div_organization').hide();
			$('#div_aliases').hide();
			$('#div_contacts').show();
			$('#div_account').hide();
			$('#div_issues').hide();
			$('#div_licenses').hide();
		}
		return false;
	 });

	  $(".showAccount").click(function () {
		if (viewAll == 0){
			$('#div_organization').hide();
			$('#div_aliases').hide();
			$('#div_contacts').hide();
			$('#div_account').show();
			$('#div_issues').hide();
			$('#div_licenses').hide();
		}
		return false;
	 });

	  $(".showIssues").click(function () {
		if (viewAll == 0){
			$('#div_organization').hide();
			$('#div_aliases').hide();
			$('#div_contacts').hide();
			$('#div_account').hide();
			$('#div_issues').show();
			$('#div_licenses').hide();
		}
		return false;
	 });


	  $(".showLicenses").click(function () {
		if (viewAll == 0){
			$('#div_organization').hide();
			$('#div_aliases').hide();
			$('#div_contacts').hide();
			$('#div_account').hide();
			$('#div_issues').hide();
			$('#div_licenses').show();
		}
		return false;
	 });


	$(function(){
		$('.date-pick').datePicker({startDate:'01/01/1996'});
	});



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
		tb_reinit();
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
		tb_reinit();
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
		tb_reinit();
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
		tb_reinit();
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
		tb_reinit();
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
		tb_reinit();
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
		tb_reinit();
	 }


  });

}

   function removeOrganization(){

	if (($("#numLicenses").val() == 0) || ($("#numLicenses").val() == "")){

	  if (confirm("Do you really want to delete this organization?") == true) {
		  $.ajax({
			 type:       "GET",
			 url:        "ajax_processing.php",
			 cache:      false,
			 data:       "action=deleteOrganization&organizationID=" + $("#organizationID").val(),
			 success:    function(html) { 
				 //post return message to index
				postwith('index.php',{message:html});
			 }



		 });
	  }			


	}else{
		alert ("This Organization cannot be deleted because it has at least one License Record associated.");
	}
   }
   
   
   
   
   function removeAlias(id){
	  if (confirm("Do you really want to delete this alias?") == true) {
		  $.ajax({
			 type:       "GET",
			 url:        "ajax_processing.php",
			 cache:      false,
			 data:       "action=deleteInstance&class=Alias&id=" + id,
			 success:    function(html) {
				updateAliases();
			 }


		 });
	  }

   }


   function removeContact(id){
	  if (confirm("Do you really want to delete this contact?") == true) {
		  $.ajax({
			 type:       "GET",
			 url:        "ajax_processing.php",
			 cache:      false,
			 data:       "action=deleteInstance&class=Contact&id=" + id,
			 success:    function(html) {
				updateContacts();
 				updateArchivedContacts();
			 }


		 });
	  }

   }

   function removeExternalLogin(id){
	  if (confirm("Do you really want to delete this account?") == true) {
		  $.ajax({
			 type:       "GET",
			 url:        "ajax_processing.php",
			 cache:      false,
			 data:       "action=deleteInstance&class=ExternalLogin&id=" + id,
			 success:    function(html) {
				updateAccount();
			 }


		 });
	  }

   }



   function removeIssueLog(id){
	  if (confirm("Do you really want to delete this issue?") == true) {
		  $.ajax({
			 type:       "GET",
			 url:        "ajax_processing.php",
			 cache:      false,
			 data:       "action=deleteInstance&class=IssueLog&id=" + id,
			 success:    function(html) {
				updateIssues();
			 }


		 });
	  }

   }