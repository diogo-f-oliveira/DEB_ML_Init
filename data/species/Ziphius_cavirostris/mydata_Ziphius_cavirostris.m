function [data, auxData, metaData, txtData, weights] = mydata_Ziphius_cavirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Ziphiidae';
metaData.species    = 'Ziphius_cavirostris'; 
metaData.species_en = 'Cuvier''s beaked whale'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 18];

%% set data
% zero-variate data

data.tg = 365;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'guess';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp taken from Monodon';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Hyperoodon_ampullatus';
data.am = 62*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 210; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Wiki';
  comment.Lb = '2-3 m';
data.Lp = 650; units.Lp = 'cm';   label.Lp = 'length at puberty'; bibkey.Lp = 'Wiki';
  comment.Lp = '5.8-7 m';
data.Li = 740; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'ADW';
  comment.Li = 'AWD gives 7 m. Value based on Hyperoodon_ampullatus: (3.25/7.50)^(1/3)*980';

data.Wwi = 3.25e6; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '2-3.5 ton';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Hyperoodon_ampullatus';
  
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5D5PZ'; % Cat of Life
metaData.links.id_ITIS = '180498'; % ITIS
metaData.links.id_EoL = '46559388'; % Ency of Life
metaData.links.id_Wiki = 'Ziphius_cavirostris'; % Wikipedia
metaData.links.id_ADW = 'Ziphius_cavirostris'; % ADW
metaData.links.id_Taxo = '68849'; % Taxonomicon
metaData.links.id_WoRMS = '137127'; % WoRMS
metaData.links.id_MSW3 = '14300175'; % MSW3
metaData.links.id_AnAge = 'Ziphius_cavirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ziphius_cavirostris}}';
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
'howpublished = {\url{http://animaldiversity.org/accounts/Ziphius_cavirostris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559383/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

