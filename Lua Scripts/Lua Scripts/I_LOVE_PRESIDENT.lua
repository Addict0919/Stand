while true do
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(100)
end