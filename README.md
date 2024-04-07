# exbaltop-darkrp
Baltop command for DarkRP

# exBaltop for DarkRP

`exBaltop` is an engaging and visually appealing addition to any Garry's Mod DarkRP server. This addon introduces a `/baltop` command that players can use to display a list of the top wealthiest players in the server, encouraging a competitive and interactive economic environment. With customizable aesthetics and dynamic content formatting, `exBaltop` brings a new level of immersion and polish to server leaderboards.

## Features

- **Wealth Leaderboard**: Showcases the top wealthiest players in your server, fostering a competitive economy.
- **Customizable Display**: Configurable number of top players to show, along with customizable colors for text and borders.
- **Aesthetic Borders**: Adds an optional aesthetic border around the leaderboard display, enhancing visual appeal in the chat.
- **Formatted Currency**: Beautifies the display of large numbers with comma separators, making wealth amounts easier to read.
- **Flexible Database Support**: Seamlessly supports both SQLite and MySQL, allowing for flexible server configuration.
- **Performance Optimized**: Designed with server performance in mind, ensuring minimal impact even on busy servers.

## Configuration

`exBaltop` comes with a comprehensive set of configurations, easily adjustable in `sv_config.lua`. Settings include:

- Database selection (SQLite or MySQL)
- Number of top players to display
- Custom colors for the header, ranks, player names, and money amounts
- Border customization options, including enabling/disabling the border, border character, and border length

Example configuration snippet:

```lua
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

```

## Installation

1. **Download the Addon**: Clone this repository or download the ZIP.
2. **Server Setup**: Extract the `exbaltop` folder into your server's `garrysmod/addons` directory.
3. **Configuration**: Adjust settings in `exbaltop/lua/exbaltop/sv_config.lua` as needed.
4. **Restart the Server**: Ensure changes take effect by restarting your server.

## Usage

Once installed, players can use the `/baltop` command in chat to view the leaderboard. Server administrators can adjust the display and functionality through the provided configuration file.

