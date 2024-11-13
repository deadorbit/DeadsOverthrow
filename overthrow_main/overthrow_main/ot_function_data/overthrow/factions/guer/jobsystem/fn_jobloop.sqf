//Timer for cycles of running the job system?
job_system_counter = job_system_counter + 1;
if (job_system_counter > 12) then {
	job_system_counter = 0;
	
	{_x call OT_fnc_spawnJob}foreach(OT_allJobs);
};
