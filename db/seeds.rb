#TODO: add new env for production to allow QA resets.
Rake.application['generate:authorizations:seed'].invoke
Rake.application['generate:locations:seed'].invoke
Rake.application['generate:schools:seed'].invoke
Rake.application['generate:ministries:seed'].invoke
Rake.application['generate:users:super'].invoke
Rake.application['generate:events:seed'].invoke
