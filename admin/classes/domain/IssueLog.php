<?php

/*
**************************************************************************************************************************
** CORAL Organizations Module
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

class IssueLog extends DatabaseObject {

	protected function defineRelationships() {}

	protected function overridePrimaryKeyName() {}

  public function getTypeShortName() {
     $query = "SELECT shortName 
            FROM IssueLogType
            WHERE issueLogTypeID = '" . $this->issueLogTypeID . "'";
    $result = $this->db->processQuery($query, 'assoc');
    return $result['shortName'];
 
  }

  public function allExpandedAsArray($organizationID) {

    $query = "SELECT IssueLog.*, Organization.name, IssueLogType.shortName from IssueLog
          LEFT JOIN IssueLogType ON IssueLogType.issueLogTypeID = IssueLog.issueLogTypeID
          LEFT JOIN Organization ON Organization.organizationID = IssueLog.organizationID";

    if ($organizationID) {
      $query .= " WHERE Organization.OrganizationID = " . $this->db->escapeString($organizationID);
    }
    $result = $this->db->processQuery($query, 'assoc');
    $results = array();
    if (isset($result['issueLogID'])) {
      array_push($results, $result);
    } else {
      foreach ($result as $row) {
        array_push($results, $row);
      }
    }
    return $results;

  }


}

?>
