component extends="org.corfield.framework" {
	this.name = "FW/1 REST Example";

	this.mappings["/app"] = expandPath("../app");

	variables.framework = {
		base = "/app/",
		reloadApplicationOnEveryRequest = true,
		trace = true
	};

	public void function setupApplication () {
		var beanProperties = {
			databasePath = expandPath("../db/database.json"),
			seedPath = expandPath("/app/seed.json")
		};

		var beanFactory = new org.corfield.ioc("/app/model", { constants = beanProperties });
		setBeanFactory(beanFactory);
	}

	public void function setupRequest () {
		if (structKeyExists(url, "reload")) {
			setupApplication();
		}
	}

}