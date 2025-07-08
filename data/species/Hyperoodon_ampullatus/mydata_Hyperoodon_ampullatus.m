function [data, auxData, metaData, txtData, weights] = mydata_Hyperoodon_ampullatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Ziphiidae';
metaData.species    = 'Hyperoodon_ampullatus'; 
metaData.species_en = 'Northern bottlenose whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2017 05 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 05 27]; 

%% set data
% zero-variate data

data.tg = 365;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp taken from Monodon';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3652;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3287;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 37*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 325; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'noaa';
data.Lp = 685; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'ADW';
data.Lpm = 735; units.Lpm = 'cm'; label.Lpm = 'ultimate length for males'; bibkey.Lpm = 'ADW';
data.Lim = 980; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'ADW';

data.Wwb = 0.3e6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'noaa';
data.Wwim = 7.5e6; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'ADW';
  
data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'noaa';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki and ADW give 1 calf per yr';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3NR6Z'; % Cat of Life
metaData.links.id_ITIS = '180504'; % ITIS
metaData.links.id_EoL = '46559369'; % Ency of Life
metaData.links.id_Wiki = 'Hyperoodon_ampullatus'; % Wikipedia
metaData.links.id_ADW = 'Hyperoodon_ampullatus'; % ADW
metaData.links.id_Taxo = '68827'; % Taxonomicon
metaData.links.id_WoRMS = '343899'; % WoRMS
metaData.links.id_MSW3 = '14300153'; % MSW3
metaData.links.id_AnAge = 'Hyperoodon_ampullatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperoodon_ampullatus}}';
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
bibkey = 'Chri1973'; type = 'Article'; bib = [ ... 
'author = {Christensen, I.}, ' ... 
'year = {1973}, ' ...
'title = {Age determination , age distribution and growth of bottlenose whales, \emph{Hyperoodon ampullatus} ({F}orster), in the {L}abrador {S}ea}, ' ...
'journal = {Norwegian Journal of Zoology}, ' ...
'volume = {21}, ' ...
'number = {4}, ' ...
'pages = {331--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hyperoodon_ampullatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Hyperoodon_ampullatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'noaa'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fisheries.noaa.gov/pr/species/mammals/whales/northern-bottlenose-whale.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

