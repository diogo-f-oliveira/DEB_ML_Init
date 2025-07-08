function [data, auxData, metaData, txtData, weights] = mydata_Tympanuchus_pallidicinctus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Tympanuchus_pallidicinctus'; 
metaData.species_en = 'Lesser prairie chicken';

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 09 28];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data;
data.ab = 23;      units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'AnAge';  
  temp.ab = C2K(34); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 1;       units.tx = 'd';    label.tx = 'time since birth at fledging';          bibkey.tx = 'PitmHage2005';  
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;       units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'guess';  
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'time it reaches 90 percent body mass';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';         bibkey.tR = 'AnAge'; 
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13.5*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';                   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 15.5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'PitmHage2005'; 
data.Wwi = 719;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'PitmHage2005';   
data.Wwim = 789;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'PitmHage2005';   

data.Ri  = 11/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
 0       15.5
31.842	133.049
33.395	160.341
39.847	208.102
56.518	383.795
62.967	441.791
70.769	441.791];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'PitmHage2005';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
 0       15.5
30.055	146.695
32.711	216.631
32.940	192.751
33.802	300.213
34.018	324.094
34.497	208.102
36.053	223.454
36.272	235.394
36.935	257.569
39.832	262.687
42.284	262.687
53.838	399.147
53.844	378.678
54.488	467.377
54.501	419.616
62.485	569.723
62.694	620.896
63.391	518.550
63.813	603.838
64.064	503.198
65.842	521.962
67.842	544.136
70.078	521.962
122.630	735.181];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(41); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'PitmHage2005';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.ab = 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temerature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '7DB5M'; % Cat of Life
metaData.links.id_ITIS = '175838'; % ITIS
metaData.links.id_EoL = '45510632'; % Ency of Life
metaData.links.id_Wiki = 'Tympanuchus_pallidicinctus'; % Wikipedia
metaData.links.id_ADW = 'Tympanuchus_pallidicinctus'; % ADW
metaData.links.id_Taxo = '52978'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'CFFD1491D1F401D8'; % avibase
metaData.links.id_birdlife = 'lesser-prairie-chicken-tympanuchus-pallidicinctus'; % birdlife
metaData.links.id_AnAge = 'Tympanuchus_pallidicinctus'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tympanuchus_pallidicinctus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PitmHage2005'; type = 'Article'; bib = [ ... 
'author = {J. C. Pitman and C. A. Hagen and R. J, Robel and T. M. Loughin and R. D. Applegate}, ' ... 
'year = {2005}, ' ...
'title = {GENDER IDENTIFICATION AND GROWTH OF JUVENILE LESSER PRAIRIE-CHICKENS}, ' ...
'journal = {Condor}, ' ...
'volume = {107}, ' ...
'pages = {87-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tympanuchus_pallidicinctus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

