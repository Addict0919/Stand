#include "Stand.hpp"

namespace Stand
{
	void CommandPhysical::setMenuName(std::string&& menu_name)
	{
		return menu::set_menu_name(this, std::move(menu_name));
	}

	void CommandPhysical::setCommandNames(std::vector<std::wstring>&& command_names)
	{
		return menu::set_command_names(this, std::move(command_names));
	}

	void CommandPhysical::setHelpText(std::string&& help_text)
	{
		return menu::set_help_text(this, std::move(help_text));
	}

	void CommandPhysical::beGone()
	{
		return menu::be_gone(this);
	}

	CommandPhysical* CommandList::action(std::string&& menu_name, std::vector<std::wstring>&& command_names, std::string&& help_text, std::function<void()>&& on_click, std::function<void(std::wstring&&)>&& on_command, std::wstring&& syntax)
	{
		return menu::action(this, std::move(menu_name), std::move(command_names), std::move(help_text), std::move(on_click), std::move(on_command), std::move(syntax));
	}

	CommandPhysical* CommandList::toggle(std::string&& menu_name, std::vector<std::wstring>&& command_names, std::string&& help_text, std::function<void(bool)>&& on_change, bool default_on)
	{
		return menu::toggle(this, std::move(menu_name), std::move(command_names), std::move(help_text), std::move(on_change), default_on);
	}

	CommandPhysical* CommandList::divider(std::string&& menu_name)
	{
		return menu::divider(this, std::move(menu_name));
	}
}
