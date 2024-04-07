local rootDirectory = "exbaltop"

local function printWithBorder(text)
    local border = string.rep("-", #text + 5)  
    print(border)
    print("| " .. text .. " |")
    print(border)
end

local function AddFile(File, directory)
    local prefix = string.lower(string.Left(File, 3))

    if SERVER and prefix == "sv_" then
        include(directory .. File)
        printWithBorder("[exBaltop] SERVER INCLUDE: " .. File)
    elseif prefix == "sh_" then
        if SERVER then
            AddCSLuaFile(directory .. File)
            printWithBorder("[exBaltop] SHARED ADDCS: " .. File)
        end
        include(directory .. File)
        printWithBorder("[exBaltop] SHARED INCLUDE: " .. File)
    elseif prefix == "cl_" then
        if SERVER then
            AddCSLuaFile(directory .. File)
            printWithBorder("[exBaltop] CLIENT ADDCS: " .. File)
        elseif CLIENT then
            include(directory .. File)
            printWithBorder("[exBaltop] CLIENT INCLUDE: " .. File)
        end
    end
end

local function IncludeDir(directory, isFirstPass)
    directory = directory .. "/"

    local files, directories = file.Find(directory .. "*", "LUA")

   
    if SERVER and isFirstPass then
        local configFile = directory .. "sv_config.lua"
        if file.Exists(configFile, "LUA") then
            include(configFile)
            printWithBorder("[exBaltop] CONFIG INCLUDED FIRST: sv_config.lua")
        end
    end

    for _, v in ipairs(files) do
        if string.EndsWith(v, ".lua") and v ~= "sv_config.lua" then 
            AddFile(v, directory)
        end
    end

    for _, v in ipairs(directories) do
        printWithBorder("[exBaltop] Directory: " .. v)
        IncludeDir(directory .. v, false)
    end
end


IncludeDir(rootDirectory, true)
