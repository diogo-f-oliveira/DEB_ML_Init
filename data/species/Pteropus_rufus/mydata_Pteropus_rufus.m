function [data, auxData, metaData, txtData, weights] = mydata_Pteropus_rufus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Pteropus_rufus'; 
metaData.species_en = 'Madagascan flying fox'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 125;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
  comment.tg = '100-150 g';
data.tx = 4.5*31;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ADW';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 5.5; units.Lb = 'cm';   label.Lb = 'forewarm length at birth';     bibkey.Lb = 'AndrAndr2021';
data.Li = 15;  units.Li = 'cm';   label.Li = 'ultimate forewarm length'; bibkey.Li = 'AndrAndr2021';

data.Wwb = 82.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'ADW';
  comment.Wwb = '13-17 percent of adult: 0.15*550';
data.Wwi = 650;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'ADW';
  comment.Wwi = '500 to 645 g for females, 526 to 750 g for males';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), forearm length (cm)
3.986	6.562
30.569	8.854
32.197	9.201
40.172	8.889
41.050	9.861
50.542	8.507
50.681	10.243
53.011	9.375
56.250	9.861
63.544	11.042
68.406	11.806
77.781	8.993
82.014	11.910
112.561	13.750
118.139	13.472
156.669	15.104
158.306	15.556
167.808	14.340
174.297	15.451
175.261	17.500
175.764	13.785
175.872	15.139
177.417	14.444
178.411	16.875
182.119	13.229
203.872	15.139
204.586	14.062
205.417	14.444
235.039	14.722
235.094	15.417
316.644	14.792
344.661	15.000
360.608	14.340
368.772	16.389];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'forearm length', 'female'};  
temp.tL_f    = C2K(34.8);  units.temp.tL_f = 'C'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AndrAndr2021';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), forearm length (cm)
36.194	9.167
36.897	7.951
44.736	5.937
62.683	10.278
64.217	9.444
66.661	10.000
69.606	16.806
72.386	11.562
74.025	12.049
74.536	8.437
75.506	10.556
75.542	11.007
83.650	12.361
114.919	13.229
117.289	12.847
142.158	13.715
150.997	14.201
154.989	14.097
157.861	10.000
171.128	15.833
171.806	14.306
202.172	13.889
231.792	14.132
361.361	13.750
362.233	14.653];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'forearm length', 'male'};  
temp.tL_m    = C2K(34.8);  units.temp.tL_m = 'C'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AndrAndr2021';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 10 * weights.Lb;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4Q33Q'; % Cat of Life
metaData.links.id_ITIS = '631654'; % ITIS
metaData.links.id_EoL = '327292'; % Ency of Life
metaData.links.id_Wiki = 'Pteropus_rufus'; % Wikipedia
metaData.links.id_ADW = 'Pteropus_rufus'; % ADW
metaData.links.id_Taxo = '63857'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800362'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteropus_rufus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrAndr2021'; type = 'Article'; bib = [ ...
'doi = {10.1101/2021.10.28.466299}, ' ...
'author = {Angelo Andrianiaina and Santino Andry and Anecia Gentles and Sarah Guth and Jean-Michel H\''{e}raud and Hafaliana Christian Ranaivoson and Ny Anjara Fifi Ravelomanantsoa and Timothy Treuer and Cara E. Brook}, ' ... 
'year = {2021}, ' ...
'title =  {Reproduction, seasonal morphology, and juvenile growth in three {M}alagasy fruit bats}, ' ...
'journal = {BioRxiv}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pteropus_rufus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

