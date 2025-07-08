function [data, auxData, metaData, txtData, weights] = mydata_Correlophus_ciliatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Diplodactylidae';
metaData.species    = 'Correlophus_ciliatus'; 
metaData.species_en = 'Crested gecko'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 19];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'time at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '60-150 d';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(29); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 17.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(29); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '15-20 yrs';

data.Li  = 25;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';  

data.Wwb = 1.25;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'thepetenthusiast';
data.Wwi = 42;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = '50 to 70 g';

data.Ri  = 9/12*2/35;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(29);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per clutch, 4-6 weeks between  clutches during breeding cycle of 8-10 mnth';

% univariate data
% time -  length data
data.tW = [ ... % time since birth (d),  wet weight (g) 
1.421	1.251
60.365	3.217
125.622	5.183
190.921	9.740
244.278	13.047
281.530	17.962
318.082	22.877
366.576	29.043
396.768	31.098
461.324	33.153
519.566	35.030
579.915	37.085];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(29);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'thepetenthusiast';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'females can be produced at  cool (26-29 C) and very warm  (34-35 C) temperatures; males at intermediate temperatures (31-33 C).';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YHKB'; % Cat of Life
metaData.links.id_ITIS = '819196'; % ITIS
metaData.links.id_EoL = '1055419'; % Ency of Life
metaData.links.id_Wiki = 'Correlophus_ciliatus'; % Wikipedia
metaData.links.id_ADW = 'Rhacodactylus_ciliatus'; % ADW
metaData.links.id_Taxo = '3808935'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Correlophus&species=ciliatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Correlophus_ciliatus}}';
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
bibkey = 'thepetenthusiast'; type = 'Misc'; bib = ...
'howpublished = {\url{https://thepetenthusiast.com/category/reptile/crested-gecko/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Rhacodactylus_ciliatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
