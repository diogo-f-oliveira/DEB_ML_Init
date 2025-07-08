function [data, auxData, metaData, txtData, weights] = mydata_Myotis_grisescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_grisescens'; 
metaData.species_en = 'Gray bat'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 09]; 


%% set data
% zero-variate data

data.tg = 65;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Wiki';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '60-70 d';
data.tx = 60;    units.tx = 'd';    label.tx = 'time siince birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 456 ;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.9 ; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 16;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'ADW';
  comment.Wwi = 'Wiki: 4 to 10 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight data 
data.tWw = [ ... time (d), weight (g)
0.000	7.855
9.492	8.611
19.603	8.613
28.854	9.122
39.214	9.296
54.595	9.156
65.210	9.540
80.501	10.623
92.541	11.409];
units.tWw  = {'d', 'g'};  label.tWw = {'time', ' wet weight'};  
temp.tWw   = C2K(35);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Tutt1976';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.tp = 50 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '8LZJ5'; % Cat of Life
metaData.links.id_ITIS = '179997'; % ITIS
metaData.links.id_EoL = '327255'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_grisescens'; % Wikipedia
metaData.links.id_ADW = 'Myotis_grisescens'; % ADW
metaData.links.id_Taxo = '168941'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802433'; % MSW3
metaData.links.id_AnAge = 'Myotis_grisescens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_grisescens}}';
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
bibkey = 'Tutt1976'; type = 'Article'; bib = [ ... 
'author = {Merlin D. Tuttle}, ' ... 
'year = {1976}, ' ...
'title = {Population Ecology of the Gray Bat (\emph{Myotis Grisescens}): Factors Influencing Growth and Survival of Newly Volant Young}, ' ...
'journal = {Mammalia}, ' ...
'volume = {57(3)}, ' ...
'pages = {587-595}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Myotis_grisescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Myotis_grisescens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

