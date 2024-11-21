#pragma once

#ifdef AUT_PLATFORM_WINDOWS

extern AutSim::Application* AutSim::CreateApplication();

int main(int argc, char** argv)
{
	AutSim::Log::Init();

	auto app = AutSim::CreateApplication();
	app->Run();
	delete app;
}

#endif


