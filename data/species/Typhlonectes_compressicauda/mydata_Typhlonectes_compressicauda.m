function [data, auxData, metaData, txtData, weights] = mydata_Typhlonectes_compressicauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Typhlonectidae';
metaData.species    = 'Typhlonectes_compressicauda'; 
metaData.species_en = 'Cayenne caecilian'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTva', 'jiCi', 'jiSvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ww_L'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 26];


%% set data
% zero-variate data

data.aj = 6*30.5;  units.aj = 'd';    label.aj = 'age at metam';                 bibkey.aj = 'ExbrDels1985';   
  temp.aj = C2K(29);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.tp = 16*30.5;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'ExbrDels1985';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 4.9 yr, but this seems short given ap=2yr and 2yr reproduction cycle';

data.Lb  = 1.7;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wake1980';  
  comment.Lb = '15 to 20 mm hatch from egg membrane for Dermophis mexicanus';
data.Lj  = 13.68;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'ExbrDels1985';  
  comment.Lj = 'coincides with leaving the mother';
data.Lp  = 30;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ExbrDels1985';
data.Lpm  = 28;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ExbrDels1985';
data.Li  = 55;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwj = 6;     units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'ExbrDels1985';
data.Wwp = 34.6;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Wake1980';
  comment.Wwp = 'based on Ww42*(L_p/42)^3';
data.Wwi = 213;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'ExbrDels1985';
  comment.Wwi = 'based on Ww42*(L_m/42)^3';
data.Ww42 = 95;    units.Ww42 = 'g';   label.Ww42 = 'wet weight female of TL 42 cm';      bibkey.Ww42 = 'ExbrDels1985';
data.Wwm41 = 84;    units.Wwm41 = 'g';   label.Wwm41 = 'wet weight male of TL 41.5 cm';      bibkey.Wwm41 = 'ExbrDels1985';

data.Ri  = 14/365/2;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 to 14 eggs per clutch, 1 clutch each other yr, but typically 4 young leave mother';

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous, young feed on maternal glandular secretions, scraping the inside of the oviduct';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Two vesiculous gills are present at the back of the dorsum of the head at birth; these fall off 24-48 h after birth and leave-a white scar that fades after some weeks';
metaData.bibkey.F2 = 'ExbrDels1985'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '59WWF'; % Cat of Life
metaData.links.id_ITIS = '668522'; % ITIS
metaData.links.id_EoL = '1019672'; % Ency of Life
metaData.links.id_Wiki = 'Typhlonectes_compressicauda'; % Wikipedia
metaData.links.id_ADW = 'Typhlonectes_compressicauda'; % ADW
metaData.links.id_Taxo = '48026'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Typhlonectes+compressicauda'; % AmphibiaWeb
metaData.links.id_AnAge = 'Typhlonectes_compressicauda'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Typhlonectes_compressicauda}}';
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
bibkey = 'ExbrDels1985'; type = 'Article'; bib = [ ...
'author = {Jean-Marie Exbrayat and Michel Delsol}, ' ... 
'year = {1985}, ' ...
'title = {Reproduction and Growth of \emph{Typhlonectes compressicaudus} - a viviparous {G}ymnophione}, ' ...
'journal = {Copeia}, ' ...
'volume = {1985}, ' ...
'pages = {950-955}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Typhlonectes_compressicauda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wake1980'; type = 'Article'; bib = [ ...
'author = {Marvalee H. Wake}, ' ... 
'year = {1980}, ' ...
'title = {Reproduction, Growth, and Population Structure of the {C}entral {A}merican Caecilian \emph{Dermophis mexicanus}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {36}, ' ...
'pages = {244-256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

