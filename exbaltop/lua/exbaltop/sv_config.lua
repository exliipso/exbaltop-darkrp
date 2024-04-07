-- exBaltop - A DarkRP addon for Garry's Mod
-- Copyright (c) 2024 exliipso
-- This work is licensed under CC BY-NC 4.0 http://creativecommons.org/licenses/by-nc/4.0/
exBaltopConfig = {
    UseMySQL = false,  -- Toggle this to true to use MySQL.
    MySQL = {
        Hostname = "your_mysql_host",
        Username = "your_username",
        Password = "your_password",
        Database = "your_database",
        Port = 3306
    },
    
    DisplayCount = 3,  
    Colors = {
        Header = Color(252, 0, 88),  -- Color for the "Top N" header.
        Rank = Color(255, 255, 255),  -- Color for the rank numbers.
        Name = Color(255, 0, 225),  -- Color for player names.
        Money = Color(0, 247, 49),  -- Color for money values.
        Border = Color(143, 52, 235)  -- Color for the border.
    },
    BorderEnabled = true,  -- Enable or disable the border around the chat messages.
    BorderCharacter = "*",  -- Character used to create the border.
    BorderLength = 30  -- Length of the border, adjust as needed.
}
