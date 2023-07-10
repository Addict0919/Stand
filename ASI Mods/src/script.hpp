#pragma once

#include <Stand.hpp>

using namespace Stand;

static CommandPhysical* clicker_command;
static unsigned long long clicker_clicks;

void ScriptMain()
{
	auto list = menu::my_root();
	list->divider("I'm a divider");
	clicker_clicks = 0;
	clicker_command = list->action("Click me!", {}, {}, []
	{
		clicker_command->setMenuName(std::move(std::string("You've clicked me ").append(std::to_string(++clicker_clicks)).append(" times")));
	});
	list->action("Action With Command", { L"myasiaction" }, {}, []
	{
		util::toast("Ew, you clicked me!");
	}, [](std::wstring&& arg)
	{
		std::string message("You say ");
		message.append(util::utf16_to_utf8(arg));
		util::toast(std::move(message));
	}, L"myasiaction [text]");
	list->toggle("I'm a toggle", {}, {}, [](bool on)
	{
		util::toast(on ? "on" : "off");
	});

	TERMINATE(); // Keeps the script running until the end of (our) time, perfect for not crashing the game.
}
