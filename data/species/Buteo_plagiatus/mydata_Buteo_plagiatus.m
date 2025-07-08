function [data, auxData, metaData, txtData, weights] = mydata_Buteo_plagiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_plagiatus'; 
metaData.species_en = 'Gray hawk';

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 22];              
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

data.ab = 32;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 42;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 126;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30.7*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 43.2;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'avibase';
data.Wwi = 624;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 429.75;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 1-5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
 2.912	 68.430
 5.967	114.290
 9.021	158.348
12.080	230.334
14.987	287.910
18.043	341.878
21.147	385.935
24.090	374.140
27.100	446.128
30.149	463.159
33.194	464.875];
data.tW1(:,1) = data.tW1(:,1) + 2; % match weight at 0 to hatch weight
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'BiblGlin2020';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
 3.959	 61.193
 6.912	 96.245
10.116	140.299
13.073	199.676
16.131	262.653
19.030	284.193
22.091	363.386
24.992	386.727
28.097	439.793
31.148	464.932
34.193	465.748];
data.tW2(:,1) = data.tW2(:,1) + 2; % match weight at 0 to hatch weight
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'BiblGlin2020';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
 1.907	 34.224
 4.957	 54.859
 8.008	 86.305
10.913	133.070
13.969	186.137
17.017	200.465
20.074	259.839
23.220	266.957
26.123	302.912
29.173	324.448
32.216	317.155];
data.tW3(:,1) = data.tW3(:,1) + 2; % match weight at 0 to hatch weight
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW3    = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'BiblGlin2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 2 * weights.tW1; 
weights.tW2 = 2 * weights.tW2; 
weights.tW3 = 2 * weights.tW3; 

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
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for individual 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'NYVG'; % Cat of Life
metaData.links.id_ITIS = '824489'; % ITIS
metaData.links.id_EoL = '45511419'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_plagiatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '159218'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '943AA4FB1C994B08'; % avibase
metaData.links.id_birdlife = 'grey-hawk-buteo-plagiatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_plagiatus}}';
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
bibkey = 'BiblGlin2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.gryhaw2.01}, ' ...
'author = {Bibles, B. D. and R. L. Glinski and R. R. Johnson}, ' ... 
'year = {2020}, ' ...
'title = {Gray Hawk (\emph{Buteo plagiatus}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=943AA4FB1C994B08&sec=lifehistory}}';
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

