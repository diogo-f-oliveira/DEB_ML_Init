function [data, auxData, metaData, txtData, weights] = mydata_Stephanoaetus_coronatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Stephanoaetus_coronatus'; 
metaData.species_en = 'Crowned eagle'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 49;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 112.5;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 337.5;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'avibase';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ww0 = 112;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 93;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Ww0';
data.Wwi = 3950;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '3.2–4.7 kg';
data.Wwim = 3335;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';
  comment.Wwim = '2.55–4.12 kg';

data.Ri  = 1.8/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per 2 yr, 1.8 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
60.000	2247.917
62.059	2990.518
64.926	2227.905
65.047	2812.235
68.035	1974.776
68.923	2746.755
69.973	2582.485
70.013	3009.472
70.014	3473.891
70.094	3354.082
74.980	2749.780
75.020	2667.403
75.021	3206.729
76.958	3020.431
79.058	3111.367
79.946	3171.735
79.947	3359.001
79.987	2999.471
79.988	3044.415];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'MsPhBrow2017';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
64.966	2355.266
65.007	2018.208
65.008	2145.548
68.035	2446.686
70.013	2282.880
70.014	2200.483
70.015	2013.217
70.054	1863.425
70.983	2732.802
71.023	2238.440
73.930	2397.195
74.980	2225.435
75.020	2360.287
76.958	2076.610
78.896	2182.447
79.017	2279.886
79.987	2542.542
90.000	2480.127];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'MsPhBrow2017';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2; 
weights.tW_m = weights.tW_m * 2; 
weights.Ww0 = weights.Ww0 * 0; 

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
D1 = 'body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '52BWJ'; % Cat of Life
metaData.links.id_ITIS = '563141'; % ITIS
metaData.links.id_EoL = '1048944'; % Ency of Life
metaData.links.id_Wiki = 'Stephanoaetus_coronatus'; % Wikipedia
metaData.links.id_ADW = 'Stephanoaetus_coronatus'; % ADW
metaData.links.id_Taxo = '52741'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1E3B3515F00E331A'; % avibase
metaData.links.id_birdlife = 'crowned-eagle-stephanoaetus-coronatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stephanoaetus_coronatus}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=1E3B3515F00E331A&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MsPhBrow2017'; type = 'Article'; bib = [ ... 
'doi = {10.2989/00306525.2016.1259185}, ' ...
'title = {Gender-related morphometric differences in mature and nestling Crowned Eagles, with comments on ringing of eagle nestlings in {K}waZulu-{N}atal, {S}outh {A}frica}, ' ...
'author = {Shane C McPherson and Mark Brown and Colleen T Downs}, ' ...
'journal = {Ostrich}, ' ...
'year = {2017}, ' ...
'volume = {88(3}, ' ...
'pages = {195–200}'];
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

