function [data, auxData, metaData, txtData, weights] = mydata_Accipiter_striatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Accipiter_striatus'; 
metaData.species_en = 'Sharp-shinned hawk'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 06 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 34;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 30;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'DelaCruz1988';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ww0 = 19;    units.Ww0 = 'g';   label.Ww0 = 'initial weight';    bibkey.Ww0 = 'Wiki';
data.Wwi = 172;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'DelaCruz1988';
data.Wwim = 102;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'DelaCruz1988';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 4 eggs/clutch';
  
% uni-variate data
% time weight
% females: asym W 172 g, inflection point 11.0 d
data.tW_f = [ ... % time since birth (d), logistic conversion of % of asymp weight
1.919	-0.628
2.909	-0.558
3.896	-0.507
4.936	-0.445
6.027	-0.387
6.966	-0.312
7.904	-0.236
9.101	-0.156
10.035	-0.113
10.975	-0.023
13.053	0.075
13.946	0.213
15.917	0.281
16.952	0.301
17.996	0.396
20.025	0.524
21.004	0.507
23.179	0.547
23.972	0.712
25.065	0.790];
data.tW_f(:,2) = 172 * exp(data.tW_f(:,2) ./(1+data.tW_f(:,2))); 
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'DelaCruz1988';
comment.tW_f = 'data for females';
% males: asym W 102 g, inflextion point 8.8 d
data.tW_m = [ ... % time since birth (d), logistic conversion of % of asymp weight
1.044	-0.600
1.820	-0.598
2.863	-0.507
3.798	-0.457
4.891	-0.387
5.932	-0.317
6.922	-0.241
7.865	-0.121
7.909	-0.186
9.004	-0.096
10.039	-0.081
10.979	0.012
11.863	0.065
12.907	0.155
13.899	0.256
14.991	0.316
15.838	0.507
16.824	0.547
17.817	0.650
19.005	0.647
20.045	0.708
21.190	0.778
22.059	0.697
23.007	0.861
24.088	0.831];
data.tW_m(:,2) = 102 * exp(data.tW_m(:,2) ./ (1+data.tW_m(:,2))); 
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'DelaCruz1988';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2; 
weights.tW_m = weights.tW_m * 2; 

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
D1 = 'body temperature is guessed and only on target after a few days, as discussed in Kooy2010';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '93VZ'; % Cat of Life
metaData.links.id_ITIS = '175304'; % ITIS
metaData.links.id_EoL = '45511393'; % Ency of Life
metaData.links.id_Wiki = 'Accipiter_striatus'; % Wikipedia
metaData.links.id_ADW = 'Accipiter_striatus'; % ADW
metaData.links.id_Taxo = '52577'; % Taxonomicon
metaData.links.id_WoRMS = '159105'; % WoRMS
metaData.links.id_avibase = 'F2B44500C0E8918E'; % avibase
metaData.links.id_birdlife = 'sharp-shinned-hawk-accipiter-striatus '; % birdlife
metaData.links.id_AnAge = 'Accipiter_striatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Accipiter_striatus}}';
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
bibkey = 'DelaCruz1988'; type = 'Article'; bib = [ ... 
'title = {Breeding Biology of the {P}uerto {R}ican Sharp-Shinned Hawk (\emph{Accipiter striatus venator})}, ' ...
'author = {Carlos A. Delannoy and Alexander Cruz}, ' ...
'journal = {The Auk}, ' ...
'year = {1988}, ' ...
'volume = {105(4)}, ' ...
'pages = {649-662}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Accipiter_striatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F2B44500C0E8918E&sec=lifehistory}}';
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

