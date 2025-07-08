function [data, auxData, metaData, txtData, weights] = mydata_Hydroprogne_caspia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Hydroprogne_caspia'; 
metaData.species_en = 'Caspian tern'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'MA'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TP', 'MC'};
metaData.ecoCode.habitat = {'0iFm', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27.2;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BarlDowd2002';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '22 to 23 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 37;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BarlDowd2002';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '33 to 39 d';
data.tp = 111;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '33 to 39 d';
data.tR = 1095;        units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30*365;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 60;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BarlDowd2002';
  comment.Wwb = 'egg length 6.45 cm, width 4.46 cm, weight: pi/6*6.45*4.46^2=67.1 g';
data.Wwi = 644;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 530 to 782 g';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BarlDowd2002';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.000	60.153
1.931	74.086
2.900	83.658
3.868	105.439
4.912	111.521
5.878	142.895
6.846	157.700
7.890	163.781
8.782	196.029
9.899	212.575
10.865	244.821
11.909	251.775
12.877	273.556
13.842	311.908
14.964	289.209
15.853	345.875
16.897	347.597
17.717	355.428
18.756	400.754
19.801	404.219
20.769	415.536
21.737	437.317
22.780	452.992
23.824	456.457
24.791	486.087
25.760	494.787
26.656	491.279
27.696	527.885
28.595	499.086
29.715	493.829
30.832	508.630
31.725	536.518
32.846	519.051
33.739	543.450
34.636	526.861
35.606	532.073
37.770	532.897];
data.tW(:,1) = data.tW(:,1) - 1; % set origin to hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BarlDowd2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3N8ZF'; % Cat of Life
metaData.links.id_ITIS = '176935'; % ITIS
metaData.links.id_EoL = '45509309'; % Ency of Life
metaData.links.id_Wiki = 'Hydroprogne_caspia'; % Wikipedia
metaData.links.id_ADW = 'Sterna_caspia'; % ADW
metaData.links.id_Taxo = '53849'; % Taxonomicon
metaData.links.id_WoRMS = '567825'; % WoRMS
metaData.links.id_avibase = 'BC06BC0D1056BC7B'; % avibase
metaData.links.id_birdlife = 'caspian-tern-hydroprogne-caspia'; % birdlife
metaData.links.id_AnAge = 'Hydroprogne_caspia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydroprogne_caspia}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hydroprogne_caspia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BarlDowd2002'; type = 'Article'; bib = [ ... 
'author = {M. L. Barlow and J. E. Dowding}, ' ... 
'year = {2002}, ' ...
'title = {Breeding biology of Caspian terns (\emph{Sterna caspia}) at a colony near {I}nvercargill, {N}ew {Z}ealand}, ' ...
'journal = {Notornis}, ' ...
'volume = {49}, ' ...
'pages = {76-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
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

