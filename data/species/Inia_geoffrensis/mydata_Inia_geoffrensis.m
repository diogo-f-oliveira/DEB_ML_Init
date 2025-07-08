function [data, auxData, metaData, txtData, weights] = mydata_Inia_geoffrensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Iniidae';
metaData.species    = 'Inia_geoffrensis'; 
metaData.species_en = 'Amazon river dolphin'; 

metaData.ecoCode.climate = {'Am','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 18];

%% set data
% zero-variate data

data.tg = 287;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp taken from Monodon';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1826;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 31.1*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 80; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Wiki';
data.Lp = 176; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'ADW';
  comment.Lp = '160-175 cm';
data.Lpm = 200; units.Lpm = 'cm';   label.Lpm = 'length at puberty for males'; bibkey.Lpm = 'ADW';
data.Li = 150; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Wiki';
data.Lim = 255; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'Wiki';

data.Wwb = 6800; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'AnAge';
data.Wwi = 84e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW gives 154 kg';
data.Wwim = 185e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = 'ADW gives 207 kg';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'calving interval 15-36 mnth';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp  only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3PQ9B'; % Cat of Life
metaData.links.id_ITIS = '180407'; % ITIS
metaData.links.id_EoL = '46559399'; % Ency of Life
metaData.links.id_Wiki = 'Inia_geoffrensis'; % Wikipedia
metaData.links.id_ADW = 'Inia_geoffrensis'; % ADW
metaData.links.id_Taxo = '68669'; % Taxonomicon
metaData.links.id_WoRMS = '254960'; % WoRMS
metaData.links.id_MSW3 = '14300138'; % MSW3
metaData.links.id_AnAge = 'Inia_geoffrensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Inia_geoffrensis}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Inia_geoffrensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559399/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ... 
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

