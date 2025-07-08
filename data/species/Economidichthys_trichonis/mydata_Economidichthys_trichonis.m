function [data, auxData, metaData, txtData, weights] = mydata_Economidichthys_trichonis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Economidichthys_trichonis'; 
metaData.species_en = 'Caucasian dwarf goby'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'jiFl'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 14];

%% set data
% zero-variate data

data.am = 1.75*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 3.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'fishbase';

data.Wwb = 1.13e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DaouEcon1993';
  comment.Wwb = 'based on egg length 0.64 mm, width 0.58 mm: pi/6*0.064*0.058^2'; 
data.Wwp = 0.058; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.04, see F1';
data.Wwi = 0.276; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.04, see F1';

data.Ni  = 2e3; units.Ni  = '#';label.Ni  = 'total fecundity'; bibkey.Ni = 'DaouEcon1993';
  comment.Ni = 'reproduces onceonly, but eggs in nests might be from several females';

% uni-variate data
% time-length
data.tL = [... %  yr class (d), std length (cm)
 90	1.339
120	1.456
150	1.522
210	1.537
240	1.832
241	1.934
300	2.255
360	2.396
420	2.512
450	2.706
510	2.773];
data.tL(:,1) = data.tL(:,1)+20; % set origin at guessed birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DaouEcon1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.00977*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the oligotrophic Lake Trichonis, western Greece';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '38NT5'; % Cat of Life
metaData.links.id_ITIS = '637246'; % ITIS
metaData.links.id_EoL = '212544'; % Ency of Life
metaData.links.id_Wiki = 'Economidichthys_trichonis'; % Wikipedia
metaData.links.id_ADW = 'Economidichthys_trichonis'; % ADW
metaData.links.id_Taxo = '173496'; % Taxonomicon
metaData.links.id_WoRMS = '1011434'; % WoRMS
metaData.links.id_fishbase = 'Economidichthys-trichonis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Economidichthys_trichonis}}';
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
bibkey = 'DaouEcon1993'; type = 'Article'; bib = [ ... 
'author = {Ch. Daoulas and A. N. Economou and Th. Psarras and R. Barbieri-Tseliki}, ' ... 
'year = {1993}, ' ...
'title = {Reproductive strategies and early development of three freshwater gobies}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {42}, ' ...
'pages = {749-776}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GucuErdo2017'; type = 'Article'; bib = [ ... 
'author = {Salim Serkan G\"{u}\c{c}\"{u} and \"{O}mer Erdo\v{g}an}, ' ... 
'year = {2017}, ' ...
'title = {Age, growth, sex ratio and feeding of \emph{Knipowitschia caucasica} ({B}erg, 1916) ({A}ctinopterygii, {G}obiidae) in non-native species of {E}\v{g}irdir {L}ake ({T}urkey)}, ' ...
'journal = {Acta Biologica Turcica}, ' ...
'volume = {30}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Economidichthys-trichonis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

