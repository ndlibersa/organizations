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

class Downtime extends DatabaseObject {

	protected function defineRelationships() {}

	protected function overridePrimaryKeyName() {}

	protected function init(NamedArguments $arguments) {
		//get an instance of config since we don't have a db handle, yet
		$config = new Configuration();
		//if we're using the resources module, use that database
		if ($config->settings->resourcesModule == 'Y' && $config->settings->resourcesDatabaseName) {
			$arguments->dbName = $config->settings->resourcesDatabaseName;
		}
		parent::init($arguments);
	}

	public function load() {

		//This is a custom load method that joins the downtime type name into the attributes

		//if exists in the database
		if (isset($this->primaryKey)) {	
			$query = "SELECT d.*, dt.shortName, i.subjectText
				  FROM `{$this->dbName}`.Downtime d
				  LEFT JOIN `{$this->dbName}`.DowntimeType dt ON dt.downtimeTypeID=d.downtimeTypeID
				  LEFT JOIN `{$this->dbName}`.Issue i ON i.issueID=d.issueID
				  WHERE d.downtimeID={$this->primaryKey}";
			
			$result = $this->db->processQuery($query, 'assoc');

			foreach (array_keys($result) as $attributeName) {
				$this->addAttribute($attributeName);
				$this->attributes[$attributeName] = $result[$attributeName];
			}

		}else{

			//This else block currently will not be used

			// Figure out attributes from existing database
			$query = "SELECT COLUMN_NAME FROM information_schema.`COLUMNS` WHERE table_schema = '";
			$query .= $this->db->config->database->name . "' AND table_name = '$this->tableName'";// MySQL-specific
			foreach ($this->db->processQuery($query) as $result) {
				$attributeName = $result[0];
				$this->addAttribute($attributeName);
			}
		}
	}

	public function getDowntimeTypesArray() {
		$query = "SELECT dt.*
				  FROM `{$this->dbName}`.DowntimeType dt";

		$result = $this->db->processQuery($query, "assoc");
		$names = array();

		foreach ($result as $name) {
			array_push($names, $name);
		}

		return $names;
	}

}

?>