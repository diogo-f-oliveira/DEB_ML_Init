function [data, auxData, metaData, txtData, weights] = mydata_Feresa_attenuata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Feresa_attenuata'; 
metaData.species_en = 'Pygmy killer whale'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'OiMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 20];

%% set data
% zero-variate data

data.tg = 300;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'guess';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 10*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';   
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'ADW: at least 21 yrs';

data.Lb = 80; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'ADW';
  comment.Lb = '1.1-1.5 cm';
data.Lp = 220; units.Lp = 'cm';   label.Lp = 'length at puberty'; bibkey.Lp = 'ADW';
  comment.Lp = '2.16 m for males, 2.21 m for females';
data.Li = 260; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'ADW';

data.Wwb = 5e3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi';
data.Wwi = 170e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'ADW';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guessed calving interval 2 yr';
      
%% set weights for all real data
weights = setweights(data, []);
%weights.tg = 3 * weights.tg;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

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
metaData.links.id_CoL = '3DYJD'; % Cat of Life
metaData.links.id_ITIS = '180461'; % ITIS
metaData.links.id_EoL = '46559253'; % Ency of Life
metaData.links.id_Wiki = 'Feresa_attenuata'; % Wikipedia
metaData.links.id_ADW = 'Feresa_attenuata'; % ADW
metaData.links.id_Taxo = '68763'; % Taxonomicon
metaData.links.id_WoRMS = '137095'; % WoRMS
metaData.links.id_MSW3 = '14300049'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Feresa_attenuata}}';
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
'howpublished = {\url{http://animaldiversity.org/accounts/Feresa_attenuata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

