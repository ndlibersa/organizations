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


session_start();

include_once 'directory.php';

//print header
$pageTitle='Home';
include 'templates/header.php';

//used for creating a "sticky form" for back buttons
//except we don't want it to retain if they press the 'index' button
//check what referring script is

if ($_SESSION['ref_script'] != "orgDetail.php"){
	$reset='Y';
}

$_SESSION['ref_script']=$currentPage;

?>

<div style='text-align:left;'>
<table class="headerTable" style="background-image:url('images/header.gif');background-repeat:no-repeat;">
<tr style='vertical-align:top;'>
<td style="width:155px;padding-right:10px;">
	<table class='noBorder'>
	<tr><td style='text-align:left;width:75px;' align='left'>
	<span style='font-size:130%;font-weight:bold;'>Search</span><br />
	<a href='javascript:void(0)' class='newSearch'>new search</a>
	</td>
	<td><div id='div_feedback'>&nbsp;</div>
	</td></tr>
	</table>

	<table class='borderedFormTable' style="width:150px">

	<tr>
	<td class='searchRow'><label for='searchName'><b>Name (contains)</b></label>
	<br />
	<input type='text' name='searchOrganizationName' id='searchOrganizationName' style='width:145px' value="<?php if ($reset != 'Y') echo $_SESSION['org_organizationName']; ?>" /><br />
	<div id='div_searchName' style='<?php if ((!$_SESSION['org_organizationName']) || ($reset == 'Y')) echo "display:none;"; ?>margin-left:123px;'><input type='button' name='btn_searchOrganizationName' value='go!' class='searchButton' /></div>
	</td>
	</tr>


	<tr>
	<td class='searchRow'><label for='searchOrganizationRoleID'><b>Role</b></label>
	<br />
	<select name='searchOrganizationRoleID' id='searchOrganizationRoleID' style='width:150px' onchange='javsacript:updateSearch();'>
	<option value=''>All</option>
	<?php

		$display = array();
		$organizationRole = new OrganizationRole();

		foreach($organizationRole->allAsArray() as $display) {
			if (($_SESSION['org_organizationRoleID'] == $display['organizationRoleID']) && ($reset != 'Y')){
				echo "<option value='" . $display['organizationRoleID'] . "' selected>" . $display['shortName'] . "</option>";
			}else{
				echo "<option value='" . $display['organizationRoleID'] . "'>" . $display['shortName'] . "</option>";
			}
			if ($letter == "N") echo "<br />";
		}

	?>
	</select>
	</td>
	</tr>


	<tr>
	<td class='searchRow'><label for='searchContact'><b>Contact Name (contains)</b></label>
	<br />
	<input type='text' name='searchContactName' id='searchContactName' style='width:145px' value="<?php if ($reset != 'Y') echo $_SESSION['org_contactName']; ?>" /><br />
	<div id='div_searchContact' style='<?php if ((!$_SESSION['org_contactName']) || ($reset == 'Y')) echo "display:none;"; ?>margin-left:123px;'><input type='button' name='btn_searchContactName' value='go!' class='searchButton' /></div>
	</td>
	</tr>


	<tr>
	<td class='searchRow'><label for='searchFirstLetter'><b>Starts with</b></label>
	<br />
	<?php
	$organization = new Organization();

	$alphArray = range('A','Z');
	$orgAlphArray = $organization->getAlphabeticalList;

	foreach ($alphArray as $letter){
		if ((isset($orgAlphArray[$letter])) && ($orgAlphArray[$letter] > 0)){
			echo "<span class='searchLetter' id='span_letter_" . $letter . "'><a href='javascript:setStartWith(\"" . $letter . "\")'>" . $letter . "</a></span>";
			if ($letter == "N") echo "<br />";
		}else{
			echo "<span class='searchLetter'>" . $letter . "</span>";
		}
	}


	?>
	<br />
	</td>
	</tr>

	</table>
	&nbsp;<a href='javascript:void(0)' class='newSearch'>new search</a>
	</div>
</td>
<td>
<div id='div_searchResults'></div>
</td></tr>
</table>
</div>
<br />
<script type="text/javascript" src="js/index.js"></script>
<script type='text/javascript'>
<?php
  //used to default to previously selected values when back button is pressed
  //if the startWith is defined set it so that it will default to the first letter picked
  if (($_SESSION['org_startWith']) && ($reset != 'Y')){
	  echo "startWith = '" . $_SESSION['org_startWith'] . "';";
	  echo "$(\"#span_letter_" . $_SESSION['org_startWith'] . "\").removeClass('searchLetter').addClass('searchLetterSelected');";
  }

  if (($_SESSION['org_pageStart']) && ($reset != 'Y')){
	  echo "pageStart = '" . $_SESSION['org_pageStart'] . "';";
  }

  if (($_SESSION['org_numberOfRecords']) && ($reset != 'Y')){
	  echo "numberOfRecords = '" . $_SESSION['org_numberOfRecords'] . "';";
  }

  if (($_SESSION['org_orderBy']) && ($reset != 'Y')){
	  echo "orderBy = \"" . $_SESSION['org_orderBy'] . "\";";
  }

  echo "</script>";

  //print footer
  include 'templates/footer.php';
?>