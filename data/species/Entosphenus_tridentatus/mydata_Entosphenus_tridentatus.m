function [data, auxData, metaData, txtData, weights] = mydata_Entosphenus_tridentatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Entosphenus_tridentatus'; 
metaData.species_en = 'Pacific lamprey'; 

metaData.ecoCode.climate = {'MC','BWh','Csa'};
metaData.ecoCode.ecozone = {'MPN','TH'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bpD','piTvf','piTvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(11); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 14];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 14]; 

%% set data
% zero-variate data;
data.ab = 11;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'YamaFuku2003';   
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(11); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'purberty is assumed to coincide with ammocoete stage, but the length of this stgae is very variable';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 14.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'DockBeam1994';
data.Li  = 76;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.6e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'YamaFuku2003';
  comment.Wwb = 'based on egg length of 1.249 mm and width of 1.145 mm: pi/6*0.1249*0.1145^2';
data.Wwp = 3.58;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00120*Lp^3, see F2)';
data.Wwi = 526;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00120*Li^3, see F2)';

data.NR  = 238400;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(11); units.temp.NR = 'K'; label.temp.NR = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
D2 = 'time since birth at puberty was ignorned because it is very variable';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, parasitic stage present';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Ammocoetes stay in freshwater upt 7 yrs, then migrate to sea, returning to spawn and die';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6FFWG'; % Cat of Life
metaData.links.id_ITIS = '159699'; % ITIS
metaData.links.id_EoL = '46582336'; % Ency of Life
metaData.links.id_Wiki = 'Entosphenus_tridentatus'; % Wikipedia
metaData.links.id_ADW = 'Entosphenus_tridentatus'; % ADW
metaData.links.id_Taxo = '41674'; % Taxonomicon
metaData.links.id_WoRMS = '314348'; % WoRMS
metaData.links.id_fishbase = 'Entosphenus-tridentatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Entosphenus_tridentatus}}';  
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
bibkey = 'YamaFuku2003'; type = 'article'; bib = [ ...  
'author = {Yuji Yamazaki and Norio Fukutomi and Korenori Takeda and Akihisa Iwata}, ' ...
'year = {2003}, ' ...
'title  = {Embryonic Development of the {P}acific Lamprey, \emph{Entosphenus tridentatus}}, ' ...
'journal = {ZOOLOGICAL SCIENCE}, ' ...
'volume = {20}, ' ...
'page = {1095-1098}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DockBeam1994'; type = 'article'; bib = [ ...  
'author = {Margaret F. Docker and F. William H. Beamish}, ' ...
'year = {}, ' ...
'title  = {Age, growth, and sex ratio among populations of least brook lamprey, \emph{Lampetra aepyptera}, larvae: an argument for environmental sex determination}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'page = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Entosphenus-tridentatus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
