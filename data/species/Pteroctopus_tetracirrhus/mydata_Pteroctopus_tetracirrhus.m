function [data, auxData, metaData, txtData, weights] = mydata_Pteroctopus_tetracirrhus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Pteroctopus_tetracirrhus'; 
metaData.species_en = 'Fourhorn octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm', 'MAW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 530;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'guess';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on guessed time at birth';

data.Lb  = 0.45;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'QuetOrdi2009';
data.Lp  = 10.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'QuetOrdi2009';
data.Lpm  = 8.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';     bibkey.Lpm  = 'QuetOrdi2009';
data.Li  = 11;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'QuetOrdi2009';
data.Lim  = 9.5;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for males';     bibkey.Lim  = 'QuetOrdi2009';

data.Wwi  = 741;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'QuetOrdi2009';
data.Wwim  = 374;  units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males';     bibkey.Wwim  = 'QuetOrdi2009';

data.Ni  = 8000; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'LaptSalm2014';   
  temp.Ni = C2K(6);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
t_0 = 250; % d, time since birth till nov
data.tL_f = [ ... % time since nov (d), mantle length (cm)
1.463	5.526
31.815	6.615
62.899	6.641
124.335	9.165
154.322	9.564
184.309	10.201
215.027	10.414
246.110	10.839];
data.tL_f(:,1) = data.tL_f(:,1) + t_0;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'QuetOrdi2009';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since nov (d), mantle length (cm)
1.097	4.516
32.547	5.632
92.520	7.784
123.238	8.209
153.590	8.634
183.577	8.979
214.661	9.271
245.379	9.271
277.194	9.696];
data.tL_m(:,1) = data.tL_m(:,1) + t_0;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'QuetOrdi2009';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 8 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Time of birth in tL data is unkown; it assumed to be 250 d before the first data-point, to bring down v, but this might be an under-estimate';
D3 = 'End of acceleration is assumed to coincide with puberty';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Reduced ink sac, short or no plantonic stage';
metaData.bibkey.F2 = 'QuetOrdi2009'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78KKC'; % Cat of Life
metaData.links.id_ITIS = '82644'; % ITIS
metaData.links.id_EoL = '492408'; % Ency of Life
metaData.links.id_Wiki = 'Pteroctopus'; % Wikipedia
metaData.links.id_ADW = 'Pteroctopus_tetracirrhus'; % ADW
metaData.links.id_Taxo = '158333'; % Taxonomicon
metaData.links.id_WoRMS = '140606'; % WoRMS
metaData.links.id_molluscabase = '140606'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteroctopus}}';
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
bibkey = 'QuetOrdi2009'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr.2009.02.007}, ' ...
'author = {Antoni Quetglas and Francesc Ordines and Mar\''{i}a Gonz\''{a}lez and Ignacio Franco}, ' ... 
'year = {2009}, ' ...
'title = {Life history of the bathyal octopus \emph{Pterocto pustetracirrhus}({M}ollusca, {C}ephalopoda) in the {M}editerranean {S}ea}, ' ...
'journal = {Deep-Sea Research I}, ' ...
'volume = {56}, ' ...
'pages = {1379-1390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LaptSalm2014'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr.2014.06.009}, ' ...
'author = {Vladimir Laptikhovsky and Alp Salman and Bahadir \"{O}nsoy and Meryem Akalin Beytullah Ceylan}, ' ... 
'year = {2014}, ' ...
'title = {Reproduction in rare bathyaloctopods \emph{Pteroctopus tetracirrhus} and \emph{Scaeurgus unicirrhus} ({C}ephalopoda: {O}ctopoda)in the east {M}editerranean as an apparent response to extremely oligotrophic deep seas}, ' ...
'journal = {Deep-Sea Research I}, ' ...
'volume = {92}, ' ...
'pages = {85-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Pteroctopus-tetracirrhus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

