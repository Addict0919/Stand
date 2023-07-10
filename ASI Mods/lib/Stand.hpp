#pragma once

#include <ScriptHookV/main.h>
#include <ScriptHookV/types.h>

#include <cstdint>
#ifndef NO_STAND
#include <functional>
#include <string>
#include <vector>
#endif

static_assert(sizeof(uintptr_t) == 8, "This will only work on 64-bit");

namespace Stand
{
#ifndef NO_STAND
#define STAND_API __declspec(dllimport) static

	using toast_t = uint8_t;
#define TOAST_ABOVE_MAP			((toast_t)0b1)
#define TOAST_FORCE_ABOVE_MAP	((toast_t)0b10)
#define TOAST_LOGGER			((toast_t)0b100)
#define TOAST_WEB				((toast_t)0b1000)
#define TOAST_CHAT				((toast_t)0b10000)
#define TOAST_CHAT_TEAM			((toast_t)0b100000)
#define TOAST_DEFAULT			(TOAST_ABOVE_MAP | TOAST_WEB)
#define TOAST_ALL				(TOAST_DEFAULT | TOAST_LOGGER)

	using compactplayer_t = uint8_t;

	template <typename... Ts>
	static void nullsub(Ts...) {}

	class CommandPhysical
	{
	public:
		void setMenuName(std::string&& menu_name);
		void setCommandNames(std::vector<std::wstring>&& command_names);
		void setHelpText(std::string&& help_text);

		void beGone();
	};

	class CommandList : public CommandPhysical
	{
	public:
		CommandPhysical* action(std::string&& menu_name, std::vector<std::wstring>&& command_names = {}, std::string&& help_text = {}, std::function<void()>&& on_click = &nullsub<>, std::function<void(std::wstring&&)>&& on_command = &nullsub<std::wstring&&>, std::wstring&& syntax = {});
		CommandPhysical* toggle(std::string&& menu_name, std::vector<std::wstring>&& command_names = {}, std::string&& help_text = {}, std::function<void(bool)>&& on_change = &nullsub<bool>, bool default_on = false);
		CommandPhysical* divider(std::string&& menu_name);
	};

	struct menu
	{
		[[nodiscard]] STAND_API CommandList* my_root();
		STAND_API CommandPhysical* action(CommandList* parent, std::string&& menu_name, std::vector<std::wstring>&& command_names = {}, std::string&& help_text = {}, std::function<void()>&& on_click = &nullsub<>, std::function<void(std::wstring&&)>&& on_command = &nullsub<std::wstring&&>, std::wstring&& syntax = {});
		STAND_API CommandPhysical* toggle(CommandList* parent, std::string&& menu_name, std::vector<std::wstring>&& command_names = {}, std::string&& help_text = {}, std::function<void(bool)>&& on_change = &nullsub<bool>, bool default_on = false);
		STAND_API CommandPhysical* divider(CommandList* parent, std::string&& menu_name);
		STAND_API void set_menu_name(CommandPhysical* command, std::string&& menu_name);
		STAND_API void set_command_names(CommandPhysical* command, std::vector<std::wstring>&& command_names);
		STAND_API void set_help_text(CommandPhysical* command, std::string&& help_text);
		STAND_API void be_gone(CommandPhysical* command);
		STAND_API void show_command_box(std::wstring&& prefill);
		STAND_API bool trigger_commands(std::wstring&& input);
	};
#endif

	struct util
	{
#ifndef NO_STAND
		STAND_API void toast(std::string&& message, toast_t toast_flags = TOAST_DEFAULT);

		static void log(std::string&& message)
		{
			return toast(std::move(message), TOAST_LOGGER);
		}
#endif

		static void yield()
		{
			return ::scriptWait(0);
		}

#ifndef NO_STAND
		[[nodiscard]] STAND_API std::string utf16_to_utf8(const std::wstring& utf16);
		[[nodiscard]] STAND_API std::wstring utf8_to_utf16(const std::string& utf8);
#endif
	};

	struct players
	{
		STAND_API void on_join(void handler(compactplayer_t, bool));
		STAND_API void on_leave(void handler(compactplayer_t, const std::string&, bool));
	};

	struct memory
	{
		[[nodiscard]] static int* script_global(size_t global)
		{
			return (int*)::getScriptHandleBaseAddress(global);
		}

		[[nodiscard]] static void* rip(void* ptr)
		{
			return (void*)(((uint64_t)ptr) + (*(int32_t*)ptr) + 4);
		}
	};
}

#ifndef NO_STAND
#undef STAND_API
#endif
