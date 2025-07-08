function [data, auxData, metaData, txtData, weights] = mydata_Psittaculirostris_salvadorii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Psittaculirostris_salvadorii'; 
metaData.species_en = 'Salvadori''s fig parrot';

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 24;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'JordSilv1991';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 67;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'JordSilv1991';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 201;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.1;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'JordSilv1991';
data.Wwi = 100;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'JordSilv1991';

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'JordSilv1991';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch; breeds once per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.452	3.652
2.603	3.475
4.247	4.962
4.904	5.956
7.534	7.601
7.863	9.432
9.342	11.086
9.671	12.750
10.822	14.907
11.973	15.897
12.959	17.889
13.781	18.549
16.411	19.860
17.890	22.181
18.877	23.340
19.699	23.166
22.658	28.642
23.644	32.300
24.630	35.292
25.616	42.450
27.260	42.437
27.589	39.434
28.740	44.758
29.890	50.415
30.712	48.741
32.192	54.895
32.685	59.725
34.493	65.043
36.630	70.358
38.932	72.339
39.918	76.164
41.726	75.983
43.041	80.972
44.356	83.627
45.836	88.282
46.493	92.276
48.795	93.590
49.781	95.916
51.096	96.738
52.247	95.728
52.575	97.226
53.890	97.215
55.863	100.532
56.849	97.190
58.000	100.014
58.986	100.172
62.603	91.975
65.233	92.120
66.712	85.608
71.644	93.733];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'JordSilv1991';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4PKCT'; % Cat of Life
metaData.links.id_ITIS = '554858'; % ITIS
metaData.links.id_EoL = '45518035'; % Ency of Life
metaData.links.id_Wiki = 'Psittaculirostris_salvadorii'; % Wikipedia
metaData.links.id_ADW = 'Psittaculirostris_salvadorii'; % ADW
metaData.links.id_Taxo = '70587'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '66AC2F1833D93970'; % avibase
metaData.links.id_birdlife = 'salvadoris-fig-parrot-psittaculirostris-salvadorii'; % birdlife
metaData.links.id_AnAge = 'Psittaculirostris_salvadorii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psittaculirostris_salvadorii}}';
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
bibkey = 'JordSilv1991'; type = 'Article'; bib = [ ... 
'author = {R. Jordan and T. Silva}, ' ... 
'year = {1991}, ' ...
'title = {Breeding and rearing Salvadori''s fig parrot \emph{Psittaculirostris salvadorii} at {Loro Parque, Tenerife}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {30}, ' ...
'pages = {173-177}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Psittaculirostris_salvadorii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Psittaculirostris_salvadorii/}}';
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

