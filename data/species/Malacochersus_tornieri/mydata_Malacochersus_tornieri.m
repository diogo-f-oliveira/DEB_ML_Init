function [data, auxData, metaData, txtData, weights] = mydata_Malacochersus_tornieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Malacochersus_tornieri'; 
metaData.species_en = 'Pancake tortoise'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb' ; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 04];

%% set data
% zero-variate data

data.ab = 5*30.5;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4-6 mnth';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25.9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 4.07; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'EwerHatc2004';
data.L30 = 12.41; units.L30 = 'cm';   label.L30 = 'carapace length at 30 mnth since birth';   bibkey.L30 = 'EwerHatc2004';
  temp.L30 = C2K(27);  units.temp.L30 = 'K'; label.temp.L30 = 'temperature';
data.L30m = 11.25; units.L30m = 'cm';   label.L30m = 'carapace length at 30 mnth since birth for males';   bibkey.L30m = 'EwerHatc2004';
  temp.L30m = C2K(27);  units.temp.L30m = 'K'; label.temp.L30m = 'temperature';
data.L42 = 14.22; units.L42 = 'cm';   label.L42 = 'carapace length at 42 mnth since birth';   bibkey.L42 = 'EwerHatc2004';
  temp.L42 = C2K(27);  units.temp.L42 = 'K'; label.temp.L42 = 'temperature';
data.L42m = 14.05; units.L42m = 'cm';   label.L42m = 'carapace length at 42 mnth since birth for males';   bibkey.L42m = 'EwerHatc2004';
  temp.L42m = C2K(27);  units.temp.L42m = 'K'; label.temp.L42m = 'temperature';
data.Li = 15.16; units.Li = 'cm';   label.Li = 'ultimate carapace length';   bibkey.Li = 'EwerHatc2004';
data.Lim = 14.63; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'EwerHatc2004';

data.Wwb = 15; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'EwerHatc2004';
data.Ww30 = 233.5; units.Ww30 = 'g';   label.Ww30 = 'wet weight at 30 mnth since birth';   bibkey.Ww30 = 'EwerHatc2004';
  temp.Ww30 = C2K(27);  units.temp.Ww30 = 'K'; label.temp.Ww30 = 'temperature';
data.Ww30m = 242.5; units.Ww30m = 'g';   label.Ww30m = 'wet weight at 30 mnth since birth for males';   bibkey.Ww30m = 'EwerHatc2004';
  temp.Ww30m = C2K(27);  units.temp.Ww30m = 'K'; label.temp.Ww30m = 'temperature';
data.Ww42 = 332.4; units.Ww42 = 'g';   label.Ww42 = 'wet weight at 42 mnth since birth';   bibkey.Ww42 = 'EwerHatc2004';
  temp.Ww42 = C2K(27);  units.temp.Ww42 = 'K'; label.temp.Ww42 = 'temperature';
data.Ww42m = 327.0; units.Ww42m = 'g';   label.Ww42m = 'wet weight at 42 mnth since birth for males';   bibkey.Ww42m = 'EwerHatc2004';
  temp.Ww42m = C2K(27);  units.temp.Ww42m = 'K'; label.temp.Ww42m = 'temperature';
data.Wwi = 470.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EwerHatc2004';
data.Wwim = 405.10; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'EwerHatc2004';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, clutches each 4-8 weeks';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'If eggs develop below 29.8 C males hatch, above 29.8 C females';
metaData.bibkey.F1 = 'EwerHatc2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XKH4'; % Cat of Life
metaData.links.id_ITIS = '551812'; % ITIS
metaData.links.id_EoL = '1055886'; % Ency of Life
metaData.links.id_Wiki = 'Malacochersus_tornieri'; % Wikipedia
metaData.links.id_ADW = 'Malacochersus_tornieri'; % ADW
metaData.links.id_Taxo = '48676'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Malacochersus&species=tornieri'; % ReptileDB
metaData.links.id_AnAge = 'Malacochersus_tornieri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Malacochersus_tornieri}}';
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
bibkey = 'EwerHatc2004'; type = 'Article'; bib = [ ... 
'author = {Michael A. Ewert and Ronnie E. Hatcher and J. Michael Goode}, ' ... 
'year = {2004}, ' ...
'title = {Sex Determination and Ontogeny in \emph{Malacochersus tornieri}, the Pancake Tortoise}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {38(2)}, ' ...
'pages = {291-295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Malacochersus_tornieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

