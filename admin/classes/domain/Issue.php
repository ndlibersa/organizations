<?php

class Issue extends DatabaseObject {

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

	public function getContacts() {
		$query = "SELECT ic.contactID,c.name,c.emailAddress
				FROM `{$this->dbName}`.IssueContact ic
				LEFT JOIN `{$this->db->config->database->name}`.Contact c ON c.contactID=ic.contactID 
				WHERE ic.issueID=".$this->issueID;
		$result = $this->db->processQuery($query, 'assoc');
		$objects = array();

		if (isset($result['contactID'])){
			return array($result);
		} else {
			return $result;
		}
	}

	public function getAssociatedOrganization() {
		$query = "SELECT o.organizationID 
				  FROM `{$this->dbName}`.IssueRelationship ir
				  LEFT JOIN Organization o ON o.organizationID=ir.entityID
				  WHERE ir.issueID={$this->issueID}";
		$result = $this->db->processQuery($query, 'assoc');
		$objects = array();

		if (isset($result['organizationID'])){
			$object = new Organization(new NamedArguments(array('primaryKey' => $result['organizationID'])));
			array_push($objects, $object);
		}
		return $objects;
	}

	public function getAssociatedResources() {
		$query = "SELECT r.resourceID 
				  FROM `{$this->dbName}`.IssueRelationship ir
				  LEFT JOIN `{$this->dbName}`.Resource r ON (r.resourceID=ir.entityID AND ir.entityTypeID=2)
				  WHERE ir.issueID={$this->issueID}";
		$result = $this->db->processQuery($query, 'assoc');
		$objects = array();

		//need to do this since it could be that there's only one request and this is how the dbservice returns result
		if (isset($result['resourceID'])){
			$object = new Resource(new NamedArguments(array('primaryKey' => $result['resourceID'])));
			array_push($objects, $object);
		} else{
			foreach ($result as $row) {
				$object = new Resource(new NamedArguments(array('primaryKey' => $row['resourceID'])));
				array_push($objects, $object);
			}
		}
		return $objects;
	}
}

?>