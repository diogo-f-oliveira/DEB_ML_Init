function [data, auxData, metaData, txtData, weights] = mydata_Manis_crassicaudata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Manis_crassicaudata'; 
metaData.species_en = 'Indian pangolin'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lx'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 09 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.tg = 67;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(33.4);  units.temp.tg = 'K'; label.temp.th = 'temperature';
  comment.tg = 'Wiki: 65 - 70 d; temp from AnAge';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(33.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'savepangolins';
  temp.tp = C2K(33.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(33.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lx  = 45;    units.Lx  = 'cm';  label.Lx  = 'total length at weaning'; bibkey.Lx  = 'guess';
   comment.Lx = 'wild guess from photo of back-riding young';
data.Li  = 52+40; units.Li  = 'cm';  label.Li  = 'ultimate head-body + tail length'; bibkey.Li  = 'Wiki';
   comment.Li = 'Wiki: 51-55 + 33-47 cm';
   
data.Wwb = 350;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki: 235-400 g';
data.Wwi = 13015; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'from female';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'savepangolins: 2 and 3 young have been reported';
   
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

%% Links
metaData.links.id_CoL = '7VRV7'; % Cat of Life
metaData.links.id_ITIS = '584928'; % ITIS
metaData.links.id_EoL = '982442'; % Ency of Life
metaData.links.id_Wiki = 'Manis_crassicaudata'; % Wikipedia
metaData.links.id_ADW = 'Manis_crassicaudata'; % ADW
metaData.links.id_Taxo = '168633'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13900009'; % MSW3
metaData.links.id_AnAge = 'Manis_crassicaudata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Manis_crassicaudata}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Manis_crassicaudata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Manis_crassicaudata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'savepangolins'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.savepangolins.org/what-is-a-pangolin/#Reproduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

