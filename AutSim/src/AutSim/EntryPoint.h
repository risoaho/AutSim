#pragma once

#ifdef AUT_PLATFORM_WINDOWS

extern AutSim::Application* AutSim::CreateApplication();

int main(int argc, char** argv)
{
	AutSim::Log::Init();

	printf("AutSim engine startup\n");
	auto app = AutSim::CreateApplication();
	app->Run();
	delete app;
}

#endif


