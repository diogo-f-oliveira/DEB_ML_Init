function [data, auxData, metaData, txtData, weights] = mydata_Phataginus_tricuspis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Phataginus_tricuspis'; 
metaData.species_en = 'White-bellied pangolin'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Lb','Li','Wwb', 'Wwp','Wwi','Ri','JOp'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2021 12 17];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, FRAM center, Tromso'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 12 17]; 

%% set data
% zero-variate data

data.tg = 140;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'JansSode2020';   
  temp.tg = metaData.T_typical;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '140-209 d is a range. Authors think embryonic diapause is important in pangolins explaining variation in gestation times.';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'age at weaning'; bibkey.tx = 'JansSode2020';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '3-5 months, uppler limit 6 months';
data.tp = 18 * 30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JansSode2020';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'estimated by authors';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'JansSode2020';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'oldest recorded ind from San Diego zoo.';
  
data.Lb = 29; units.Lb = 'cm';   label.Lb = 'length at borth';     bibkey.Lb = 'JansSode2020';
data.Li = 100; units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'JansSode2020';
  
data.Wwb = 100;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JansSode2020';
data.Wwp = 1e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'SodeAdef2002';
data.Wwi = 3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JansSode2020';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'JansSode2020';   
  temp.Ri = metaData.T_typical;  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Females can get pregnant right after birth. I estimate 2 per year based on almost 6 months gestation time.';

data.jO  = 202.2; units.jO  = 'ml/h.kg'; label.jO  = 'specific O2 consumption rate';  bibkey.jO  = 'JansSode2020';   
  temp.jO = C2K(33.4);  units.temp.jO = 'K'; label.temp.jO = 'temperature';
  comment.jO = 'resting metabolic rate; (Hildwein, 1974; Jones, 1973) in JansSode2020';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;
weights.jO = 0.5 * weights.jO;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VRVC'; % Cat of Life
metaData.links.id_ITIS = '584934'; % ITIS
metaData.links.id_EoL = '47365126'; % Ency of Life
metaData.links.id_Wiki = 'Phataginus_tricuspis'; % Wikipedia
metaData.links.id_ADW = 'Manis_tricuspis'; % ADW
metaData.links.id_Taxo = '93403'; % Taxonomicon
metaData.links.id_MSW3 = '13900019'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Phataginus_tricuspis}}';
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
bibkey = 'JansSode2020'; type = 'Incollection'; bib = [ ... 
'author = {Raymond Jansen and Olufemi Sodeinde and Durojaye Soewu and Darren W. Pietersen and Daniel Alempijevic and and Daniel J. Ingram}, ' ... 
'doi = {10.1016/B978-0-12-815507-3.00009-5}, ' ...
'year = {2020}, ' ...
'title = {White-bellied pangolin \emph{Phataginus tricuspis} ({R}afinesque, 1820)}, ' ...
'booktitle = {Pangolins: Science, Society and Conservation}, ' ...
'pages = {139--156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SodeAdef2002'; type = 'Article'; bib = [ ... 
'author = {Sodeinde, O. A. and Adefuke A. A. and Balogun, O. F.}, ' ... 
'journal = {Global Journal of Pure and Applied Sciences}, ' ...
'year = {2002}, ' ...
'volume = {8}, ' ...
'number = {1}, ' ...
'title = {Morphometric analysis of \emph{Manis tricuspis} ({P}holodita-{M}ammalia) from {S}outh-{W}estern {N}igeria}, ' ...
'pages = {7--13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Manis_tricuspis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
