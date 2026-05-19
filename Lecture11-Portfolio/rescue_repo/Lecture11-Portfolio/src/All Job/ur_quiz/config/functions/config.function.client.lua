FC = {}

FC.Notify = function(type, label)
    TriggerEvent('pNotify:SendNotification', { text=label, type=type})
end