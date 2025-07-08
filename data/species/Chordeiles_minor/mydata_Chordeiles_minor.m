function [data, auxData, metaData, txtData, weights] = mydata_Chordeiles_minor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Caprimulgiformes'; 
metaData.family     = 'Caprimulgidae';
metaData.species    = 'Chordeiles_minor'; 
metaData.species_en = 'Common nighthawk'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap';  'aR'; 'am';'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'tTemperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. emps from KuehGood1990 and BechNico1999';
data.tx = 18;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'EoL';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 54;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 350;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(39.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KramChal2012';
data.Wwi = 84; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MeriMeri1979';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.761	39.882
6.857	80.171
13.626	84.547
35.166	83.614];
data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % set origin 
units.tW  = {'d', 'g'}; label.tW = {'time', 'wet weight'};  
temp.tW   = C2K(39.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MeriMeri1979';
comment.tW = 'hand-raised';
%
data.tW1 = [ ... % time since hatch (d), weight (g)
0.081	5.489
0.082	5.988
0.974	5.829
1.028	6.329
1.922	4.839
1.949	6.170
2.030	6.836
2.057	7.668
2.977	8.507
2.978	10.669
2.979	11.335
2.980	12.499
3.951	15.334
4.005	13.672
4.980	18.503
4.981	20.998
5.034	14.678
5.035	15.343
5.954	15.684
5.955	20.673
5.956	21.338
5.981	18.345
5.982	19.010
5.983	23.335
6.008	22.171
6.928	30.494
6.955	26.336
7.009	22.512
7.037	21.181
7.930	25.014
7.931	29.172
7.957	30.503
7.958	31.501
7.984	27.010
7.985	27.676
8.904	36.332
8.931	37.330
8.958	27.351
8.959	29.181
8.960	30.345
9.932	32.182
9.933	35.841
9.934	39.999
9.959	37.172
10.014	41.331
10.934	47.326
10.961	38.677
10.962	40.840
10.988	42.669
11.935	47.168
11.936	47.999
11.962	48.998
11.963	55.151
11.989	39.850
12.963	54.328
13.938	59.991
14.885	60.664
16.888	70.161];
units.tW1  = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(39.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'KramChal2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;

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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5YB2W'; % Cat of Life
metaData.links.id_ITIS = '177979'; % ITIS
metaData.links.id_EoL = '45509451'; % Ency of Life
metaData.links.id_Wiki = 'Chordeiles_minor'; % Wikipedia
metaData.links.id_ADW = 'Chordeiles_minor'; % ADW
metaData.links.id_Taxo = '54809'; % Taxonomicon
metaData.links.id_WoRMS = '422612'; % WoRMS
metaData.links.id_avibase = '24E39ACD5692DA4A'; % avibase
metaData.links.id_birdlife = 'common-nighthawk-chordeiles-minor'; % birdlife
metaData.links.id_AnAge = 'Chordeiles_minor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chordeiles_minor}}';
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
bibkey = 'MeriMeri1979'; type = 'Article'; bib = [ ... 
'author = {Meritt, G. F. and Meritt, D. A.}, ' ... 
'doi = {10.1111/j.1748-1090.1979.tb00575.x}, ' ...
'year = {1979}, ' ...
'title = {Hand-rearing and nutrition of nestling nighthawks \emph{Chordeiles minor}}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {19}, ' ...
'number = {1}, '...
'pages = {256-257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KramChal2012'; type = 'Article'; bib = [ ... 
'author = {G. R. Kramer and A. D. Chalfoun}, ' ... 
'doi = {10.1676/1559-4491-124.4.793}, ' ...
'year = {2012}, ' ...
'title = {Growth Rate and Relocation Movements of Common Nighthawk (\emph{Chordeiles minor}) Nestlings in Relation to Age}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {124}, ' ...
'number = {4}, '...
'pages = {793-797}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chordeiles_minor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/915489/details}}';
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

