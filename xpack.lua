-- xpack
includes("@builtin/xpack")

local projectname = projectname

xpack("release", function()
    set_formats("zip")

    on_load(function(package)
        import("core.project.project")

        package:set(
            "basename",
            projectname:gsub("%s+", "-") .. "-" .. project.version()
        )

        package:add("installfiles", "patch/(**)")
        package:add("installfiles", "(fomod/**)|**.in")
    end)

    after_package(function(package)
        local outfile = package:outputfile()
        local outdir = path.directory(outfile)
        local packdir = path.directory(outdir)

        os.mv(outfile, packdir)
        os.rmdir(outdir)

        import("core.base.json")
        print("[package]: " .. json.encode({
            filename = package:basename() .. package:extension(),
            name = projectname,
            file_id = 3210598,
            category = "optional",
            description = [[
Please check the description page for details.

Add patch for Wintersun - Faiths of Skyrim v3.3.0.

If you find any issues caused by the patches, please report them here and don't bother the mod authors. Thanks!]],
        }))
    end)
end)
