function [data, auxData, metaData, txtData, weights] = mydata_Orcaella_brevirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Orcaella_brevirostris'; 
metaData.species_en = 'Irrawaddy dolphin'; 

metaData.ecoCode.climate = {'A','MA'};
metaData.ecoCode.ecozone = {'TPi','MIN'};
metaData.ecoCode.habitat = {'0iFr','OiMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2023 08 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 19];

%% set data
% zero-variate data

data.tg = 426;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW: 6-12 mnth';
data.tx = 471;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1826;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 7-9 yrs';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Probably an underestimate';

data.Lb = 100; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'Wiki';
data.Li = 275; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'Wiki';

data.Wwb = 12.3e3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'AnAge','ADW'};
  comment.Wwb = 'Wiki: 10 kg';
data.Wwx = 45e3; units.Wwx = 'g'; label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 190e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 90-200 kg';
  
data.Ri  = 1/365/2.5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'calving interval 2-3 yr?';
      
%% set weights for all real data
weights = setweights(data, []);

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

%% Facts
F1 = 'Males tend to be larger than females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74TDH'; % Cat of Life
metaData.links.id_ITIS = '180471'; % ITIS
metaData.links.id_EoL = '46559300'; % Ency of Life
metaData.links.id_Wiki = 'Orcaella_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Orcaella_brevirostris'; % ADW
metaData.links.id_Taxo = '68774'; % Taxonomicon
metaData.links.id_WoRMS = '148732'; % WoRMS
metaData.links.id_MSW3 = '14300072'; % MSW3
metaData.links.id_AnAge = 'Orcaella_brevirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orcaella_brevirostris}}';
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
'howpublished = {\url{http://animaldiversity.org/accounts/Orcaella_brevirostris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Orcaella_brevirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carw1995'; type = 'Book'; bib = [ ... 
'author = {Mark Carwardine}, ' ...
'year = {1995}, ' ...
'title  = {Whales, dolphins and porpoises}, ' ...
'publisher = {Dorling Kindersley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

