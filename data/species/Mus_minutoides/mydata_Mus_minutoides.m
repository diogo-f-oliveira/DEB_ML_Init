function [data, auxData, metaData, txtData, weights] = mydata_Mus_minutoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mus_minutoides'; 
metaData.species_en = 'African pygmy mouse'; 

metaData.ecoCode.climate = {'Aw','BSk','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 18]; 

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.97; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwx = 3.3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';          bibkey.Wwx = 'AnAge';
data.Wwi = 7.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'AnAge';

data.Ri  = 4*4.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.3 pups per litter; 4 litters per yr assumed';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (wk), weight (g)
0.027	0.761
0.593	0.916
0.840	1.151
0.975	1.413
1.259	1.582
1.434	2.172
1.661	2.302
2.010	3.233
2.351	3.441
2.747	3.610
3.393	4.184
3.887	4.601
5.010	5.856
5.937	6.337
7.025	6.108
8.077	6.023
9.319	6.043
10.260	6.077
11.841	6.239];
data.tW(:,1) = 7 * data.tW(:,1); % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'WillMees1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VW9Y'; % Cat of Life
metaData.links.id_ITIS = '585393'; % ITIS
metaData.links.id_EoL = '1179241'; % Ency of Life
metaData.links.id_Wiki = 'Mus_minutoides'; % Wikipedia
metaData.links.id_ADW = 'Mus_minutoides'; % ADW
metaData.links.id_Taxo = '63056'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001560'; % MSW3
metaData.links.id_AnAge = 'Mus_minutoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mus_minutoides}}';
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
bibkey = 'WillMees1978'; type = 'Article'; bib = [ ... 
'author = {Willan, K. and D. J. Meester}, ' ... 
'year = {1978}, ' ...
'title = {Breeding biology and postnatal development of the {A}frican dwarf mouse}, ' ...
'journal = {Acta Theriol.}, ' ...
'volume = {23}, ' ...
'pages = {55-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mus_minutoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

