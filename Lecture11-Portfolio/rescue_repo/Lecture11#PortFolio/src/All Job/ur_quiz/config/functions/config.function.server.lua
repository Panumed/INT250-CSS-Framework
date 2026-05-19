FC = {}

FC.Notify = function(xPlayer, type, label)
    TriggerClientEvent('pNotify:SendNotification', xPlayer, { type = type, text = label })
end