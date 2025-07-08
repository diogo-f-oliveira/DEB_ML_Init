function [data, auxData, metaData, txtData, weights] = mydata_Ovis_ammon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Ovis_ammon'; 
metaData.species_en = 'Argali'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 10]; 

%% set data
% zero-variate data

data.tg = 160;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 135;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 403;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 823; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(38.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.4e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'AnAge';
data.Wwi = 70e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '43.2 to 100 kg';
data.Wwim = 126e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  
data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 2 litters per yr';

% univariate data
% time-weight
data.tW = [ ... % time (d), female body weight (g)
 2 3950
 3 4100
 4 4200
 5 4450
 6 4550
 7 5000
 8 5500
 9 5750
10 6000
12 6100
14 6250
15 6250
16 6350
17 6400];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(37.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KeepStaf1966';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.tW(end) = 5 * weights.tW(end);
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6TDD6'; % Cat of Life
metaData.links.id_ITIS = '625153'; % ITIS
metaData.links.id_EoL = '328677'; % Ency of Life
metaData.links.id_Wiki = 'Ovis_ammon'; % Wikipedia
metaData.links.id_ADW = 'Ovis_ammon'; % ADW
metaData.links.id_Taxo = '68593'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200815'; % MSW3
metaData.links.id_AnAge = 'Ovis_ammon'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ovis_ammon}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ovis_ammon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeepStaf1966'; type = 'Article'; bib = [ ... 
'author = {Keeper, H. and Staff, J. L.}, ' ... 
'doi = {10.1111/j.1748-1090.1966.tb01703.x}, ' ...
'year = {1966}, ' ...
'title = {A NOTE ON THE BREEDING AND HAND-REARING OF A {M}ARCO {P}OLO SHEEP \emph{Ovis ammon poli} AT {L}ONDON {Z}OO}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {6}, ' ...
'pages = {90-93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

