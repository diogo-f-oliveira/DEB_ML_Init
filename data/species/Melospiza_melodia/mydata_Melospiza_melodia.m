function [data, auxData, metaData, txtData, weights] = mydata_Melospiza_melodia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Melospiza_melodia'; 
metaData.species_en = 'Song sparrow'; 

metaData.ecoCode.climate = {'BSk', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf','Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2022 08 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2022 11 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 12];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '13 to 15 d';
data.tx = 9;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SearPete2004';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 27;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.3*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.4;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SoggKern1991';
data.Wwi = 35;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 11.9 to 53 g ';

data.Ri  = 2.5*4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 clutches per yr, 3 to 5 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
3.000	8.866
4.200	12.431
6.000	16.147
8.100	19.412
10.200	18.288
12.400	19.302
14.000	21.629
16.100	23.994
18.100	26.021
20.000	24.370
22.300	23.734
24.400	23.172
26.100	21.971
28.000	21.072
30.100	20.472
32.000	20.023
34.000	20.024
36.100	19.612
38.200	19.650
40.000	19.951
42.000	19.577
60.100	20.222
84.000	21.996];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SearPete2004';
%
data.tW1 = [ ... % time since birth (d), weight (g)
    0  2.4
    1  3.7
    2  5.5
    3  7.8
    4 10.4
    5 13.0
    6 14.7
    7 15.9
    8 16.7
    9 17.4
   10 18.4
   11 18.8];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'}; 
temp.tW1    = [ ...
 0	28.939
 1	30.770
 2	31.951
 3	32.728
 4	33.878
 5	34.841
 6	35.247
 7	36.211
 8	37.081
 9	37.363
 10	37.149
 11	37.183];
units.temp.tW1 = {'d','C'}; label.temp.tW1 = 'cloacal temperature';
bibkey.tW1  = 'SoggKern1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
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
D2 = 'scaled functional response turned out to vary';
D3 = 'mod_1: tW1 data added with known body temperature as function of time';
D4 = 'mod_2: v reduced';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3ZN55'; % Cat of Life
metaData.links.id_ITIS = '179492'; % ITIS
metaData.links.id_EoL = '45511186'; % Ency of Life
metaData.links.id_Wiki = 'Melospiza_melodia'; % Wikipedia
metaData.links.id_ADW = 'Melospiza_melodia'; % ADW
metaData.links.id_Taxo = '58090'; % Taxonomicon
metaData.links.id_WoRMS = '1484482'; % WoRMS
metaData.links.id_avibase = 'A5F09E0521019564'; % avibase
metaData.links.id_birdlife = 'song-sparrow-melospiza-melodia'; % birdlife
metaData.links.id_AnAge = 'Melospiza_melodia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melospiza_melodia}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Melospiza_melodia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SearPete2004'; type = 'Article'; bib = [ ... 
'author = {Searcy, W. A. and Peters, S. and Nowicki, S.}, ' ... 
'year = {2004}, ' ...
'title = {Effects of early nutrition on growth rate and adult size in song sparrows \emph{Melospiza melodia}}, ' ...
'journal = {J. Avian Biol.}, ' ...
'volume = {35}, ' ...
'pages = {269--279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoggKern1991'; type = 'Article'; bib = [ ... 
'author = {Mark K. Sogge and Michael D. Kern and Robert Kern and Charles van Riper}, ' ... 
'year = {1991}, ' ...
'title = {Growth and Development of Thermoregulation in Nestling San Miguel Island Song Sparrows}, ' ...
'journal = {The Condor}, ' ...
'volume = {93(3)}, ' ...
'pages = {773-776}'];
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

