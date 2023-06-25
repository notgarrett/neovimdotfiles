local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end
local list = {

}

nvim_tree.setup {
    view = {
        mappings = {
            list = list
        }
    }
}
