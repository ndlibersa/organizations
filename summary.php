<?php

/*
**************************************************************************************************************************
** CORAL Organizations Module v. 1.1
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


session_start();

include_once 'directory.php';


$organizationID = $_GET['organizationID'];
$organization = new Organization(new NamedArguments(array('primaryKey' => $organizationID)));
$pageTitle=$organization->name;
$config = new Configuration;
$util = new Utility();

//as long as organization is valid...
if ($organization->name){

	//if the licensing module is installed display licensing info
	$config = new Configuration;

	$showLicensing='N';
	if ($config->settings->licensingModule == 'Y'){
		$showLicensing = 'Y';
		$numLicenses = count($organization->getLicenses());
	}

	?>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	<title>Organizations Module - <?php echo $pageTitle; ?></title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="public">
	
	<link rel="stylesheet" href="css/style.css" type="text/css" media="print" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
	<script type="text/javascript" src="js/plugins/jquery.js"></script>

	</head>

	<body>


	<div class='printContent'>

		<?php


		//fix company url in case http is missing
		if ($organization->companyURL){
			if (strpos(strtolower($organization->companyURL), 'http:') === false){
				$companyURL = "http://" . $organization->companyURL;
			}else{
				$companyURL = $organization->companyURL;
			}

		}

		//get parent organizations
		$sanitizedInstance = array();
		$instance = new Organization();
		$parentOrganizationArray = array();
		foreach ($organization->getParentOrganizations() as $instance) {
			foreach (array_keys($instance->attributeNames) as $attributeName) {
				$sanitizedInstance[$attributeName] = $instance->$attributeName;
			}

			$sanitizedInstance[$instance->primaryKeyName] = $instance->primaryKey;

			array_push($parentOrganizationArray, $sanitizedInstance);
		}


		//get children organizations
		$sanitizedInstance = array();
		$instance = new Organization();
		$childOrganizationArray = array();
		foreach ($organization->getChildOrganizations() as $instance) {
			foreach (array_keys($instance->attributeNames) as $attributeName) {
				$sanitizedInstance[$attributeName] = $instance->$attributeName;
			}

			$sanitizedInstance[$instance->primaryKeyName] = $instance->primaryKey;

			array_push($childOrganizationArray, $sanitizedInstance);
		}


		//get roles
		$sanitizedInstance = array();
		$instance = new OrganizationRole();
		$organizationRoleArray = array();
		foreach ($organization->getOrganizationRoles() as $instance) {
			$organizationRoleArray[]=$instance->shortName;
		}

		?>
		<table class='linedFormTable' style='width:440px;'>
		<tr>
		<th colspan='2' style='height:30px; margin-top: 7px; margin-bottom: 5px; vertical-align:middle'>

			<span style='float:left; font-size:115%; max-width:400px;'>&nbsp;<?php echo $organization->name; ?></span>
			<span style='float:right; vertical-align:top;'></span>
		</th>
		</tr>

		<?php if (count($parentOrganizationArray) > 0){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Parent Organization:</td>
			<td style='width:320px;'>
			<?php
			foreach ($parentOrganizationArray as $parentOrganization){
				echo $parentOrganization['name'] . "&nbsp;&nbsp;";
				echo "<a href='orgDetail.php?organizationID=" . $parentOrganization['organizationID'] . "'><img src='images/arrow-up-right.gif' alt='view organization' title='View' style='vertical-align:top;'></a><br />";
			}
			?>
			</td>
			</tr>
		<?php
		}


		if (count($childOrganizationArray) > 0){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Child Organizations:</td>
			<td style='width:320px;'>
			<?php
			foreach ($childOrganizationArray as $childOrganization){
				echo $childOrganization['name'] . "&nbsp;&nbsp;";
				echo "<a href='orgDetail.php?organizationID=" . $childOrganization['organizationID'] . "'><img src='images/arrow-up-right.gif' alt='view organization' title='View' style='vertical-align:top;'></a><br />";
			}
			?>
			</td>
			</tr>
		<?php
		}


		if ($organization->companyURL){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Company URL:</td>
			<td style='width:320px;'><a href='<?php echo $companyURL; ?>' target='_blank'><?php echo $organization->companyURL; ?></a></td>
			</tr>
		<?php
		}

		if (count($organizationRoleArray) > 0){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Role(s):</td>
			<td style='width:320px;'><?php echo implode(", ", $organizationRoleArray); ?></td>
			</tr>
		<?php
		}

		if ($organization->accountDetailText){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Account Details:</td>
			<td style='width:320px;'><?php echo nl2br($organization->accountDetailText); ?></td>
			</tr>
		<?php
		}

		if ($organization->noteText){ ?>
			<tr>
			<td style='vertical-align:top;text-align:left;width:140px;'>Notes:</td>
			<td style='width:320px;'><?php echo nl2br($organization->noteText); ?></td>
			</tr>
		<?php
		}

		?>
		</table>


		<?php

	   	

		$createUser = new User(new NamedArguments(array('primaryKey' => $organization->createLoginID)));
		$updateUser = new User(new NamedArguments(array('primaryKey' => $organization->updateLoginID)));

		echo "<i>Created: " . format_date($organization->createDate);
		//since organizations can be created by other modules the user may or may not be set and may or may not have a user entry in this db
		if ($createUser->primaryKey){
			echo " by ";
			if ($createUser->firstName){
				echo $createUser->firstName . " " . $createUser->lastName;
			}else{
				echo $createUser->primaryKey;
			}
		}

		?>

		</i>
		<br />


		<?php
		if (($organization->updateDate) && ($organization->updateDate != '0000-00-00')){
			echo "<i>Last Update: " . format_date($organization->updateDate); ?> by <?php echo $updateUser->firstName . " " . $updateUser->lastName . "</i>";
		}



		//get aliases
		$sanitizedInstance = array();
		$instance = new Alias();
		$aliasArray = array();
		foreach ($organization->getAliases() as $instance) {
			foreach (array_keys($instance->attributeNames) as $attributeName) {
				$sanitizedInstance[$attributeName] = $instance->$attributeName;
			}

			$sanitizedInstance[$instance->primaryKeyName] = $instance->primaryKey;

			$aliasType = new AliasType(new NamedArguments(array('primaryKey' => $instance->aliasTypeID)));
			$sanitizedInstance['aliasTypeShortName'] = $aliasType->shortName;

			array_push($aliasArray, $sanitizedInstance);
		}


		?>
		<br /><br />
		<table class='linedFormTable' style='width:440px;'>
		<tr>
		<th>&nbsp;Aliases</th>
		<th></th>
		</tr>

		<?php
		foreach ($aliasArray as $organizationAlias){
			echo "<tr>\n";
			echo "<td>" . $organizationAlias['name'] . "</td>\n";
			echo "<td>" . $organizationAlias['aliasTypeShortName'] . "</td>\n";
			echo "</tr>\n";
		}

		if (count($aliasArray) < 1){
			echo "<tr><td><i>No aliases defined</i></td></tr>";
		}

		?>

		</table>
		<br />

		<?php

    	if (isset($_GET['archiveInd'])) $archiveInd = $_GET['archiveInd']; else $archiveInd='';
    	if (isset($_GET['showArchivesInd'])) $showArchivesInd = $_GET['showArchivesInd']; else $showArchivesInd='';


 		//get contacts
 		$sanitizedInstance = array();
 		$contactArray = array();
 		$contactObjArray = array();
 		if ((isset($archiveInd)) && ($archiveInd == "1")){
 			//if we want archives to be displayed
 			if ($showArchivesInd == "1"){
 				if (count($organization->getArchivedContacts()) > 0){
 					echo "<i><b>The following are archived contacts:</b></i>";
 				}
 				$contactObjArray = $organization->getArchivedContacts();
 			}
 		}else{
 			$contactObjArray = $organization->getUnarchivedContacts();
 		}


 		foreach ($contactObjArray as $contact) {
 			foreach (array_keys($contact->attributeNames) as $attributeName) {
 				$sanitizedInstance[$attributeName] = $contact->$attributeName;
 			}

 			$sanitizedInstance[$contact->primaryKeyName] = $contact->primaryKey;

			//get all of this contacts roles
			$contactRoleObj = new ContactRole();
			$contactRoleArray = array();
			foreach ($contact->getContactRoles() as $contactRoleObj) {
				$contactRoleArray[]=$contactRoleObj->shortName;
			}

 			$sanitizedInstance['contactRoles'] = implode("<br />", $contactRoleArray);

 			array_push($contactArray, $sanitizedInstance);
		}

		?>
		<table class='linedFormTable' style='width:440px;'>
		<tr>
		<th style='width:150px;vertical-align:top;text-align:left'><span style='float:left; font-size:115%; max-width:400px;'>&nbsp;Contacts</span></th>
		<th></th>
		</tr>

		<?php
		foreach ($contactArray as $contact){
		?>
			
			<tr>
			<th style='width:150px;vertical-align:top;text-align:left'>&nbsp;<?php echo $contact['contactRoles']; ?></th>
			<th>
			<?php

			if ($contact['name']){
				echo $contact['name'] . "&nbsp;&nbsp;";
			}

			?>
			</th>
			</tr>

			<?php if (($contact['archiveDate'] != '0000-00-00') && ($contact['archiveDate'])) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;background-color:#ebebeb'>No longer valid:</td>
			<td style='background-color:#ebebeb'><i><?php echo format_date($contact['archiveDate']); ?></i></td>
			</tr>
			<?php
			}

			if ($contact['title']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Title:</td>
			<td><?php echo $contact['title']; ?></td>
			</tr>
			<?php
			}

			if ($contact['addressText']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Address:</td>
			<td><?php echo nl2br($contact['addressText']); ?></td>
			</tr>
			<?php
			}

			if ($contact['phoneNumber']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Phone:</td>
			<td><?php echo $contact['phoneNumber']; ?></td>
			</tr>
			<?php
			}

			if ($contact['altPhoneNumber']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Alt Phone:</td>
			<td><?php echo $contact['altPhoneNumber']; ?></td>
			</tr>
			<?php
			}

			if ($contact['faxNumber']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Fax:</td>
			<td><?php echo $contact['faxNumber']; ?></td>
			</tr>
			<?php
			}

			if ($contact['emailAddress']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Email:</td>
			<td><a href='mailto:<?php echo $contact['emailAddress']; ?>'><?php echo $contact['emailAddress']; ?></a></td>
			</tr>
			<?php
			}

			if ($contact['noteText']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Notes:</td>
			<td><?php echo nl2br($contact['noteText']); ?></td>
			</tr>
			<?php
			}

			if ($contact['lastUpdateDate']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Last Updated:</td>
			<td><i><?php echo format_date($contact['lastUpdateDate']); ?></i></td>
			</tr>
			<?php
			}
			?>

		<?php
		}
		if (count($contactArray) < 1){
			if (($archiveInd != 1) && ($showArchivesInd != 1)){
				echo "<tr><td><i>No unarchived contacts</i></td></tr>";
			}
		}
		echo "</table><br />";


 		//get external logins
 		$sanitizedInstance = array();
 		$externalLoginArray = array();
 		foreach ($organization->getExternalLogins() as $instance) {
 			foreach (array_keys($instance->attributeNames) as $attributeName) {
 				$sanitizedInstance[$attributeName] = $instance->$attributeName;
 			}

 			$sanitizedInstance[$instance->primaryKeyName] = $instance->primaryKey;

 			$externalLoginType = new ExternalLoginType(new NamedArguments(array('primaryKey' => $instance->externalLoginTypeID)));
 			$sanitizedInstance['externalLoginTypeShortName'] = $externalLoginType->shortName;

 			array_push($externalLoginArray, $sanitizedInstance);
		}

		?>

		<table class='linedFormTable' style='width:440px;max-width:440px;'>
		<tr>
			<th style='width:150px;vertical-align:top;text-align:left' colspan="3"><span style='float:left; font-size:115%; max-width:400px;'>&nbsp;External Logins</span></th>
		</tr>

		<?php
			foreach ($externalLoginArray as $externalLogin){
			?>
			
			<tr>
			<th style='width:150px;vertical-align:top;text-align:left;'>&nbsp;<?php echo $externalLogin['externalLoginTypeShortName']; ?></th>
			<th>
			</th>
			</tr>

			<?php if ($externalLogin['loginURL']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Login URL:</td>
			<td><?php echo $externalLogin['loginURL']; 
				if (strpos($externalLogin['loginURL'], 'http') !== 0) {
					$externalLogin['loginURL'] = "http://" . $externalLogin['loginURL'];
				}
			?>&nbsp;&nbsp;<a href='<?php echo $externalLogin['loginURL']; ?>' target='_blank'><img src='images/arrow-up-right.gif' alt='Visit Login URL' title='Visit Login URL' style='vertical-align:top;'></a></td>
			</tr>
			<?php
			}

			if ($externalLogin['emailAddress']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Local email on account:</td>
			<td><?php echo $externalLogin['emailAddress']; ?></td>
			</tr>
			<?php
			}

			if ($externalLogin['username']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>User Name:</td>
			<td><?php echo $externalLogin['username']; ?></td>
			</tr>
			<?php
			}

			if ($externalLogin['password']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Password:</td>
			<td><?php echo $externalLogin['password']; ?></td>
			</tr>
			<?php
			}

			if ($externalLogin['updateDate']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Last Updated:</td>
			<td><i><?php echo format_date($externalLogin['updateDate']); ?></i></td>
			</tr>
			<?php
			}

			if ($externalLogin['noteText']) { ?>
			<tr>
			<td style='vertical-align:top;text-align:left;'>Notes:</td>
			<td><?php echo nl2br($externalLogin['noteText']); ?></td>
			</tr>
			<?php
			}
			?>

			<?php
			}
		if (count($externalLoginArray) < 1){
			echo "<tr><td><i>No external logins added</i></td></tr>";
		}
		echo "</table>";

 		//get issues
 		$sanitizedInstance = array();
 		$issueLogArray = array();
 		foreach ($organization->getIssueLog() as $instance) {
 			foreach (array_keys($instance->attributeNames) as $attributeName) {
 				$sanitizedInstance[$attributeName] = $instance->$attributeName;
 			}

 			$sanitizedInstance[$instance->primaryKeyName] = $instance->primaryKey;

			$updateUser = new User(new NamedArguments(array('primaryKey' => $instance->updateLoginID)));

			//in case this user doesn't have a first / last name set up
			if (($updateUser->firstName != '') || ($updateUser->lastName != '')){
				$sanitizedInstance['updateUser'] = $updateUser->firstName . " " . $updateUser->lastName;
			}else{
				$sanitizedInstance['updateUser'] = $instance->updateLoginID;
			}

 			array_push($issueLogArray, $sanitizedInstance);
		}

		$charsToRemove = array("*", "_");

		?>
		
		<br />
		<table class='linedFormTable' style='width:440px;'>
		<tr>
			<th style='width:150px;vertical-align:top;text-align:left' colspan="3"><span style='float:left; font-size:115%; max-width:400px;'>&nbsp;Issues</span></th>
		</tr>

		<?php

		if (count($issueLogArray) > 0){
		?>
		
		<tr>
		<th>&nbsp;Date Added</th>
		<th>Issue Date</th>
		<th>Notes</th>
		</tr>

		<?php foreach ($issueLogArray as $issueLog){
			if (($issueLog['issueDate'] != '') && ($issueLog['issueDate'] != "0000-00-00")) {
				$issueDate= format_date($issueLog['issueDate']);
			}else{
				$issueDate='';
			}
			?>
			<tr>
			<td style='width:80px;'><?php echo format_date($issueLog['updateDate']); ?><br />by <i><?php echo $issueLog['updateUser']; ?></i></td>
			<td><?php echo $issueDate ?></td>
			<td style='width:360px;'><?php echo nl2br(str_replace($charsToRemove, "", $issueLog['noteText'])); ?></td>
			</tr>
		<?php } ?>

		<br />
		<?php
		} else {
			echo "<tr><td colspan='3'><i>No issues reported</i></td></tr>";
		}

		echo "</table><br />";

		if ($showLicensing == "Y") {

			//get licenses
			$sanitizedInstance = array();
			$instance = new Alias();
			$licenseArray = array();

			try {
				$licenseArray = $organization->getLicenses();
				?>

				<br />
				<table class='linedFormTable' style='width:440px;'>
				<tr>
					<th style='width:150px;vertical-align:top;text-align:left' colspan="3"><span style='float:left; font-size:115%; max-width:400px;'>&nbsp;Licenses</span></th>
				</tr>


				<?php				
				if (count($licenseArray) > 0){ ?>
					<tr>
					<th>&nbsp;</th>
					<th>Consortium</th>
					<th>Status</th>
					</tr>

					<?php
					$licensingPath = $util->getLicensingURL();

					foreach ($licenseArray as $license){
						echo "<tr>\n";
						echo "<td>" . $license['licenseName'] . "</td>\n";
						echo "<td>" . $license['consortiumName'] . "</td>\n";
						echo "<td>" . $license['status'] . "</td>\n";
						echo "</tr>\n";
					}
					?>

					</table>
					<br />
				<?php
				} else {
					echo "<tr><td colspan='3'><i>No licenses set up for this organization</i></td></tr>";
				}

				echo "</table><br />";

			}catch(Exception $e){
				echo "<span style='color:red;'>Unable to access the licensing database.  Make sure the configuration.ini is pointing to the correct place and that the database and associated tables have been set up.</span>";
			}

		}
		?>

	</div>


	<input type='hidden' name='organizationID' id='organizationID' value='<?php echo $organizationID; ?>'>



	</body>
	</html>

	<?php
//end if organization valid
}else{
	echo "invalid organization";
}

?>
