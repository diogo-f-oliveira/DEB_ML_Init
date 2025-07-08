function [data, auxData, metaData, txtData, weights] = mydata_Sporophila_beltoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Sporophila_beltoni'; 
metaData.species_en = 'Tropeiro seedeater'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'RepeFont2016';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RepeFont2016';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 30;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'RepeFont2016';
data.Wwi = 10;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RepeFont2016';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'RepeFont2016';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch; 1 clutches per yr';

% uni-variate data

% toime-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.002	1.475
0.002	1.274
0.002	1.140
1.010	2.011
1.010	1.944
1.969	3.061
1.970	2.816
1.970	2.503
1.971	2.190
3.000	3.307
3.000	2.905
3.000	2.704
3.050	4.402
3.051	4.201
3.069	3.642
3.976	4.827
3.992	5.251
3.993	5.006
3.994	4.089
4.011	4.559
4.011	4.291
4.012	3.933
4.950	7.307
4.951	7.039
4.951	6.793
4.951	6.503
4.952	6.279
4.952	6.034
4.952	5.810
4.971	5.274
4.971	5.028
5.945	8.089
5.946	7.084
5.946	6.927
5.963	7.687
5.979	8.536
5.979	8.313
5.981	7.419
6.885	9.721
6.905	8.469
6.921	8.983
6.923	7.777
6.924	7.598
6.924	7.307
7.934	9.117
7.935	8.760
7.935	8.425
7.936	8.022
7.954	7.687
7.969	9.676
8.858	10.637
8.877	9.654
8.877	9.408
8.877	9.207
8.896	8.358
8.896	8.246
8.897	8.045
9.960	9.743
9.960	9.564
9.960	9.475
9.960	9.296
9.962	7.955
9.978	9.095
9.979	8.804
9.979	8.581
9.979	8.179
10.920	9.944
10.920	9.788
10.920	9.676
10.921	9.609
10.921	9.587
10.938	9.497
10.939	9.184
11.933	10.078
11.933	9.743
11.986	9.475];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-2;end;end
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RepeFont2016';
  
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
D1 = 'Food is varying';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4ZD3D'; % Cat of Life
metaData.links.id_ITIS = '997772'; % ITIS
metaData.links.id_EoL = '39632523'; % Ency of Life
metaData.links.id_Wiki = 'Sporophila_beltoni'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5678397'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '8C17A126452E9B87'; % avibase
metaData.links.id_birdlife = 'tropeiro-seedeater-sporophila-beltoni'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sporophila_beltoni}}';
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
bibkey = 'RepeFont2016'; type = 'Article'; bib = [ ... 
'author = {M. Repenning and C. S. Fontana}, ' ... 
'doi = {10.1642/AUK-15-226.1}, ' ...
'year = {2016}, ' ...
'title = {Breeding biology of the Tropeiro Seedeater (\emph{Sporophila beltoni})}, ' ...
'journal = {The Auk}, ' ...
'volume = {133}, ' ...
'pages = {484-496}'];
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

