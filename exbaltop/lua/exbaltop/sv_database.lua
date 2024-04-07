-- exBaltop - A DarkRP addon for Garry's Mod
-- Copyright (c) 2024 exliipso
-- This work is licensed under CC BY-NC 4.0 http://creativecommons.org/licenses/by-nc/4.0/

exBaltopConfig = exBaltopConfig or include("exbaltop/sv_config.lua")

local db
local MYSQL, SQLITE = 1, 2
local dbType

if exBaltopConfig.UseMySQL then
    dbType = MYSQL
    require("mysqloo")
    db = mysqloo.connect(
        exBaltopConfig.MySQL.Hostname,
        exBaltopConfig.MySQL.Username,
        exBaltopConfig.MySQL.Password,
        exBaltopConfig.MySQL.Database,
        exBaltopConfig.MySQL.Port
    )
else
    dbType = SQLITE
end

local function initDatabase()
    if dbType == MYSQL then
        function db:onConnected()
            print("Connected to MySQL for exBaltop")
           
            db:query("CREATE TABLE IF NOT EXISTS darkrp_player (uid BIGINT UNSIGNED PRIMARY KEY, rpname VARCHAR(255), wallet BIGINT)"):start()
        end

        function db:onConnectionFailed(err)
            print("exBaltop - MySQL connection failed: " .. err)
        end

        db:connect()
    else
        
        sql.Query("CREATE TABLE IF NOT EXISTS darkrp_player (uid INTEGER PRIMARY KEY, rpname TEXT, wallet INTEGER)")
        print("Using SQLite for exBaltop")
    end
end


local function executeQuery(query, onSuccess, onError)
    if dbType == MYSQL then
        local q = db:query(query)
        function q:onSuccess(data)
            if onSuccess then onSuccess(data) end
        end
        function q:onError(err)
            if db:status() == mysqloo.DATABASE_NOT_CONNECTED then
                db:connect()
                db:wait()
                self:start()
            else
                if onError then onError(err) end
            end
        end
        q:start()
    else
        local result = sql.Query(query)
        if result == false then
            if onError then onError(sql.LastError()) end
        else
            if onSuccess then onSuccess(result) end
        end
    end
end


function getTopPlayerBalances(callback)
    local query = string.format("SELECT rpname, wallet FROM darkrp_player ORDER BY wallet DESC LIMIT %d", exBaltopConfig.DisplayCount)
    executeQuery(query, function(data)
        if callback then callback(data) end
    end, function(err)
        print("Error fetching top balances: " .. err)
    end)
end

initDatabase()
