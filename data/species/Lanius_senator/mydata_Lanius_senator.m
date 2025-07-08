function [data, auxData, metaData, txtData, weights] = mydata_Lanius_senator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Laniidae';
metaData.species    = 'Lanius_senator'; 
metaData.species_en = 'Woodchat shrike'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCva', 'biCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 15.7;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'BrahDzir2003';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'mean egg temp is guessed';
data.tx = 13;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrahDzir2003';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 39;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5.7*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BrahDzir2003';
data.Wwi = 36;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4.9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'BrahDzir2003';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch; 4 clutches per yr';
  
% uni-variate data

% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.958	4.092
0.986	3.347
1.000	5.457
1.001	2.788
1.972	7.252
1.973	6.632
1.974	4.956
2.988	7.124
2.989	5.511
3.002	7.745
3.003	6.193
3.017	6.628
3.947	10.409
3.962	7.182
3.976	8.547
4.960	16.487
4.964	8.295
4.990	12.639
5.962	14.435
5.963	13.876
5.975	20.454
5.976	17.289
5.977	16.482
5.978	15.800
5.979	15.365
6.962	20.946
6.975	23.801
6.991	19.147
6.992	18.154
6.993	17.347
7.992	22.556
7.993	20.942
8.004	26.651
8.006	21.687
8.007	18.832
8.019	23.548
8.020	22.866
8.991	27.020
8.992	26.027
8.993	25.406
9.006	28.012
9.992	28.567
9.993	28.132
9.994	26.209
10.008	25.216
10.009	23.292
10.995	28.749
10.996	26.080
10.997	24.839
10.998	23.598
10.999	23.226
11.984	26.138
11.997	28.248
11.998	27.566
12.010	29.986
12.970	29.858
12.997	32.154
12.999	27.375
13.000	26.755];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
bibkey.tW = 'BrahDzir2003';
  
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
D2 = 'mod_1: v is reduced; food availability is taken variable in tW data';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3S7C6'; % Cat of Life
metaData.links.id_ITIS = '560732'; % ITIS
metaData.links.id_EoL = '45513635'; % Ency of Life
metaData.links.id_Wiki = 'Lanius_senator'; % Wikipedia
metaData.links.id_ADW = 'Lanius_senator'; % ADW
metaData.links.id_Taxo = '56645'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7E70D490A6476D16'; % avibase
metaData.links.id_birdlife = 'woodchat-shrike-lanius-senator'; % birdlife
metaData.links.id_AnAge = 'Lanius_senator'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lanius_senator}}';
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
bibkey = 'BrahDzir2003'; type = 'Article'; bib = [ ... 
'author = {Z. Brahimia and H. Dziri and S. Benyacoub and Y. Chabi and J. Babura}, ' ... 
'year = {2003}, ' ...
'title = {Breeding ecology of {A}lgerian woodchat shrikes \emph{Lanius senator}: low breeding success}, ' ...
'journal = {Folia Zool.}, ' ...
'volume = {52}, ' ...
'pages = {309-316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lanius_senator}}';
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

