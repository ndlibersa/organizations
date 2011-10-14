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

    case 'getOrganizationForm':
    	if (isset($_GET['organizationID'])) $organizationID = $_GET['organizationID']; else $organizationID = '';
    	$organization = new Organization(new NamedArguments(array('primaryKey' => $organizationID)));

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


		//get organization roles
		$sanitizedInstance = array();
		$instance = new OrganizationRole();
		$organizationRoleProfileArray = array();
		foreach ($organization->getOrganizationRoles() as $instance) {
			$organizationRoleProfileArray[] = $instance->organizationRoleID;
		}


		//get all org roles for output in drop down
		$organizationRoleArray = array();
		$organizationRoleObj = new OrganizationRole();
		$organizationRoleArray = $organizationRoleObj->allAsArray();

		?>
		<div id='div_organizationForm'>
		<form id='organizationForm'>
		<input type='hidden' name='editOrganizationID' id='editOrganizationID' value='<?php echo $organizationID; ?>'>

		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:340px;">
		<tr>
		<td colspan='2'><span class='headerText'><?php if ($organizationID != "") { echo "Update Organization"; }else{ echo "Add New Organization"; } ?></span>
		<br /></td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='organizationName'><b>Name:</b></label></td>
		<td><input type='text' id='organizationName' name='organizationName' value = "<?php echo htmlentities($organization->name); ?>" style='width:220px;' /><span id='span_errors' style='color:red'></span></td>
		</tr>

		<?php if (count($parentOrganizationArray) > 0){ ?>
			<tr>
			<td style='vertical-align:top;text-align:right;'><label for='parentOrganization'><b>Parent:</b></label></td>
			<td>
			<?php
			foreach ($parentOrganizationArray as $parentOrganization){
				echo "<input type='text' id='parentOrganization' name='parentOrganization'  value = \"" . $parentOrganization['name'] . "\" style='width:220px;' />";
				echo "<input type='hidden' id='parentOrganizationID' name='parentOrganizationID' value=\"" . $parentOrganization['organizationID'] . "\">";
			}
			?>
			</td>
			</tr>
		<?php
		}else{
		?>
			<tr>
			<td style='vertical-align:top;text-align:right;'><label for='parentOrganization'><b>Parent:</b></label></td>
			<td>
			<input type='text' id='parentOrganization' name='parentOrganization' value = '' style='width:220px;' />
			<input type='hidden' id='parentOrganizationID' name='parentOrganizationID' value=''>
			</td>
			</tr>
		<?php } ?>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='companyURL'><b>Company URL:</b></label></td>
		<td><input type='text' id='companyURL' name='companyURL' value = '<?php if (!$organizationID) { echo "http://"; } else { echo $organization->companyURL; } ?>' style='width:220px' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='orgRoles'><b>Role(s):</b></label></td>
		<td>

			<table>
			<?php
			$i=0;
			if (count($organizationRoleArray) > 0){
				foreach ($organizationRoleArray as $organizationRoleIns){
					$i++;
					if(($i % 2)==1){
						echo "<tr>\n";
					}
					if (in_array($organizationRoleIns['organizationRoleID'],$organizationRoleProfileArray)){
						echo "<td><input class='check_roles' type='checkbox' name='" . $organizationRoleIns['organizationRoleID'] . "' id='" . $organizationRoleIns['organizationRoleID'] . "' value='" . $organizationRoleIns['organizationRoleID'] . "' checked />   " . $organizationRoleIns['shortName'] . "</td>\n";
					}else{
						echo "<td><input class='check_roles' type='checkbox' name='" . $organizationRoleIns['organizationRoleID'] . "' id='" . $organizationRoleIns['organizationRoleID'] . "' value='" . $organizationRoleIns['organizationRoleID'] . "' />   " . $organizationRoleIns['shortName'] . "</td>\n";
					}
					if(($i % 2)==0){
						echo "</tr>\n";
					}
				}

				if(($i % 2)==1){
					echo "<td>&nbsp;</td></tr>\n";
				}
			}
			?>
			</table>
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='accountDetailText'><b>Account Details:</b></label></td>
		<td><textarea rows='3' id='accountDetailText' name='accountDetailText' style='width:220px'><?php echo $organization->accountDetailText; ?></textarea></td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='noteText'><b>Notes:</b></label></td>
		<td><textarea rows='3' id='noteText' name='noteText' style='width:220px'><?php echo $organization->noteText; ?></textarea></td>
		</tr>


		<tr style="vertical-align:middle;">
		<td style="padding-top:8px;text-align:right;">&nbsp;</td>
		<td style="padding-top:8px;padding-right:8px;text-align:left;">
			<table class='noBorderTable' style='width:100%;'>
				<tr>
					<td style='text-align:left'><input type='button' value='submit' name='submitOrganizationChanges' id ='submitOrganizationChanges'></td>
					<td style='text-align:right'><input type='button' value='cancel' onclick="tb_remove()"></td>
				</tr>
			</table>
		</td>
		</tr>

		</table>

		</form>
		</div>

		<script type="text/javascript" src="js/forms/organizationSubmitForm.js?random=<?php echo rand(); ?>"></script>

		<?php

        break;




    case 'getAliasForm':
    	$organizationID = $_GET['organizationID'];
    	if (isset($_GET['aliasID'])) $aliasID = $_GET['aliasID']; else $aliasID = '';
    	$alias = new Alias(new NamedArguments(array('primaryKey' => $aliasID)));

		//get all alias types for output in drop down
		$aliasTypeArray = array();
		$aliasTypeObj = new AliasType();
		$aliasTypeArray = $aliasTypeObj->allAsArray();

		?>
		<div id='div_aliasForm'>
		<form id='aliasForm'>
		<input type='hidden' name='organizationID' id='organizationID' value='<?php echo $organizationID; ?>'>
		<input type='hidden' name='editOrganizationID' id='editOrganizationID' value='<?php echo $organizationID; ?>'>
		<input type='hidden' name='editAliasID' id='editAliasID' value='<?php echo $aliasID; ?>'>
		<input type='hidden' name='showTab' id='showTab' value='alias'>


		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:280px;">
		<tr>
		<td colspan='2'><span class='headerText'><?php if ($aliasID){ echo "Update Alias"; } else { echo "Add Alias"; } ?></span>
		<span id='span_errors' style='color:red;'></span><br />
		</td>
		</tr>

		<tr>
		<td><label for='aliasTypeID'><b>Alias Type</b></label></td>
		<td>
		<select name='aliasTypeID' id='aliasTypeID'>
		<?php
		foreach ($aliasTypeArray as $aliasType){
			if (!(trim(strval($aliasType['aliasTypeID'])) != trim(strval($alias->aliasTypeID)))){
				echo "<option value='" . $aliasType['aliasTypeID'] . "' selected>" . $aliasType['shortName'] . "</option>\n";
			}else{
				echo "<option value='" . $aliasType['aliasTypeID'] . "'>" . $aliasType['shortName'] . "</option>\n";
			}
		}
		?>
		</select>
		</td>
		</tr>

		<tr>
		<td><label for='aliasName'><b>Name</b></label></td>
		<td>
		<input type='text' id='aliasName' name='aliasName' value = "<?php echo $alias->name; ?>" style='width:195px' /><span id='span_error_aliasName'</span>
		</td>
		</tr>


		<tr style="vertical-align:middle;">
		<td style="padding-top:8px;text-align:right;">&nbsp;</td>
		<td style="padding-top:8px;padding-right:8px;text-align:left;">
			<table class='noBorderTable' style='width:100%;'>
				<tr>
					<td style='text-align:left'><input type='button' value='submit' name='submitAliasForm' id ='submitAliasForm'></td>
					<td style='text-align:right'><input type='button' value='cancel' onclick="tb_remove()"></td>
				</tr>
			</table>
		</td>
		</tr>


		</table>

		</form>
		</div>

		<script type="text/javascript" src="js/forms/aliasSubmitForm.js?random=<?php echo rand(); ?>"></script>

		<?php

        break;





    case 'getContactForm':
    	$organizationID = $_GET['organizationID'];
    	if (isset($_GET['contactID'])) $contactID = $_GET['contactID']; else $contactID = '';
    	$contact = new Contact(new NamedArguments(array('primaryKey' => $contactID)));

		if (($contact->archiveDate) && ($contact->archiveDate != '0000-00-00')){
			$invalidChecked = 'checked';
		}else{
			$invalidChecked = '';
		}

		//get contact roles
		$sanitizedInstance = array();
		$instance = new ContactRole();
		$contactRoleProfileArray = array();
		foreach ($contact->getContactRoles() as $instance) {
			$contactRoleProfileArray[] = $instance->contactRoleID;
		}

		//get all contact roles for output in drop down
		$contactRoleArray = array();
		$contactRoleObj = new ContactRole();
		$contactRoleArray = $contactRoleObj->allAsArray();

		?>
		<div id='div_contactForm'>
		<form id='contactForm'>
		<input type='hidden' name='editOrganizationID' id='editOrganizationID' value='<?php echo $organizationID; ?>'>
		<input type='hidden' name='editContactID' id='editContactID' value='<?php echo $contactID; ?>'>

		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:340px;">
		<tr>
		<td colspan='2'><span class='headerText'><?php if ($contactID){ echo "Update Contact"; } else { echo "Add Contact"; } ?></span>
		<span id='span_errors' style='color:red;'></span>
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='contactName'><b>Name:</b></label></td>
		<td>
		<input type='text' id='contactName' name='contactName' value = "<?php echo $contact->name; ?>" style='width:150px' /><span id='span_error_contactName' style='color:red'>
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='contactTitle'><b>Title:</b></label></td>
		<td>
		<input type='text' id='contactTitle' name='contactTitle' value = '<?php echo $contact->title; ?>' style='width:150px' />
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='phoneNumber'><b>Phone:</b></label></td>
		<td>
		<input type='text' id='phoneNumber' name='phoneNumber' value = '<?php echo $contact->phoneNumber; ?>' style='width:150px' />
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='altPhoneNumber'><b>Alt Phone:</b></label></td>
		<td>
		<input type='text' id='altPhoneNumber' name='altPhoneNumber' value = '<?php echo $contact->altPhoneNumber; ?>' style='width:150px' />
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='faxNumber'><b>Fax:</b></label></td>
		<td>
		<input type='text' id='faxNumber' name='faxNumber' value = '<?php echo $contact->faxNumber; ?>' style='width:150px' />
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='emailAddress'><b>Email:</b></label></td>
		<td>
		<input type='text' id='emailAddress' name='emailAddress' value = '<?php echo $contact->emailAddress; ?>' style='width:150px' />
		</td>
		</tr>

		<tr>
		<td style='text-align:right'><label for='invalidInd'><b>Archived:</b></label></td>
		<td>
		<input type='checkbox' id='invalidInd' name='invalidInd' <?php echo $invalidChecked; ?> />
		</td>
		</tr>


		<tr>
		<td style='vertical-align:top;text-align:right'><label for='addressText'><b>Address:</b></label></td>
		<td><textarea rows='3' id='addressText' name='addressText' style='width:150px;'><?php echo $contact->addressText; ?></textarea></td>
		</tr>



		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='orgRoles'><b>Role(s):</b></label></td>
		<td>

			<table>
			<?php
			$i=0;
			if (count($contactRoleArray) > 0){
				foreach ($contactRoleArray as $contactRoleIns){
					$i++;
					if(($i % 3)==1){
						echo "<tr>\n";
					}
					if (in_array($contactRoleIns['contactRoleID'],$contactRoleProfileArray)){
						echo "<td style='vertical-align:top;text-align:left;'><input class='check_roles' type='checkbox' name='" . $contactRoleIns['contactRoleID'] . "' id='" . $contactRoleIns['contactRoleID'] . "' value='" . $contactRoleIns['contactRoleID'] . "' checked />   <span class='smallText'>" . $contactRoleIns['shortName'] . "</span></td>\n";
					}else{
						echo "<td style='vertical-align:top;text-align:left;'><input class='check_roles' type='checkbox' name='" . $contactRoleIns['contactRoleID'] . "' id='" . $contactRoleIns['contactRoleID'] . "' value='" . $contactRoleIns['contactRoleID'] . "' />   <span class='smallText'>" . $contactRoleIns['shortName'] . "</span></td>\n";
					}
					if(($i % 3)==0){
						echo "</tr>\n";
					}
				}

				if(($i % 3)==1){
					echo "<td>&nbsp;</td><td>&nbsp;</td></tr>\n";
				}else if(($i % 3)==2){
					echo "<td>&nbsp;</td></tr>\n";
				}
			}
			?>
			</table>
			<span id='span_error_contactRole' class='redText'></span>

		</td>
		</tr>


		<tr>
		<td style='vertical-align:top;text-align:right'><label for='noteText'><b>Notes:</b></label></td>
		<td><textarea cols='36' rows='6' id='noteText' name='noteText' style='width:250px;'><?php echo $contact->noteText; ?></textarea></td>
		</tr>

		<tr style="vertical-align:middle;">
		<td style="padding-left:8px;padding-top:8px;">&nbsp;</td>
		<td style="padding-top:8px;padding-right:8px;">
			<table class='noBorderTable' style='width:100%;'>
				<tr>
					<td style='text-align:left'><input type='button' value='submit' name='submitContactForm' id ='submitContactForm'></td>
					<td style='text-align:right'><input type='button' value='cancel' onclick="tb_remove()"></td>
				</tr>
			</table>
		</td>
		</tr>

		</table>

		</form>
		</div>


		<script type="text/javascript" src="js/forms/contactSubmitForm.js?random=<?php echo rand(); ?>"></script>

		<?php

        break;






    case 'getAccountForm':
    	$organizationID = $_GET['organizationID'];
    	if (isset($_GET['externalLoginID'])) $externalLoginID = $_GET['externalLoginID']; else $externalLoginID = '';
    	$externalLogin = new ExternalLogin(new NamedArguments(array('primaryKey' => $externalLoginID)));


		//get all contact roles for output in drop down
		$externalLoginTypeArray = array();
		$externalLoginTypeObj = new ExternalLoginType();
		$externalLoginTypeArray = $externalLoginTypeObj->allAsArray();

		?>
		<div id='div_organizationForm'>
		<form id='organizationForm'>
		<input type='hidden' name='editOrganizationID' id='editOrganizationID' value='<?php echo $organizationID; ?>'>
		<input type='hidden' name='editExternalLoginID' id='editExternalLoginID' value='<?php echo $externalLoginID; ?>'>

		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:340px;">
		<tr>
		<td colspan='2'><span class='headerText'><?php if ($externalLoginID){ echo "Update Login"; } else { echo "Add Login"; } ?></span>
		<span id='span_errors' style='color:red;'></span><br />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='externalLoginTypeID'><b>Login Type:</b></label></td>
		<td>
		<select name='externalLoginTypeID' id='externalLoginTypeID'>
		<?php
		foreach ($externalLoginTypeArray as $externalLoginType){
			if ($externalLoginType['externalLoginTypeID'] == $externalLogin->externalLoginTypeID){
				echo "<option value='" . $externalLoginType['externalLoginTypeID'] . "' selected>" . $externalLoginType['shortName'] . "</option>\n";
			}else{
				echo "<option value='" . $externalLoginType['externalLoginTypeID'] . "'>" . $externalLoginType['shortName'] . "</option>\n";
			}
		}
		?>
		</select>
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='loginURL'><b>URL:</b></label></td>
		<td>
		<input type='text' id='loginURL' name='loginURL' value = '<?php echo $externalLogin->loginURL; ?>' style='width:200px' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='emailAddress'><b>Local Account Email:</b></label></td>
		<td>
		<input type='text' id='emailAddress' name='emailAddress' value = '<?php echo $externalLogin->emailAddress; ?>' style='width:200px' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='username'><b>Username:</b></label></td>
		<td>
		<input type='text' id='username' name='username' value = '<?php echo $externalLogin->username; ?>' style='width:200px' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='password'><b>Password:</b></label></td>
		<td>
		<input type='text' id='password' name='password' value = '<?php echo $externalLogin->password; ?>' style='width:200px' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='noteText'><b>Notes:</b></label></td>
		<td><textarea rows='3' id='noteText' name='noteText' style='width:200px'><?php echo $externalLogin->noteText; ?></textarea></td>
		</td>
		</tr>


		<tr style="vertical-align:middle;">
		<td style="padding-left:8px;padding-top:8px;">&nbsp;</td>
		<td style="padding-top:8px;padding-right:8px;">
			<table class='noBorderTable' style='width:100%;'>
				<tr>
					<td style='text-align:left'><input type='button' value='submit' name='submitExternalLoginForm' id ='submitExternalLoginForm'></td>
					<td style='text-align:right'><input type='button' value='cancel' onclick="tb_remove()"></td>
				</tr>
			</table>
		</td>
		</tr>

		</table>

		</form>
		</div>


		<script type="text/javascript" src="js/forms/externalLoginSubmitForm.js?random=<?php echo rand(); ?>"></script>

		<?php

        break;




    case 'getIssueLogForm':
    	$organizationID = $_GET['organizationID'];
    	if (isset($_GET['issueLogID'])) $issueLogID = $_GET['issueLogID']; else $issueLogID = '';
    	$issueLog = new IssueLog(new NamedArguments(array('primaryKey' => $issueLogID)));

		if (($issueLog->issueDate != '') && ($issueLog->issueDate != "0000-00-00")) {
			$issueDate=format_date($issueLog->issueDate);
		}else{
			$issueDate='';
		}

		?>
		<div id='div_issueForm'>
		<form id='issueForm'>
		<input type='hidden' name='editOrganizationID' id='editOrganizationID' value='<?php echo $organizationID; ?>'>
		<input type='hidden' name='editIssueLogID' id='editIssueLogID' value='<?php echo $issueLogID; ?>'>

		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:260px;">
		<tr>
		<td colspan='2'><span class='headerText'><?php if ($issueLogID){ echo "Update Issue"; } else { echo "Add Issue"; } ?></span>
		<span id='span_errors' style='color:red;'></span><br />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='issueDate'><b>Date:</b></label></td>
		<td>
		<input class='date-pick' id='issueDate' name='issueDate' style='width:80px' value='<?php echo $issueDate; ?>' />
		</td>
		</tr>

		<tr>
		<td style='vertical-align:top;text-align:right;'><label for='noteText'><b>Notes:</b></label></td>
		<td><textarea rows='3' id='noteText' name='noteText' style='width:200px'><?php echo $issueLog->noteText; ?></textarea></td>
		</td>
		</tr>

		<tr style="vertical-align:middle;">
		<td style="padding-left:8px;padding-top:8px;">&nbsp;</td>
		<td style="padding-top:8px;padding-right:8px;">
			<table class='noBorderTable' style='width:100%;'>
				<tr>
					<td style='text-align:left'><input type='button' value='submit' name='submitIssueLogForm' id ='submitIssueLogForm'></td>
					<td style='text-align:right'><input type='button' value='cancel' onclick="tb_remove()"></td>
				</tr>
			</table>
		</td>
		</tr>

		</table>

		</form>
		</div>

		<script type="text/javascript" src="js/forms/issueLogSubmitForm.js?random=<?php echo rand(); ?>"></script>

		<?php

        break;





	case 'getAdminDisplay':
		$className = $_GET['className'];


		$instanceArray = array();
		$obj = new $className();

		$instanceArray = $obj->allAsArray();



		if (count($instanceArray) > 0){
			?>
			<table class='dataTable' style='width:350px'>
				<?php

				foreach($instanceArray as $instance) {
					echo "<tr>";
					echo "<td>" . $instance['shortName'] . "</td>";
					echo "<td style='width:30px'><a href='ajax_forms.php?action=getAdminUpdateForm&className=" . $className . "&updateId=" . $instance[lcfirst($className) . 'ID'] . "&height=130&width=250&modal=true' class='thickbox' id='expression'>edit</a></td>";
					echo "<td style='width:50px'><a href='javascript:deleteData(\"" . $className . "\",\"" . $instance[lcfirst($className) . 'ID'] . "\")'>remove</a></td>";
					echo "</tr>";
				}

				?>
			</table>
			<?php

		}else{
			echo "(none found)";
		}

		break;




	case 'getAdminUpdateForm':
		$className = $_GET['className'];
		$updateId = $_GET['updateId'];

		$instance = new $className(new NamedArguments(array('primaryKey' => $updateId)));

		?>
		<div id='div_updateForm'>
		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:200px;">
		<tr>
		<td colspan='2'><br /><span class='headerText'>Update</span><br /></td>
		</tr>
		<tr>
		<td>
		<?php

		echo "<input type='text' id='updateVal' name='updateVal' value='" . $instance->shortName . "' style='width:190px;'/></td><td><a href='javascript:updateData(\"" . $className . "\", \"" . $updateId . "\");'>update</a>";

		?>


		</td>
		</tr>
		<tr>
		<td colspan='2'><p><a href='#' onclick='window.parent.tb_remove(); return false'>close</a></td>
		</tr>
		</table>
		</div>


		<script type="text/javascript">
		   //attach enter key event to new input and call add data when hit
		   $('#updateVal').keyup(function(e) {

				   if(e.keyCode == 13) {
					   updateData("<?php echo $className; ?>", "<?php echo $updateId; ?>");
				   }
        	});

        </script>


		<?php

		break;






	case 'getAdminUserForm':
		$instanceArray = array();
		$user = new User();
		$tempArray = array();

		foreach ($user->allAsArray() as $tempArray) {

			$privilege = new Privilege(new NamedArguments(array('primaryKey' => $tempArray['privilegeID'])));

			$tempArray['priv'] = $privilege->shortName;

			array_push($instanceArray, $tempArray);
		}



		if (count($instanceArray) > 0){
			?>
			<table class='dataTable' style='width:550px'>
				<tr>
				<th align='left'>Login ID</th>
				<th align='left'>First Name</th>
				<th align='left'>Last Name</th>
				<th align='left'>Privilege</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				</tr>
				<?php

				foreach($instanceArray as $instance) {
					echo "<tr>";
					echo "<td>" . $instance['loginID'] . "</td>";
					echo "<td>" . $instance['firstName'] . "</td>";
					echo "<td>" . $instance['lastName'] . "</td>";
					echo "<td>" . $instance['priv'] . "</td>";
					echo "<td style='width:30px'><a href='ajax_forms.php?action=getAdminUserUpdateForm&loginID=" . $instance['loginID'] . "&height=185&width=250&modal=true' class='thickbox' id='expression'>update</a></td>";
					echo "<td style='width:50px'><a href='javascript:deleteUser(\"" . $instance['loginID'] . "\")'>remove</a></td>";
					echo "</tr>";
				}

				?>
			</table>
			<?php

		}else{
			echo "(none found)";
		}

		break;



	case 'getAdminUserUpdateForm':
		if (isset($_GET['loginID'])) $loginID = $_GET['loginID']; else $loginID = '';

		if ($loginID){
			$update='Update';
		}else{
			$update='Add New';
		}
		$user = new User(new NamedArguments(array('primaryKey' => $loginID)));

		//get all roles for output in drop down
		$privilegeArray = array();
		$privilegeObj = new Privilege();
		$privilegeArray = $privilegeObj->allAsArray();



		?>
		<div id='div_updateForm'>
		<table class="thickboxTable" style="background-image:url('images/title.gif');background-repeat:no-repeat;width:240px;padding:2px;">
		<tr><td colspan='2'><span class='headerText'><?php echo $update; ?> User</span><br /><br /></td></tr>
		<tr><td><label for='loginID'><b>Login ID</b></label</td><td><?php if (!$loginID) { ?><input type='text' id='loginID' name='loginID' value='<?php echo $loginID; ?>' style='width:150px;'/> <?php } else { echo $loginID; } ?></td></tr>
		<tr><td><label for='firstName'><b>First Name</b></label</td><td><input type='text' id='firstName' name='firstName' value="<?php echo $user->firstName; ?>" style='width:150px;'/></td></tr>
		<tr><td><label for='lastName'><b>Last Name</b></label</td><td><input type='text' id='lastName' name='lastName' value="<?php echo $user->lastName; ?>" style='width:150px;'/></td></tr>
		<tr><td><label for='privilegeID'><b>Privilege</b></label</td>
		<td>
		<select name='privilegeID' id='privilegeID' style='width:155px'>
		<option value=''></option>
		<?php

		foreach ($privilegeArray as $privilege){
			if ($privilege['privilegeID'] == $user->privilegeID){
				echo "<option value='" . $privilege['privilegeID'] . "' selected>" . $privilege['shortName'] . "</option>\n";
			}else{
				echo "<option value='" . $privilege['privilegeID'] . "'>" . $privilege['shortName'] . "</option>\n";
			}
		}

		?>
		</select>
		</td>
		</tr>



		<tr>
		<td style="padding-top:18px;"><input type='button' value='<?php echo $update; ?>' onclick='javascript:window.parent.submitUserData("<?php echo $loginID; ?>");'></td>
		<td style="padding-top:18px;padding-right:8px;text-align:right;"><input type='button' value='cancel' onclick="window.parent.tb_remove(); return false"></td>
		</tr>
		</table>
		</div>


		<?php

		break;





	default:
       echo "Action " . $action . " not set up!";
       break;


}


?>


