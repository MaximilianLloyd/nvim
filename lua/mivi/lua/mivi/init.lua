print("Hello world!")


local function run()
    local file = vim.fn.expand("%:p")
    vim.cmd("vsplit | terminal")
    local command = ':call jobsend(b:terminal_job_id, "echo hello world \\n")'
    vim.cmd(command)
    print("my file is " .. file)
end

return {
    run = run
}
