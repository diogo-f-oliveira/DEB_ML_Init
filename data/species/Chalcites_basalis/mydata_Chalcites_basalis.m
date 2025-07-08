function [data, auxData, metaData, txtData, weights] = mydata_Chalcites_basalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cuculiformes'; 
metaData.family     = 'Cuculidae';
metaData.species    = 'Chalcites_basalis'; 
metaData.species_en = 'Horsfield''s bronze cuckoo'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Cfc'};
metaData.ecoCode.ecozone = {'TA', 'TAt'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpo'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2018 10 01];              
metaData.email  = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 12;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'BrooBroo1989';   
  temp.ab = C2K(36.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrooBroo1989';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 51;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 


data.Wwb = 1.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrooBroo1989';
data.Wwi = 20;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BrooBroo1989';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per host nest';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.482	1.357
1.536	2.140
2.485	2.819
3.604	5.429
4.608	6.369
5.565	8.352
6.574	10.127
7.534	12.476
8.495	14.930
9.604	15.974
10.621	19.002
11.670	19.002
12.520	20.568
13.664	18.949
14.460	20.307
15.659	19.002
16.504	19.837];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BrooBroo1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed and lower just after hatching';
D2 = 'mod_1: v is reduced, food availability in tW data taken variable';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Brood parasite for Splendid Fairy-wrens Malurus splendens, Yellow-rumped Thornbills Acanthiza chrysorrhoa (major hosts), Western Thornbills A. inornata and Scarlet Robins Petroica multicolor';
metaData.bibkey.F1 = {'BrooBroo1989'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YNLR'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '554704'; % ITIS
metaData.links.id_EoL = '45517822'; % Ency of Life
metaData.links.id_Wiki = 'Chrysococcyx_basalis'; % Wikipedia
metaData.links.id_ADW = 'Chrysococcyx_basalis'; % ADW
metaData.links.id_Taxo = '54492'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '91248B47E0E2F515'; % Avibase
metaData.links.id_birdlife = 'horsfields-bronze-cuckoo-chalcites-basalis'; % Birdlife

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysococcyx_basalis}}';
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
bibkey = 'BrooBroo1989'; type = 'Article'; bib = [ ... 
'author = {M. G. Brooker and L. C. Brooker}, ' ... 
'doi = {10.1111/j.1474-919X.1989.tb04789.x}, ' ...
'year = {1989}, ' ...
'title = {The comparative breeding behaviour of two sympatric cuckoos, {H}orsfield''s Bronze Cuckoo \emph{Chrysococcyx basalis} and the Shining Bronze Cuckoo \emph{C. lucidus}, in {W}estern {A}ustralia: a new model for the evolution of egg morphology and host specificity in avian brood parasites}, ' ...
'journal = {Ibis}, ' ...
'volume = {131}, ' ...
'pages = {528-547}'];
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

