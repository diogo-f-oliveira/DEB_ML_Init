function [data, auxData, metaData, txtData, weights] = mydata_Cranchia_scabra

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Cranchiidae';
metaData.species    = 'Cranchia_scabra'; 
metaData.species_en = 'Rough cranch squid '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'guess';
data.Lp  = 7;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
data.Li  = 15;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Wiki';

data.Wwi  = 82.7;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'QuetAlem2000';
  comment.Wwi = 'based on ML 10.2 cm weighs 26 g: 26*(15/10.2)^3';
  
data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
72.144	3.906
75.481	3.903
81.130	5.648
85.237	3.844
96.791	5.121
97.304	6.047
100.642	6.044
103.466	5.939
109.371	8.250
112.452	6.550
112.453	6.910
115.019	6.959
123.492	9.833
123.493	6.181
124.519	10.861
126.573	8.339
129.397	6.845
130.424	9.416
134.018	8.282
135.815	7.097
138.126	9.410
139.410	7.352
139.411	11.210
142.490	9.561
150.706	8.578
158.665	8.160
162.003	12.530
167.908	11.754
167.909	11.291];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
73.171	4.780
80.873	4.722
106.290	6.709
111.682	5.830
111.683	8.093
117.587	8.809
127.086	7.721
131.194	6.895
136.842	7.200
137.612	8.022
139.410	11.004
139.666	8.432
144.544	10.846
144.545	10.023
144.801	8.634
145.058	8.839
151.990	9.606
155.584	9.397];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.am = 2 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BBN6'; % Cat of Life
metaData.links.id_ITIS = '82578'; % ITIS
metaData.links.id_EoL = '402648'; % Ency of Life
metaData.links.id_Wiki = 'Cranchia_scabra'; % Wikipedia
metaData.links.id_ADW = 'Cranchia_scabra'; % ADW
metaData.links.id_Taxo = '40299'; % Taxonomicon
metaData.links.id_WoRMS = '181386'; % WoRMS
metaData.links.id_molluscabase = '181386'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cranchia_scabra}}';
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
bibkey = 'Arkh1996'; type = 'article'; bib = [ ... 
'author = {Alexander Arkhipkin}, ' ... 
'year = {1996}, ' ...
'title = {Age and growth of planktonic squids \emph{Cranchia scabra} and \emph{Liocranchia reinhardti} ({C}ephalopoda, {C}ranchiidae) in epipelagic waters of the central-east {A}tlantic}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {18(9)}, ' ...
'pages = {l675-1683}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QuetAlem2000'; type = 'article'; bib = [ ... 
'author = {Antonio Quetglas and Francese Alemany and Aina Carbonelli and Pilar S\''{a}nchez}, ' ... 
'year = {2000}, ' ...
'title = {The first record of \emph{Cranchia scabra} a{L}each, 1817 ({C}ephalopoda, {C}ranchiidae) in in the {M}editerranean {S}ea}, ' ...
'journal = {Bollettino Malacologico Roma}, ' ...
'volume = {35(1-4)}, ' ...
'pages = {1-2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Cranchia-scabra.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

