local function formatMoney(amount)
    local k
    while true do  
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then break end
    end
    return amount
end

net.Receive("exBaltop_Display", function()
    local topBalances = net.ReadTable()
    local DisplayCount = net.ReadInt(32)
    local headerColor = net.ReadColor()
    local rankColor = net.ReadColor()
    local nameColor = net.ReadColor()
    local moneyColor = net.ReadColor() 
    local borderColor = net.ReadColor()  
    local borderEnabled = net.ReadBool()
    local borderChar = net.ReadString()
    local borderLength = net.ReadInt(32)

    local msg = {}
    if borderEnabled then
        table.insert(msg, borderColor)
        table.insert(msg, string.rep(borderChar, borderLength) .. "\n")
    end

    table.insert(msg, headerColor)
    table.insert(msg, "Top " .. DisplayCount .. "\n")

    for i, player in ipairs(topBalances) do
        table.insert(msg, rankColor)
        table.insert(msg, i .. ". ")
        table.insert(msg, nameColor)
        table.insert(msg, player.rpname .. ": ")
        table.insert(msg, moneyColor)
        table.insert(msg, "$" .. formatMoney(player.wallet) .. "\n")
    end

    if borderEnabled then
        table.insert(msg, borderColor)
        table.insert(msg, string.rep(borderChar, borderLength))
    end

    chat.AddText(unpack(msg))
end)
