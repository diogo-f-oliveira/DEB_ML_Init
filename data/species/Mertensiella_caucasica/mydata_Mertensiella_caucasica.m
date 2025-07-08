function [data, auxData, metaData, txtData, weights] = mydata_Mertensiella_caucasica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Mertensiella_caucasica'; 
metaData.species_en = 'Caucasian salamander'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 27];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

etaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data;
data.tp = 4.5*365;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Uzum2009';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Uzum2009';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.5;       units.Lp = 'cm';   label.Lp = 'SVL at puberty';  bibkey.Lp = 'Uzum2009';
data.Li = 6.38;       units.Li = 'cm';   label.Li = 'ultimate SVL for females';  bibkey.Li = 'Uzum2009';
data.Lim = 6.75;      units.Lim = 'cm';   label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Uzum2009';

data.Wwb = 0.0654;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3'; 
data.Wwp = 2.37;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'Uzum2009';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 3.7;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Uzum2009';
data.Wwim = 4.7;      units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Uzum2009';

data.Ri  = 18/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 to 25 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1.007	4.255
1.956	4.152
2.995	4.221
4.030	5.649
4.978	5.941
4.979	5.521
5.973	5.541
5.973	5.319
6.014	6.998
6.014	6.899
6.015	6.454
6.019	5.047
6.036	7.170
7.029	7.536
8.993	7.651];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Uzum2009';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
1.054	4.300
2.048	4.121
3.019	4.167
5.035	6.269
5.986	7.110
6.009	6.961
6.030	6.712
6.978	6.435
6.979	6.534
6.979	6.658
6.980	6.931
7.974	7.200
7.996	6.703
8.944	6.798
8.945	6.997
10.005	6.570];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Uzum2009';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3ZWX2'; % Cat of Life
metaData.links.id_ITIS = '668374'; % ITIS
metaData.links.id_EoL = '1039216'; % Ency of Life
metaData.links.id_Wiki = 'Mertensiella_caucasica'; % Wikipedia
metaData.links.id_ADW = 'Mertensiella_caucasica'; % ADW
metaData.links.id_Taxo = '47288'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Mertensiella+caucasica'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mertensiella_caucasica}}';   
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
bibkey = 'Uzum2009'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S106235901704015X}, ' ...
'author = {Nazan \"{U}z\"{u}m}, ' ... 
'year = {2009}, ' ...
'title = {A skeletochronological study of age, growth and longevity in a population of the {C}aucasian Salamander, \emph{Mertensiella caucasica} ({W}aga 1876) ({C}audata: {S}alamandridae) from {T}urkey}, ' ...
'journal = {North-Western Journal of Zoology}, ' ...
'volume = {5(1)}, ' ...
'pages = {74-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
