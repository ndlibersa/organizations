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


include_once 'directory.php';
include_once 'user.php';


switch ($_GET['action']) {


    case 'submitOrganization':
		//if this is an existing organization
		$organizationID=$_POST['organizationID'];
		if ($organizationID){
			$organization = new Organization(new NamedArguments(array('primaryKey' => $organizationID)));

			$organization->updateLoginID 		= $loginID;
			$organization->updateDate			= date( 'Y-m-d H:i:s' );
		}else{
			//set up new organization
			$organization = new Organization();

			$organization->createLoginID 		= $loginID;
			$organization->createDate			= date( 'Y-m-d H:i:s' );

			$organization->updateLoginID 		= '';
			$organization->updateDate			= '';
		}

		$organization->name = trim($_POST['name']);
		if ($_POST['companyURL'] != 'http://'){
			$organization->companyURL = $_POST['companyURL'];
		}else{
			$organization->companyURL = '';
		}

		$organization->noteText = $_POST['noteText'];
		$organization->accountDetailText = $_POST['accountDetailText'];

		try {
			$organization->save();
			if (!$organizationID){
				echo $organization->primaryKey;
				$organizationID=$organization->primaryKey;
			}

			//first remove all orgs, then we'll add them back
			$organization->removeOrganizationRoles();

			foreach (explode(',', $_POST['organizationRoles']) as $id){
				if ($id){
					$organizationRoleProfile = new OrganizationRoleProfile();
					$organizationRoleProfile->organizationID = $organizationID;
					$organizationRoleProfile->organizationRoleID = $id;
					$organizationRoleProfile->save();
				}
			}

			//next, add organization hierarchy if added
			if ($_POST['parentOrganizationID'] != ""){
				//first remove all parents, then we'll add them back
				$organization->removeParentOrganizations();

				if ($_POST['parentOrganization']){
					$organizationHierarchy = new OrganizationHierarchy();
					$organizationHierarchy->organizationID = $organizationID;
					$organizationHierarchy->parentOrganizationID = $_POST['parentOrganizationID'];
					$organizationHierarchy->save();
				}


			}


		} catch (Exception $e) {
			echo $e->getMessage();
		}

        break;



    case 'submitAlias':
		//if this is an existing alias
		$aliasID=$_POST['aliasID'];

		if ($aliasID){
			$alias = new Alias(new NamedArguments(array('primaryKey' => $aliasID)));
		}else{
			//set up new alias
			$alias = new Alias();
		}

		$alias->aliasTypeID = $_POST['aliasTypeID'];
		$alias->organizationID = $_POST['organizationID'];
		$alias->name = $_POST['name'];

		try {
			$alias->save();
		} catch (Exception $e) {
			echo $e->getMessage();
		}

        break;



    case 'submitContact':
		//if this is an existing contact
		if (isset($_POST['contactID'])) $contactID=$_POST['contactID']; else $contactID='';

		if ($contactID){
			$contact = new Contact(new NamedArguments(array('primaryKey' => $contactID)));
		}else{
			//set up new contact
			$contact = new Contact();
		}

		$contact->lastUpdateDate		= date( 'Y-m-d' );
		$contact->organizationID 		= $_POST['organizationID'];
		$contact->name 					= $_POST['name'];
		$contact->title 				= $_POST['title'];
		$contact->addressText			= $_POST['addressText'];
		$contact->phoneNumber			= $_POST['phoneNumber'];
		$contact->altPhoneNumber		= $_POST['altPhoneNumber'];
		$contact->faxNumber				= $_POST['faxNumber'];
		$contact->emailAddress			= $_POST['emailAddress'];
		$contact->noteText				= $_POST['noteText'];

		if (((!$contact->archiveDate) || ($contact->archiveDate == '0000-00-00')) && ($_POST['archiveInd'] == "1")){
			$contact->archiveDate = date( 'Y-m-d' );
		}else if ($_POST['archiveInd'] == "0"){
			$contact->archiveDate = '';
		}

		try {
			$contact->save();

			if (!$contactID){
				$contactID=$contact->primaryKey;
			}

			//first remove all orgs, then we'll add them back
			$contact->removeContactRoles();

			foreach (explode(',', $_POST['contactRoles']) as $id){
				if ($id){
					$contactRoleProfile = new ContactRoleProfile();
					$contactRoleProfile->contactID = $contactID;
					$contactRoleProfile->contactRoleID = $id;
					$contactRoleProfile->save();
				}
			}


		} catch (Exception $e) {
			echo $e->getMessage();
		}

        break;





    case 'submitExternalLogin':
		//if this is an existing contact
		$externalLoginID=$_POST['externalLoginID'];

		if ($externalLoginID){
			$externalLogin = new ExternalLogin(new NamedArguments(array('primaryKey' => $externalLoginID)));
		}else{
			//set up new external login
			$externalLogin = new ExternalLogin();
		}

		$externalLogin->updateDate				= date( 'Y-m-d H:i:s' );
		$externalLogin->externalLoginTypeID 	= $_POST['externalLoginTypeID'];
		$externalLogin->organizationID 			= $_POST['organizationID'];
		$externalLogin->loginURL				= $_POST['loginURL'];
		$externalLogin->username				= $_POST['username'];
		$externalLogin->emailAddress			= $_POST['emailAddress'];
		$externalLogin->password				= $_POST['password'];
		$externalLogin->noteText				= $_POST['noteText'];

		try {
			$externalLogin->save();
		} catch (Exception $e) {
			echo $e->getMessage();
		}

        break;


    case 'submitIssueLog':
		//if this is an existing issue
		$issueLogID=$_POST['issueLogID'];

		if ($issueLogID){
			$issueLog = new IssueLog(new NamedArguments(array('primaryKey' => $issueLogID)));
		}else{
			//set up new external login
			$issueLog = new IssueLog();
		}

		if ($_POST['issueDate']){
			$issueLog->issueDate = date("Y-m-d", strtotime($_POST['issueDate']));
		}else{
			$issueLog->issueDate = '';
		}

		$issueLog->organizationID 		= $_POST['organizationID'];
		$issueLog->updateLoginID 		= $loginID;
		$issueLog->updateDate			= date( 'Y-m-d H:i:s' );
		$issueLog->noteText				= $_POST['noteText'];

		try {
			$issueLog->save();
		} catch (Exception $e) {
			echo $e->getMessage();
		}

        break;


	case 'deleteInstance':

 		$className = $_GET['class'];
 		$deleteID = $_GET['id'];

		//since we're using MyISAM which doesn't support FKs, must verify that there are no records of children or they could disappear
		$instance = new $className(new NamedArguments(array('primaryKey' => $deleteID)));
		$numberOfChildren = $instance->getNumberOfChildren();

		echo "<font color='red'>";

		if ($numberOfChildren > 0){
			//print out a friendly message...
			echo "Unable to delete  - this " . strtolower(ereg_replace("[A-Z]", " \\0" , lcfirst($className))) . " is in use.  Please make sure no organizations are set up with this information.";
		}else{
			try {
				$instance->delete();
			} catch (Exception $e) {
				//print out a friendly message...
				echo "Unable to delete.  Please make sure no organizations are set up with this information.";
			}
		}
		echo "</font>";

		break;

	case 'deleteOrganization':
		$organizationID = $_GET['organizationID'];
		$organization = new Organization(new NamedArguments(array('primaryKey' => $organizationID)));

		try {
			$organization->removeOrganization();
			echo "Organization successfully deleted.";
		} catch (Exception $e) {
			echo $e->getMessage();
		}

		break;


     case 'updateData':
 		$className = $_GET['className'];
 		$updateID = $_GET['updateId'];
 		$shortName = $_GET['shortName'];

		$instance = new $className(new NamedArguments(array('primaryKey' => $updateID)));
		$instance->shortName = $shortName;

		try {
			$instance->save();
		} catch (Exception $e) {
			echo $e->getMessage();
		}

 		break;


     case 'submitUserData':

 		$orgloginID = $_GET['orgloginID'];

		if ($orgloginID){
			$user = new User(new NamedArguments(array('primaryKey' => $orgloginID)));
		}else{
			$user = new User();
			$user->loginID=$_GET['loginID'];
		}


		$user->firstName=$_GET['firstName'];
		$user->lastName=$_GET['lastName'];
		$user->privilegeID=$_GET['privilegeID'];


		try {
			$user->save();
			echo "User successfully saved.";
		} catch (Exception $e) {
			echo $e->getMessage();
		}

 		break;


     case 'addData':

 		$className = $_GET['className'];
 		$shortName = $_GET['shortName'];

		$instance = new $className();
		$instance->shortName = $shortName;

		try {
			$instance->save();
		} catch (Exception $e) {
			echo $e->getMessage();
		}

 		break;



    case 'getOrganizationList':

		if (isset($_GET['searchMode'])) $searchMode = $_GET['searchMode']; else $searchMode='';
		if (isset($_GET['limit'])) $v = $_GET['limit']; else $limit='';

		$q = $_GET['q'];
		$q = str_replace(" ", "+",$q);
		$q = str_replace("&", "%",$q);

		$organization = new Organization();
		$orgArray = $organization->autocompleteSearch($q);

		echo implode("\n", $orgArray);

		break;




	case 'getExistingOrganizationName':
		$name = $_GET['name'];
		if (isset($organizationID)) $organizationID = $_GET['organizationID']; else $organizationID = '';


		$organization = new Organization();
		$orgArray = array();

		$exists = 0;

		foreach ($organization->allAsArray() as $orgArray) {
			if ((strtoupper($orgArray['name']) == strtoupper($name)) && ($orgArray['organizationID'] != $organizationID)) {
				$exists = $orgArray['organizationID']; break;
			}
		}

		echo $exists;

		break;



	default:
       echo "Action " . $action . " not set up!";
       break;


}

?>
