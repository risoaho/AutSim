#pragma once

#ifdef AUT_PLATFORM_WINDOWS

extern AutSim::Application* AutSim::CreateApplication();

int main(int argc, char** argv)
{
	AutSim::Log::Init();
	AUT_CORE_WARN("Logger initialized!");
	int a = 5;
	AUT_CLIENT_INFO("Hello a = {0}", a);

	auto app = AutSim::CreateApplication();
	app->Run();
	delete app;
}

#endif


