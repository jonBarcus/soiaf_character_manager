Region.delete_all
House.delete_all
User.delete_all

the_north = Region.create({name: "The North"})
the_vale = Region.create({name: "The Vale of Arryn"})
the_riverlands = Region.create({name: "The Riverlands"})
the_westerlands = Region.create({name: "The Westerlands"})
the_crownlands = Region.create({name: "The Crownlands"})
the_reach = Region.create({name: "The Reach"})
the_stormlands = Region.create({name: "The Stormlands"})
dorne = Region.create({name: "Dorne"})
the_seven_kingdoms = Region.create({name: "The Seven Kingdoms"})

admin_user = User.create({email: "test@test.com", username: "admin",
                          name: "admin user", password: "admin",
                          password_confirmation: "admin", is_admin: true})

normal_user = User.create({email: "normal@normal.com", username: "normal",
                        name: "normal user", password: "normal",
                        password_confirmation: "normal", is_admin: false})
