function [data, auxData, metaData, txtData, weights] = mydata_Acanthiza_inornata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Acanthizidae';
metaData.species    = 'Acanthiza_inornata'; 
metaData.species_en = 'Western thornbill'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2018 10 02];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};  

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'BrooBroo1989';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrooBroo1989';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 52.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for A.chrysorrhoa';

data.Wwb = 3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrooBroo1989';
data.Wwi = 21;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BrooBroo1989';
  comment.Wwi = 'BrooBroo1989 gives 7 g, but this is inconsistent with tW data';

data.Ri  = 2*3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BrooBroo1989';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 egg per clutch, 2 clutches per yr assumed';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.500	3.769
1.513	5.390
2.632	7.063
3.541	8.841
4.558	11.036
5.684	13.753
6.701	15.844
7.719	18.143
8.620	18.772
9.796	21.124
10.648	22.275
11.649	22.069
12.709	22.646
13.707	21.970
14.866	21.712];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BrooBroo1989';

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
D1 = 'mod_1: v is reduced and food availability taken variable for tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '64D2P'; % Cat of Life
metaData.links.id_ITIS = '558375'; % ITIS
metaData.links.id_EoL = '45518128'; % Ency of Life
metaData.links.id_Wiki = 'Acanthiza_inornata'; % Wikipedia
metaData.links.id_ADW = 'Acanthiza_inornata'; % ADW
metaData.links.id_Taxo = '85359'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '6601168A1B3CCECF'; % avibase
metaData.links.id_birdlife = 'western-thornbill-acanthiza-inornata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthiza_inornata}}';
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
'title = {The comparative breeding behaviour of two sympatric cuckoos, {H}orsfield''s Bronze?Cuckoo \emph{Chrysococcyx basalis} and the Shining Bronze?Cuckoo \emph{C. lucidus}, in {W}estern {A}ustralia: a new model for the evolution of egg morphology and host specificity in avian brood parasites}, ' ...
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

