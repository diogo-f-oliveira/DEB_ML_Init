  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_bovinus
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_bovinus'; 
metaData.species_en = 'Leon Springs pupfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab';  'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 28];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'sta@akvaplan.niva.no'};
metaData.date_acc    = [2020 07 28]; 

%% set data
% zero-variate data
data.ab = 6;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'EPA2002';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for c. variegatus';
data.tp = 6*30;        units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'Cripe2009';
  temp.tp = C2K(26.6); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'value for C. variegatus';
data.am = 23*30.5;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'Kenn1977';
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 3;     units.Lp = 'cm';     label.Lp = 'ultimate total length';  bibkey.Lp = 'Kenn1977';
data.Li = 5.6;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 1.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'JordEver1896';   
  comment.Wwb = 'based on egg diameter of 1.4 mm for C. variegatus: pi/6*0.14^3; Kenn1977 gives 0.4 mm, but eggs had maturity index 6 only';
data.Wwi = 3.82; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01072*Li^3.22, see discussion';
   
data.Ri = 800/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
D1 = 'weight length relationship: Ww in g = 0.01072 * (TL in cm)^3.22'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Interbreeds with C. variegatus';
  metaData.bibkey.F1 = 'GarrHubb2002';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33HLB'; % Cat of Life
metaData.links.id_ITIS = '165632'; % ITIS
metaData.links.id_EoL = '1012535'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_bovinus'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_bovinus'; % ADW
metaData.links.id_Taxo = '172738'; % Taxonomicon
metaData.links.id_WoRMS = '1021646'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-bovinus'; % fishbase


%% References
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{https://tpwd.texas.gov/huntwild/wild/species/leonspringspupfish/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinodon-bovinus.html}}';
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
bibkey = 'Kenn1977'; type = 'Article'; bib = [ ...
'author = {Stephen E. Kennedy}, ' ...
'year = {1977}, ' ...
'title = {Life History of the {L}eon {S}prings Pupfish, \emph{Cyprinodon bovinus}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1977(1)}, '...
'pages = {93-103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JordEver1896'; type = 'Book'; bib = [ ...    
'author = {Jordan, D. S. and Evermann, B. W.}, ' ...
'year  = {1896-1900}, ' ...
'title = {The fishes of North and Middle America: a descriptive catalogue of the species of fish-like vertebrates found in the waters of {N}orth {A}merica, north of the {I}sthmus of {P}anama}, ' ...  
'publisher = {Smithsonian Institution}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'GarrHubb2002'; type = 'Article'; bib = [ ...
'author = {Gary P. Garretta and Clark Hubbsb and Robert J. Edwardsc}, ' ...
'year = {2002}, ' ...
'title = {Threatened fishes of the world: \emph{Cyprinodon bovinus} {B}aird & {G}irard, 1853 ({C}yprinodontidae)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {64}, '...
'pages = {442}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cripe2009'; type = 'Article'; bib = [ ...  
'author = {Cripe, G. M. and Hemmer, B. L. and Goodman, L. R.}, ' ...
'year = {2008}, ' ...
'title = {Development of a Methodology for Successful Multigeneration Life-Cycle Testing of the Estuarine Sheepshead Minnow,  \emph{Cyprinodon variegatus}}, ' ... 
'journal = {Archives of Environmental Contamination and Toxicology}, ' ...
'volume = {56}, '...
'pages = {500--508}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EPA2002'; type = 'Techreport'; bib = [ ...
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title  = {Method 1004.0: Sheepshead Minnow, \emph{Cyprinodon variegatus}, Larval Survival and Growth Test; Chronic Toxicity}, ' ...
'institution = {EPA}, ' ...
'pages = {1--63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


