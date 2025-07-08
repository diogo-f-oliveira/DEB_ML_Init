close all
global pets

pets = {'Natator_depressus'};
check_my_pet(pets);

estim_options('default'); 
estim_options('max_step_number',2e3);
estim_options('max_fun_evals',5e5); 

estim_options('pars_init_method', 2);
estim_options('results_output', 3);
estim_options('method', 'no');

estim_pars; % run estimation

%% evaluate this section if you want a different figure (reqest of author)
% change line into dots for L0-Lt data, and saves into a .png
% figure(3) % select figure with L0-Lt
% hline = findobj(gcf, 'type', 'line'); % get the lines in the figure
% set(hline(2),'LineStyle','none')
% set(hline(2),'Marker','s', 'MarkerSize',6)
% print -dpng results_Natator_depressus_03.png