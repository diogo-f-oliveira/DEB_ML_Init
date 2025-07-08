function [data, auxData, metaData, txtData, weights] = mydata_Chelus_fimbriata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Chelus_fimbriata'; 
metaData.species_en = 'Mata mata'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 07];

%% set data
% zero-variate data

data.ab = 208;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'Prit2008';
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.am = 35.8*365;     units.am = 'd';    label.am = 'life span';                      bibkey.am = 'AnAge';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L0 = 3.5; units.L0 = 'cm';   label.L0 = 'egg diameter';               bibkey.L0 = 'Prit2008';
data.Lb = 4.9; units.Lb = 'cm';   label.Lb = 'carapace length at birth';               bibkey.Lb = 'Prit2008';
data.Lp = 33.3; units.Lp = 'cm';    label.Lp = 'carapace length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'guess based on same relative length, compared to Hydromedusa_maximiliani: 44.7*8.8/11.8';
data.Li = 44.7; units.Li = 'cm';   label.Li = 'ultimate carapace length';  bibkey.Li = 'Prit2008';
  comment.Li = 'largest reported: 52.6 cm';
data.L274 = 27; units.L274 = 'cm';  label.L274 = 'carapace length at 274 d since L = 8 cm'; bibkey.L274 = 'Prit2008';

data.Wwb = 15; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Prit2008';
data.Wwi = 11700; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                bibkey.Wwi = 'Prit2008';
  comment.Wwi = 'largest reported: 17.7 kg';
data.Ww61 = 30; units.Ww61 = 'g';   label.Ww61 = 'wet weight at 61 d since birth';     bibkey.Ww61 = 'Prit2008';
  temp.Ww61 = C2K(28);  units.temp.Ww61 = 'K'; label.temp.Ww61 = 'temperature';
data.Ww122 = 60; units.Ww122 = 'g';   label.Ww122 = 'wet weight at 122 d since birth'; bibkey.Ww122 = 'Prit2008';
  temp.Ww122 = C2K(28);  units.temp.Ww122 = 'K'; label.temp.Ww122 = 'temperature';

data.Ri  = 32/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'Prit2008';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), carapace length (cm)
5   28.1
5.5 18.6
10 38.8
11 37.5
11 39.1
12 38
13 43.8
14 37.4
15 40
15 44.1
16 37.9
18 40.8
20 43.5
20 46.4];
data.tL(:,1) = data.tL(:,1) * 365; % convert d to yr
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Prit2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;

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

%% Facts
F1 = 'Males may be somewhat smaller on average';
metaData.bibkey.F1 = 'Prit2008'; 
F2 = 'Specialized in fish eating';
metaData.bibkey.F2 = 'Prit2008'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '87WF9'; % Cat of Life
metaData.links.id_ITIS = '208721'; % ITIS
metaData.links.id_EoL = '53573846'; % Ency of Life
metaData.links.id_Wiki = 'Chelus_fimbriata'; % Wikipedia
metaData.links.id_ADW = 'Chelus_fimbriata'; % ADW
metaData.links.id_Taxo = '4196212'; % Taxonomicon
metaData.links.id_WoRMS = '1358275'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chelus&species=fimbriata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelus_fimbriata}}';
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
bibkey = 'Prit2008'; type = 'Incollection'; bib = [ ... 
'author = {P. C. H. Prithard}, ' ... 
'year = {2008}, ' ...
'title = {\emph{Chelus frimbriata} ({S}chneider 1783) - Matamata Turtle}, ' ...
'booktitle = {Conservation Biology of Freshwater Turtles and Tortoises: A Compliation Project of the IUCN/SSC Tortoise and Freshwater Turtle Specialist Group}, ' ...
'editor = {A. G. J. Rhodin and P. C. H. Pritchard and P. P. van Dijk and R. A. Saumure and K. A. Buhlmann and J. B. Iverson}, ' ...
'publisher = {Chelonian Research Foundation and Turtle Conservation; Chelonian Research Monographs}, ' ...
'volume = {5}, ' ...
'doi = {10.3854/crm.5.0230.fimbriata.v1.2008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chelus_fimbriatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

