# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Phase.destroy_all
System.destroy_all
Team.destroy_all
SystemTeamPhase.destroy_all

analysis = Phase.create(name: 'Analysis')
design = Phase.create(name: 'Design'  )
development = Phase.create(name: 'Development')
sit = Phase.create(name: 'SIT/HS'  )
qa = Phase.create(name: 'QA'  )
deployment = Phase.create(name: 'Deployment')
pv = Phase.create(name: 'Production Verification'  )
uat = Phase.create(name: 'UAT'  )
rfs = Phase.create(name: 'RFS')

# CREATE SYSTEMS
telecop = System.create(name: "TELECOP")
subex = System.create(name: "SUBEX")
edh = System.create(name: "EDH")
mediation = System.create(name: "MEDIATION")
sibel = System.create(name: "SIEBEL")
billing = System.create(name: "BILLING")

# CREATE TEAMS
rafmsdev = Team.create(name: 'RAFMS-Dev')
rafmsqa = Team.create(name: 'RAFMS-QA')
rafmsop = Team.create(name: 'RAFMS-OP')
edhdev = Team.create(name: 'EDH-Dev')
edhqa = Team.create(name: 'EDH-QA')
edhop = Team.create(name: 'EDH-OP')
meddev = Team.create(name: 'Mediation-Dev')
medqa = Team.create(name: 'Mediation-QA')
medop = Team.create(name: 'Mediation-OP')
sbldev = Team.create(name: 'Siebel-Dev')
sblqa = Team.create(name: 'Siebel-QA')
sblop = Team.create(name: 'Siebel-OP')
brmdev = Team.create(name: 'Billing-Dev')
brmqa = Team.create(name: 'Billing-QA')
brmop = Team.create(name: 'Billing-OP')

rafmsdev.system_team_phases.create(system: telecop, phase: development)
rafmsdev.system_team_phases.create(system: subex, phase: development)
rafmsqa.system_team_phases.create(system: telecop, phase: qa)
rafmsqa.system_team_phases.create(system: subex, phase: qa)
rafmsop.system_team_phases.create(system: telecop, phase: deployment)
rafmsop.system_team_phases.create(system: subex, phase: deployment)

edhdev.system_team_phases.create(system: edh, phase: development)
edhqa.system_team_phases.create(system: edh, phase: qa)
edhop.system_team_phases.create(system: edh, phase: deployment)
# rafmsqa.system_team_phases.create(system: , phase: )
# rafmsqa.system_team_phases.create(system: , phase: )
# rafmsqa.system_team_phases.create(system: , phase: )
# rafmsqa.system_team_phases.create(system: , phase: )

# rafmsdev.systems <<telecop
# rafmsdev.systems << subex
# rafmsqa.systems <<telecop
# rafmsqa.systems << subex
# rafmsop.systems <<telecop
# rafmsop.systems << subex

# edhdev.systems << edh
# edhqa.systems << edh
# edhop.systems << edh

# meddev.systems << mediation
# meddev.systems << mediation
# meddev.systems << mediation
