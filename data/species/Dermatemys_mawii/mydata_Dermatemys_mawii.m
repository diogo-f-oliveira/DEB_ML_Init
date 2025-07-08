function [data, auxData, metaData, txtData, weights] = mydata_Dermatemys_mawii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Dermatemydidae';
metaData.species    = 'Dermatemys_mawii'; 
metaData.species_en = 'Central American river turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ww_t'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 07];

%% set data
% zero-variate data

data.ab = 217;       units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'encyclopedia';
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7*365;       units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on growth data below';
data.am = 11.3*365;  units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 5.28; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                 bibkey.Lb = 'LeglVogt2013';
data.Lp = 41; units.Lp = 'cm';  label.Lp = 'carapace length at puberty for females';     bibkey.Lp = 'LeglVogt2013';
  comment.Lp = '39.5-42.0 cm';
data.Lpm = 37.5; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'LeglVogt2013';
  comment.Lpm = '36.5-38.5 cm';
data.Li = 65; units.Li = 'cm';   label.Li = 'ultimate carapace length';                    bibkey.Li = 'LeglVogt2013';
data.L365 = 14.7; units.L365 = 'cm'; label.L365 = 'carapace length at 1 yr after birth';   bibkey.L365 = 'LeglVogt2013';
data.L3_1 = 34; units.L3_1 = 'cm'; label.L3_1 = 'carapace length at 3 yr after L = 30 cm'; bibkey.L3_1 = 'LeglVogt2013';
data.L3_2 = 38; units.L3_2 = 'cm'; label.L3_2 = 'carapace length at 3 yr after L = 34 cm'; bibkey.L3_2 = 'LeglVogt2013';
data.L3_3 = 42; units.L3_3 = 'cm'; label.L3_3 = 'carapace length at 3 yr after L = 34 cm'; bibkey.L3_3 = 'LeglVogt2013';

data.Wwb = 31.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                     bibkey.Wwb = 'encyclopedia';
  comment.Wwb = '34-70 g';
data.Wwp = 10600; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'encyclopedia';
data.Wwpm = 9600; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';       bibkey.Wwpm = 'encyclopedia';
data.Wwi = 22000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                    bibkey.Wwi = 'Wiki';
data.Ww365 = 475; units.Ww365 = 'g'; label.Ww365 = 'wet weight at 1 yr after birth';       bibkey.Ww365 = 'LeglVogt2013';
data.Ww3_1 = 2300; units.Ww3_1 = 'g';label.Ww3_1 = 'wet weight at 3 yr after Ww = 800 g';  bibkey.Ww3_1 = 'LeglVogt2013';
data.Ww3_2 = 6000; units.Ww3_2 = 'g';label.Ww3_2 = 'wet weight at 3 yr after Ww = 3200 g'; bibkey.Ww3_2 = 'LeglVogt2013';
data.Ww3_3 = 8400; units.Ww3_3 = 'g';label.Ww3_3 = 'wet weight at 3 yr after Ww = 5200 g'; bibkey.Ww3_3 = 'LeglVogt2013';

data.Ri  = 40/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-20 eggs per clutch, 4 clutches per yr; clutch sizes over 15, however, were not common';
 
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hb only'; 
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males may be somewhat  smaller on average';
metaData.bibkey.F1 = 'iucn'; 
F2 = 'totally herbivorous';
metaData.bibkey.F2 = 'EoL'; 
F3 = 'incubation above 28 C give females, 25-26 C males';
metaData.bibkey.F3 = 'iucn'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '34WTX'; % Cat of Life
metaData.links.id_ITIS = '202127'; % ITIS
metaData.links.id_EoL = '815713'; % Ency of Life
metaData.links.id_Wiki = 'Dermatemys_mawii'; % Wikipedia
metaData.links.id_ADW = 'Dermatemys_mawii'; % ADW
metaData.links.id_Taxo = '48377'; % Taxonomicon
metaData.links.id_WoRMS = '1453448'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Dermatemys&species=mawii'; % ReptileDB
metaData.links.id_AnAge = 'Dermatemys_mawii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermatemys_mawii}}';
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
bibkey = 'LeglVogt2013'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {J. M. Legler and R. C. Vogt}, ' ...
'year = {2013}, ' ...
'title  = {Turtles of Mexico; land and freshwater forms}, ' ...
'publisher = {Univ. of Calif. Press, Berkeley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dermatemys_mawii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/815713/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/6493/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'encyclopedia'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.encyclopedia.com/environment/encyclopedias-almanacs-transcripts-and-maps/central-american-river-turtles-dermatemydidae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

