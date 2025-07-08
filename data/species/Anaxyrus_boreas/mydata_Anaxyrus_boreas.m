function [data, auxData, metaData, txtData, weights] = mydata_Anaxyrus_boreas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Anaxyrus_boreas'; 
metaData.species_en = 'Western toad'; 

metaData.ecoCode.climate = {'B', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTh', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 20];

%% set data
% zero-variate data

data.ab = 6;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 43;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'AnAge';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.4;  units.Lj  = 'mm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess'; 
  comment.Lj = 'based on Li*(Wwj/Wwi)^(1/3): 13*(0.115/92.9)^(1/3)';
data.Li  = 13;   units.Li  = 'mm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 11.5;   units.Lim  = 'mm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'guess';
  comment.Lim = 'based on Li*(Wwim/Wwi)^(1/3): 13*(64.6/92.9)^(1/3)';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 to 2 mm: pi/6*0.2^3';
data.Wwj = 0.115 ; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'ecotox';
data.Wwi = 92.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'ecotox';
data.Wwim = 64.6;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ecotox';
  
data.Ri  = 5200/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '5200 eggs/clutch; 1 clutch/year; ecotox gives 12000/yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time  since metam (d), weight (g)
  7	0.164 0.179 0.289 0.226
 14	0.288 0.468 0.406 0.304
 21	0.311 0.742 0.530 0.444
 28	NaN   0.827 0.717 0.561
 35	NaN   1.140 0.803 0.630
 42	NaN   1.358 0.912 0.559
 49	NaN   1.616 1.115 0.464
 56	NaN   2.046 1.176 0.346];
units.tW   = {'d', 'g'};  label.tW = {'time since metam', 'weight'}; 
temp.tW = C2K([33 27 20 14]); units.temp.tW = 'K'; label.temp.tW = 'temperature';
treat.tW = {1,{'33 C','27 C','20 C','14 C'}}; units.treat.tW = 'C'; label.treat.tW = 'temperature';
bibkey.tW = 'LillLich1973'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tj = 0 * weights.tj;
weights.Lj = 0 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DK9W'; % Cat of Life
metaData.links.id_ITIS = '773513'; % ITIS
metaData.links.id_EoL = '1039204'; % Ency of Life
metaData.links.id_Wiki = 'Anaxyrus_boreas'; % Wikipedia
metaData.links.id_ADW = 'Anaxyrus_boreas'; % ADW
metaData.links.id_Taxo = '988887'; % Taxonomicon
metaData.links.id_WoRMS = '1486704'; % WoRMS
metaData.links.id_amphweb = 'Anaxyrus+boreas'; % AmphibiaWeb
metaData.links.id_AnAge = 'Anaxyrus_boreas'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anaxyrus_boreas}}';
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
bibkey = 'LillLich1973'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1934345}, ' ...
'author = {Lillywhite, H. B. and Licht, P. and Chelgren, P.}, ' ... 
'year = {1973}, ' ...
'title = {The Role of Behavioral Thermoregulation in the Growth Energetics of the Toad, \emph{Bufo boreas}}, ' ...
'journal = {Ecology}, ' ...
'volume = {54(2)}, ' ...
'pages = {375–383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?scientific_name=Anaxyrus+boreas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Anaxyrus_boreas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ecotox'; type = 'Misc'; bib = ...
'howpublished = {\url{https://ecotox.oehha.ca.gov/species/amphibians-frogs-and-toads-anura/western-toad-anaxyrus-boreas-formerly-bufo-boreas/boreal}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

