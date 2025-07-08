function [data, auxData, metaData, txtData, weights] = mydata_Tauraco_erythrolophus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Musophagiformes'; 
metaData.family     = 'Musophagidae';
metaData.species    = 'Tauraco_erythrolophus'; 
metaData.species_en = 'Red-crested turaco'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3  = {'Bas Kooijman'};    
metaData.date_mod_3    = [2022 11 18];              
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3 = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 25];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 24;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Peat2007';   
  temp.ab = C2K(37.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Turacos2012';
data.tx = 31.5;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Peat2007';   
  temp.tx = C2K(41.3);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 94.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 340;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Peat2007';
  temp.tR = C2K(41.3);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9855;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Peat2007';   
  temp.am = C2K(41.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 48.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SeaWorld';

data.Wwb = 15;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Peat2007';
data.Wwi = 267.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Peat2007';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Peat2007';   
  temp.Ri = C2K(41.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 15.94496388;
2	15.5104961;
3	17.24836721;
4	18.69659313;
5	19.71035128;
6	20.43446424;
7	20.65169813;
8	21.52063368;
9	24.56190812;
10	25.72048886;
11	27.38594867;
12	30.86169089;
13	33.25126366;
14	37.52353014;
15	39.76828032;
16	47.22664382;
17	53.2367814;
18	57.36422528;
19	65.25705657;
20	67.42939545;
21	67.79145193;
22	67.93627452;
23	67.93627452;
24	73.22229914;
25	75.82910581;
26	80.53584006;
27	83.28746931;
28	82.12888857;
29	80.82548524;
30	81.18754172;
31	82.41853376;
32	84.66328394;
33	84.66328394;
34	87.99420356;
35	93.13540559;
36	103.2005758;
37	100.2317126];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Peat2007';
  
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

%% Links
metaData.links.id_CoL = '54Z7P'; % Cat of Life
metaData.links.id_ITIS = '555332'; % ITIS
metaData.links.id_EoL = '45513996'; % Ency of Life
metaData.links.id_Wiki = 'Tauraco_erythrolophus'; % Wikipedia
metaData.links.id_ADW = 'Tauraco_erythrolophus'; % ADW
metaData.links.id_Taxo = '54466'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '91187A5248462828'; % avibase
metaData.links.id_birdlife = 'red-crested-turaco-tauraco-erythrolophus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% Discussion points
D1 = 'mod_3: v is reduced';
D2 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tauraco_erythrolophus}}';
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
bibkey = 'Peat2007'; type = 'Techreport'; bib = [ ... 
'author = {Peat, L.}, ' ... 
'year = {2007}, ' ...
'title = {Husbandry Guidelines Red-crested Turaco \emph{Tauraco erythrolophus}}, ' ...
'institution = {Cotswold Wildlife Park and Gardens, Burford.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeaWorld'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seaworld.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Turacos2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.turacos.co.uk/}}';
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

