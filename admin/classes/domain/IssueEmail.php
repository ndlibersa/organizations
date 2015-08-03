<?php

class IssueEmail extends DatabaseObject {
	protected function init(NamedArguments $arguments) {
		//get an instance of config since we don't have a db handle, yet
		$config = new Configuration();
		//if we're using the resources module, use that database
		if ($config->settings->resourcesModule == 'Y' && $config->settings->resourcesDatabaseName) {
			$arguments->dbName = $config->settings->resourcesDatabaseName;
		}
		parent::init($arguments);
	}

	protected function defineRelationships() {}

	protected function overridePrimaryKeyName() {}

}

?>