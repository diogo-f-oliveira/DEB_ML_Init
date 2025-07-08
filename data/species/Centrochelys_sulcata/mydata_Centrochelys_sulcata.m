function [data, auxData, metaData, txtData, weights] = mydata_Centrochelys_sulcata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Centrochelys_sulcata'; 
metaData.species_en = 'African spurred tortoise'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 29];

%% set data
% zero-variate data

data.tp = 5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female';      bibkey.tp = 'RitzGrieb2010';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'given growth conditions at in tW data';
data.am = 70*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'RitzGrieb2010';
  comment.Wwb = '50 to 110 g; AWD give less than 25 g';
data.Wwi = 105e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'Wiki';

data.Ri  = 23/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15 to 30 eggs per clutch';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (kg)
0.000	0.221
0.870	0.332
1.088	0.332
1.306	0.332
1.464	1.107
1.721	1.328
1.741	0.111
2.255	0.775
2.275	2.103
2.473	1.218
2.552	1.661
2.671	2.435
2.849	6.531
2.888	2.325
3.145	4.760
3.225	7.528
3.264	2.989
3.462	6.531
3.541	7.860
3.699	5.092
3.719	11.845
3.838	10.849
4.431	18.044
5.697	15.166
5.697	25.129
6.014	14.945
6.034	23.911
6.449	16.716
6.449	29.114
6.489	26.790
6.746	18.044
6.805	29.004
7.102	29.889
7.359	20.037
7.359	31.993
8.981	36.089
9.377	37.085
9.397	31.882
10.623	38.856
10.940	41.956
10.999	39.963
11.039	31.993
11.632	43.284
11.949	44.945
11.968	41.070
11.988	38.856
12.502	45.055
13.531	43.727
13.571	45.166
13.907	45.941
13.907	47.048
13.927	45.055
14.500	49.041
14.520	46.937
14.540	45.055
14.876	47.159
14.896	46.052
15.470	47.159
15.470	43.948
16.815	49.926
16.855	48.930
17.290	53.579
17.448	52.140
17.448	54.022];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
data.tW(:,2) = data.tW(:,2) * 1e3; % convert kg to g
units.tW   = {'d', 'cm'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RitzGrieb2010';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW =  5 * weights.tW;
weights.Wwi =  3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'RitzGrieb2010 repotted that von Bertalanffy did not fit, but this entry shows otherwise';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'females often somewhat larger than males';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'S9KW'; % Cat of Life
metaData.links.id_ITIS = '949761'; % ITIS
metaData.links.id_EoL = '47364902'; % Ency of Life
metaData.links.id_Wiki = 'Centrochelys_sulcata'; % Wikipedia
metaData.links.id_ADW = 'Centrochelys_sulcata'; % ADW
metaData.links.id_Taxo = '1685694'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Centrochelys&species=sulcata'; % ReptileDB
metaData.links.id_AnAge = 'Centrochelys_sulcata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centrochelys_sulcata}}';
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
bibkey = 'RitzGrieb2010'; type = 'Article'; bib = [ ... 
'author = {Julia Ritz and Eva Maria Griebeler and Ruth Huber and Marcus Clauss}, ' ... 
'year = {2010}, ' ...
'title = {Body size development of captive and free-ranging {A}frican spurred tortoises (\emph{Geochelone sulcata}): high plasticity in reptilian growth rates}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {20}, ' ...
'pages = {213-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Geochelone_sulcata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Centrochelys_sulcata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

